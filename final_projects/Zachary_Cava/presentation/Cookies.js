// CSE 190 M Cookies class
// by Marty Stepp
//
// This is a helper class for manipulating cookies in JavaScript.
// It has the following methods:
//
// boolean Cookies.exists(string name)
// returns true if you have set a cookie with the given name, otherwise false
//
// string Cookies.get(string name)
// returns the value for the cookie with the given name (null if not found)
//
// void Cookies.remove(string name)
// deletes the cookie with the given name, if it exists
//
// void Cookies.set(string name, string value)
// sets a cookie for the given name, replacing any prior value
//
// void Cookies.remember(HTMLElement element, string cookieName)
// Remembers the given element (checkbox, radio button, select, text box) state
// using the given cookie name.  If the client returns to the page, the element
// will restore its state.  If cookieName is omitted, chosen automatically.


/** Cookie class stores things related to cookies. */
function Cookies() {}

/** Returns true if a cookie exists with the given name. */
Cookies.exists = function(name) {
    return Cookies.get(name) !== null;
};

/** Returns the value of the cookie with the given name (null if not found). */
Cookies.get = function(name) {
    if (!name) {
        throw "Cookies.js: cookie name cannot be null or empty";
    }
    
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1, c.length);
        }
        if (c.indexOf(nameEQ) == 0) {
            return unescape(c.substring(nameEQ.length, c.length));
        }
    }
    return null;
};

/** Removes the cookie with the given name. */
Cookies.remove = function(name) {
    Cookies.set(name, "", -1);
};

/** Sets the cookie with the given name to have the given value.
 *  Taken from http://www.quirksmode.org/js/cookies.html
 */
Cookies.set = function(name, value, days) {
    if (!name) {
        throw "Cookies.js: cookie name cannot be null or empty";
    }
    
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    } else {
        var expires = "";
    }
    value = escape(value);
    document.cookie = name + "=" + value + expires + "; path=/";
};


/** 
 * Turns the given HTML DOM element into one that will remember its
 * state (value, checked-ness, etc.), using a cookie with the given name.
 * If the client returns to this page later, the element will restore its state.
 *
 * Works with the following DOM element types:
 * <input type="checkbox" />         - remembers whether box is checked
 * <input type="text" />
 * <input type="password" />         - remembers the text typed into the box
 * <textarea>...</textarea>
 * <select>...</select>              - remembers which option has been selected
 * <input type="radio" name="..." /> - remembers which radio button is selected
 *
 * When used with radio buttons, this needs to be called on only one of the
 * buttons in a particular 'name' group; it'll attach to the others too.
 *
 * element can be a string id or an HTML DOM element object.
 * If no cookieName is passed, one is chosen automatically based on
 * the element's id or name attribute.
 */
Cookies.remember = function(element, cookieName) {
    // resolve true element and cookie name to use
    element = Cookies.resolveElement(element);
    if (!element) {
        throw "Cookies.js: element cannot be undefined or null";
    }
    cookieName = Cookies.resolveName(element, cookieName);
    if (!cookieName) {
        throw "Cookies.js: cookie name cannot be undefined, null, or empty";
    }
    
    var tag = element.tagName.toLowerCase();
    var type = element.type;
    if (tag == "textarea" || 
            (tag == "input" && (!type || type == "text" || type == "password")) ||
            tag == "select") {
        // text box (single or multi line), or select box
        // (an element that wants me to remember its 'value' property)
        if (Cookies.exists(cookieName)) {
            // retrieve saved value from cookie
            element.value = Cookies.get(cookieName);
        }
        // set up event handler so that new values will be remembered in cookie
        Cookies.addEventListener(element, "change", function(event) {
            Cookies.set(cookieName, this.value, 999);
        });
    }
    else if (tag == "input" && type == "checkbox") {
        // checkbox (must remember its 'checked' property)
        if (Cookies.exists(cookieName)) {
            // retrieve saved checked value from cookie
            var shouldBeChecked = (Cookies.get(cookieName) == "true");
            if (element.checked != shouldBeChecked) {
                // if the element has an onclick handler, run it
                if (!element.disabled && element.onclick) {
                    element.onclick();
                }
                element.checked = shouldBeChecked;
            }
        }

        // set up event handler so that new checking will be remembered
        Cookies.addEventListener(element, "change", function(event) {
            Cookies.set(cookieName, this.checked ? "true" : "false", 999);
        });
    }
    else if (tag == "input" && type == "radio") {
        // radio button (must remember the 'value' property and manage a group)
        buttons = document.getElementsByName(element.name);
        for (var i = 0; i < buttons.length; i++) {
            if (Cookies.exists(cookieName)) {
                var cookieValue = Cookies.get(cookieName);
                
                // set saved checked value from cookie
                var shouldBeChecked = ((!buttons[i].value && cookieValue == "on") || cookieValue == buttons[i].value);
                if (element.checked != shouldBeChecked) {
                    // if the element has an onclick handler, run it
                    if (!buttons[i].disabled && buttons[i].onclick) {
                        buttons[i].onclick();
                    }
                    buttons[i].checked = shouldBeChecked;
                }
            }

            // set up event handler so that new checking will be remembered
            // (must set up the listener on all radio buttons by name)
            Cookies.addEventListener(buttons[i], "change", function(event) {
                // every time one of the radio buttons is changed,
                // must also re-remember the cookie values of all the others
                Cookies.set(cookieName, this.value, 999);
            });
        }
    } else {
        throw "Cookies.js: Unsupported DOM element " + tag + ": " + element;
    }
}

/** Helper for adding event listeners. */
Cookies.addEventListener = function(element, event, fn) {
    if (!element) {
        return;
    }
    if (element.addEventListener) {
        element.addEventListener(event, fn, false);
    } else if (element.attachEvent) {  // IE sucks
        element.attachEvent("on" + event, fn);
    } else {
        element["on" + event] = fn;
    }
};

/**
 * Helper for resolving an HTML DOM element.
 * This allows the client to pass a string ID or a DOM element object.
 */
Cookies.resolveElement = function(element) {
    if (!element) {
        return null;
    } else if (typeof(element) == "string") {
        if (document.body) {
            return document.getElementById(element);
        } else {
            throw "Cookies.js: document.body hasn't been created yet; you must wait for window.onload to attach cookies to DOM elements";
        }
    } else if (!element.parentNode) {
        throw "Cookies.js: not a valid HTML DOM element: " + element;
    } else {
        return element;
    }
}

/**
 * Helper for resolving a cookie name.
 * This allows the caller to leave the cookie name blank and we will
 * automatically set it based on the name or id attribute of the element.
 */
Cookies.resolveName = function(element, cookieName) {
    if (cookieName) {
        return cookieName;
    } else if (!element) {
        return null;
    } else {
        element = Cookies.resolveElement(element);
        if (!element) {
            return null;
        } if (element.type == "radio" && element.name) {
            // use form query parameter name for radio buttons
            return "__cookies_js_" + element.name;
        } else if (element.id) {
            // try id first because ids must be unique on the page
            return "__cookies_js_" + element.id;
        } if (element.name) {
            // try form query parameter name
            return "__cookies_js_" + element.name;
        } else {
            return null;
        }
    }
}

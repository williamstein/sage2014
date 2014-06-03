// S5 v1.1 slides.js -- released into the Public Domain
//
// Please see http://www.meyerweb.com/eric/tools/s5/credits.html for information 
// about all the wonderful and talented contributors to this code!

var INDENT = "    ";
var DRAWING = false;

var undef;
var slideCSS = '';
var snum = 0;
var smax = 1;
var incpos = 0;
var number = undef;
var s5mode = true;
var defaultView = 'slideshow';
var controlVis = 'visible';

var isIE = navigator.appName == 'Microsoft Internet Explorer' && navigator.userAgent.indexOf('Opera') < 1 ? 1 : 0;
var isOp = navigator.userAgent.indexOf('Opera') > -1 ? 1 : 0;
var isGe = navigator.userAgent.indexOf('Gecko') > -1 && navigator.userAgent.indexOf('Safari') < 1 ? 1 : 0;

function hasClass(object, className) {
    if (!object.className) return false;
    return (object.className.search('(^|\\s)' + className + '(\\s|$)') != -1);
}

function hasValue(object, value) {
    if (!object) return false;
    return (object.search('(^|\\s)' + value + '(\\s|$)') != -1);
}

function removeClass(object,className) {
    if (!object) return;
    object.className = object.className.replace(new RegExp('(^|\\s)'+className+'(\\s|$)'), RegExp.$1+RegExp.$2);
}

function addClass(object,className) {
    if (!object || hasClass(object, className)) return;
    if (object.className) {
        object.className += ' '+className;
    } else {
        object.className = className;
    }
}

function GetElementsWithClassName(elementName,className) {
    var allElements = document.getElementsByTagName(elementName);
    var elemColl = new Array();
    for (var i = 0; i< allElements.length; i++) {
        if (hasClass(allElements[i], className)) {
            elemColl[elemColl.length] = allElements[i];
        }
    }
    return elemColl;
}

function isParentOrSelf(element, id) {
    if (element == null || element.nodeName=='BODY') return false;
    else if (element.id == id) return true;
    else return isParentOrSelf(element.parentNode, id);
}

function nodeValue(node) {
    var result = "";
    if (node.nodeType == 1) {
        var children = node.childNodes;
        for (var i = 0; i < children.length; ++i) {
            result += nodeValue(children[i]);
        }       
    }
    else if (node.nodeType == 3) {
        result = node.nodeValue;
    }
    return(result);
}

var slideIndexMap = [];

function slideLabel() {
    var slideColl = GetElementsWithClassName('*', 'slide');
    var list = document.getElementById('jumplist');
    smax = slideColl.length;
    var optionCount = 0;
    for (var n = 0; n < smax; n++) {
        var obj = slideColl[n];

        obj.setAttribute('id', 'slide' + n);
        // if (isOp) continue;

        var otext = '';
        var menu = obj.firstChild;
        if (!menu) continue; // to cope with empty slides
        while (menu && menu.nodeType == 3) {
            menu = menu.nextSibling;
        }
        if (!menu) continue; // to cope with slides with only text nodes

        var menunodes = menu.childNodes;
        for (var o = 0; o < menunodes.length; o++) {
            otext += nodeValue(menunodes[o]);
        }
        
        var value = n + ' : '  + otext;
        if (hasClass(obj, 'titleslide') || hasClass(obj, 'lecturetitle')) {
//            var optgroup = document.createElement("optgroup");
//            optgroup.label = otext;
//            // list.options[list.length] = optgroup;
//            list.appendChild(optgroup);
//        } else {        
            // list.options[list.length] = new Option(n + ' : '  + otext, n);
            
            value = n + " : === " + otext + " ===";
        }
            
        var option = document.createElement("option");
        option.textContent = option.innerText = option.value = value;
        list.appendChild(option);
        slideIndexMap[n] = optionCount;
        optionCount++;
    }
}

function currentSlide() {
    var cs;
    if (document.getElementById) {
        cs = document.getElementById('currentSlide');
    } else {
        cs = document.currentSlide;
    }
    cs.innerHTML = '<span id="csHere">' + snum + '<\/span> ' + 
        '<span id="csSep">\/<\/span> ' + 
        '<span id="csTotal">' + (smax-1) + '<\/span>';
    if (snum == 0) {
        cs.style.visibility = 'hidden';
    } else {
        cs.style.visibility = 'visible';
    }

    if (snum == 0) {
        location.hash = "";
    } else {
        location.hash = "slide" + snum;
    }
}

function go(step) {
    if (document.getElementById('slideProj').disabled || step == 0) return;
    if (snum >= smax - 1 && step > 0) { return; }
    
    var jl = document.getElementById('jumplist');
    var cid = 'slide' + snum;
    var ce = document.getElementById(cid);
    if (incrementals[snum].length > 0) {
        for (var i = 0; i < incrementals[snum].length; i++) {
            removeClass(incrementals[snum][i], 'current');
            removeClass(incrementals[snum][i], 'incremental');
        }
    }
    if (step != 'j') {
        snum += step;
        lmax = smax - 1;
        if (snum > lmax) snum = lmax;
        if (snum < 0) snum = 0;
    } else
        snum = parseInt(jl.value);
    var nid = 'slide' + snum;
    var ne = document.getElementById(nid);
    if (!ne) {
        ne = document.getElementById('slide0');
        snum = 0;
    }
    if (step < 0) {incpos = incrementals[snum].length} else {incpos = 0;}
    if (incrementals[snum].length > 0 && incpos == 0) {
        for (var i = 0; i < incrementals[snum].length; i++) {
            if (hasClass(incrementals[snum][i], 'current'))
                incpos = i + 1;
            else
                addClass(incrementals[snum][i], 'incremental');
        }
    }
    if (incrementals[snum].length > 0 && incpos > 0)
        addClass(incrementals[snum][incpos - 1], 'current');
    ce.style.visibility = 'hidden';
    ne.style.visibility = 'visible';
    jl.selectedIndex = slideIndexMap[snum];
    
    if (DRAWING) {
        var currentOverlay = getCurrentDrawingOverlay();
        if (currentOverlay && $("enabledrawing")) {
            getCurrentDrawingOverlay().setVisible($("enabledrawing").checked);
        }
    }
    currentSlide();
    number = 0;
}

function goTo(target) {
    if (target >= smax || target < 0) return;
    if (target == snum) return;
    go(target - snum);
}

function subgo(step) {
    if (step > 0) {
        removeClass(incrementals[snum][incpos - 1],'current');
        removeClass(incrementals[snum][incpos], 'incremental');
        addClass(incrementals[snum][incpos],'current');
        incpos++;
    } else {
        incpos--;
        removeClass(incrementals[snum][incpos],'current');
        addClass(incrementals[snum][incpos], 'incremental');
        addClass(incrementals[snum][incpos - 1],'current');
    }
}

function toggle() {
    var slideColl = GetElementsWithClassName('*','slide');
    var slides = document.getElementById('slideProj');
    var outline = document.getElementById('outlineStyle');
    if (!slides.disabled) {
        slides.disabled = true;
        outline.disabled = false;
        s5mode = false;
        fontSize('1em');
        for (var n = 0; n < smax; n++) {
            var slide = slideColl[n];
            slide.style.visibility = 'visible';
        }
    } else {
        slides.disabled = false;
        outline.disabled = true;
        s5mode = true;
        for (var n = 0; n < smax; n++) {
            var slide = slideColl[n];
            slide.style.visibility = 'hidden';
        }
        slideColl[snum].style.visibility = 'visible';
        fontScale();
    }
}

function showHide(action) {
    var obj = GetElementsWithClassName('*','hideme')[0];
    if (!obj) return;
    switch (action) {
    case 's': obj.style.visibility = 'visible'; break;
    case 'h': obj.style.visibility = 'hidden'; break;
    case 'k':
        if (obj.style.visibility != 'visible') {
            obj.style.visibility = 'visible';
        } else {
            obj.style.visibility = 'hidden';
        }
    break;
    }
}

// returns true if the current key/mouse focus is on a text input component
function focusOnTextElement(event) {
    return event && event.srcElement && 
        window.HTMLTextAreaElement && window.HTMLInputElement &&
        window.HTMLSelectElement && window.HTMLOptionElement &&
        (event.srcElement instanceof HTMLTextAreaElement ||
         event.srcElement instanceof HTMLInputElement ||
         event.srcElement instanceof HTMLSelectElement ||
         event.srcElement instanceof HTMLOptionElement);
}

// 'keys' code adapted from MozPoint (http://mozpoint.mozdev.org/)
function keys(event) {
    event = standardizeEvent(event);
    var modifierKey = event.ctrlKey || event.altKey || event.metaKey;
    
    // don't process key events when text area is selected
    if (focusOnTextElement(event)) {
        return;
    }
    
    if (event && event.keyCode && event.keyCode != null && event.keyCode == 84) {  // t
        // *** commented out by Marty because I hate how it 
        // collides with my Firefox's Ctrl-T "new tab" hotkey
        //
        // toggle();
    } else if (s5mode) {
        switch (event.keyCode) {
            //case 10: // return
            //case 13: // enter
            case 68: // 'd'  for "draw" with red pen
                $("enabledrawing").checked = !$("enabledrawing").checked;
                $("enabledrawing").onclick();
                break;
            case 71: // 'g'
                if (window.event && isParentOrSelf(window.event.srcElement, 'controls')) return;
                if (event.srcElement && isParentOrSelf(event.srcElement, 'controls')) return;
                if(number != undef) {
                    // also set title bar href to an id anchor
                    goTo(number);
                    
                    break;
                }
            case 32: // spacebar
            case 34: // page down
            case 39: // rightkey
            case 40: // downkey
                if (!modifierKey) {
                    if(number != undef) {
                        go(number);
                    } else if (!incrementals[snum] || incpos >= incrementals[snum].length) {
                        go(1);
                    } else {
                        subgo(1);
                    }
                }
                break;
            case 33: // page up
            case 37: // leftkey
            case 38: // upkey
                if (!modifierKey) {
                    if(number != undef) {
                        go(-1 * number);
                    } else if (!incrementals[snum] || incpos <= 0) {
                        go(-1);
                    } else {
                        subgo(-1);
                    }
                }
                break;
            case 36: // home
                goTo(0);
                break;
            case 35: // end
                goTo(smax-1);
                break;
            case 67: // 'c'
                showHide('k');
                break;
        }
        if (event.keyCode < 48 || event.keyCode > 57) {
            number = undef;
        } else {
            if (window.event && isParentOrSelf(window.event.srcElement, 'controls')) return;
            if (event.srcElement && isParentOrSelf(event.srcElement, 'controls')) return;
            number = (((number != undef) ? number : 0) * 10) + (event.keyCode - 48);
        }
    }
    
    // *** returning false is some sort of magical signal to the
    // browser to stop its normal event propagation ... 
    // disabling this so that normal browser hotkeys e.g. ^R work
    // 
    // return false;
}

function clicker(e) {
    number = undef;
    var target;
    if (window.event) {
        target = window.event.srcElement;
        e = window.event;
    } else target = e.target;
    if (target.getAttribute('href') != null || hasValue(target.rel, 'external') || isParentOrSelf(target, 'controls') || isParentOrSelf(target,'embed') || isParentOrSelf(target,'object')) return true;
    if (!e.which || e.which == 1) {
        if (!incrementals[snum] || incpos >= incrementals[snum].length) {
            go(1);
        } else {
            subgo(1);
        }
    }
}

function findSlide(hash) {
    var target = null;
    var slides = GetElementsWithClassName('*','slide');
    for (var i = 0; i < slides.length; i++) {
        var targetSlide = slides[i];
        if ( (targetSlide.name && targetSlide.name == hash)
         || (targetSlide.id && targetSlide.id == hash) ) {
            target = targetSlide;
            break;
        }
    }
    while(target != null && target.nodeName != 'BODY') {
        if (hasClass(target, 'slide')) {
            return parseInt(target.id.slice(5));
        }
        target = target.parentNode;
    }
    return null;
}

function slideJump() {
    if (window.location.hash == null) return;
    var sregex = /^#slide(\d+)$/;
    var matches = sregex.exec(window.location.hash);
    var dest = null;
    if (matches != null) {
        dest = parseInt(matches[1]);
    } else {
        dest = findSlide(window.location.hash.slice(1));
    }
    if (dest != null)
        go(dest - snum);
}

function fixLinks() {
    var thisUri = window.location.href;
    thisUri = thisUri.slice(0, thisUri.length - window.location.hash.length);
    var aelements = document.getElementsByTagName('A');
    for (var i = 0; i < aelements.length; i++) {
        var a = aelements[i].href;
        var slideID = a.match('\#slide[0-9]{1,2}');
        if ((slideID) && (slideID[0].slice(0,1) == '#')) {
            var dest = findSlide(slideID[0].slice(1));
            if (dest != null) {
                if (aelements[i].addEventListener) {
                    aelements[i].addEventListener("click", new Function("e",
                        "if (document.getElementById('slideProj').disabled) return;" +
                        "go("+dest+" - snum); " +
                        "if (e.preventDefault) e.preventDefault();"), true);
                } else if (aelements[i].attachEvent) {
                    aelements[i].attachEvent("onclick", new Function("",
                        "if (document.getElementById('slideProj').disabled) return;" +
                        "go("+dest+" - snum); " +
                        "event.returnValue = false;"));
                }
            }
        }
    }
}

function externalLinks() {
    if (!document.getElementsByTagName) return;
    var anchors = document.getElementsByTagName('a');
    for (var i=0; i<anchors.length; i++) {
        var anchor = anchors[i];
        if (anchor.getAttribute('href') && hasValue(anchor.rel, 'external')) {
            anchor.target = '_blank';
            addClass(anchor,'external');
        }
    }
}

function createControls() {
    var controlsDiv = document.getElementById("controls");
    if (!controlsDiv) return;
    // var hider = ' onmouseover="showHide(\'s\');" onmouseout="showHide(\'h\');"';
    var hider = '';
    var hideDiv, hideList = '';
    if (controlVis == 'hidden') {
        hideDiv = hider;
    } else {
        hideList = hider;
    }
    controlsDiv.innerHTML = '<form action="#" id="controlForm"' + hideDiv + '>' +
    '<div id="navLinks">' +
    //"<label for='enabledrawing'><input type='checkbox' id='enabledrawing' onclick='enableDrawingClick(this);' />" + 
    // "<img src='images/redpen.gif' alt='pen' title='draw on slide with red pen' style='width: 24px; height: 24px; margin-right: 10px;' /></label>" +
//  '<input type='checkbox' name='enableHighlighter' value='enableHighlighter' id='enableHighlighter' onclick='enableHighlighter_onclick(this);' />' + 
//    '<label for='enableHighlighter'><img src='images/highlight.gif' alt='highlight' title='Highlighter' style="width: 32px; height: 32px; margin-right: 20px;" onclick='enableHighlighter_onclick(this);' /></label>' +
    '<div id="navaLinks">' +
    '<a accesskey="t" id="toggle" title="Print View" href="javascript:toggle();">&#216;<\/a>' +
    '<a accesskey="z" id="prev" title="Previous Slide" href="javascript:go(-1);">&laquo;<\/a>' +
    '<a accesskey="x" id="next" title="Next Slide" href="javascript:go(1);">&raquo;<\/a></div>' + 
    '<div id="navList"' + hideList + '><select id="jumplist" onchange="go(\'j\');"><\/select><\/div>' +
    '<\/div><\/form>';
    if (controlVis == 'hidden') {
        var hidden = document.getElementById('navLinks');
    } else {
        var hidden = document.getElementById('jumplist');
    }
    // *** commented out by marty so that controls will always show
    // addClass(hidden,'hideme');
}

function fontScale() {  // causes layout problems in FireFox that get fixed if browser's Reload is used; same may be true of other Gecko-based browsers
    if (!s5mode) return false;
    var vScale = 22;  // both yield 32 (after rounding) at 1024x768
    var hScale = 32;  // perhaps should auto-calculate based on theme's declared value?
    if (window.innerHeight) {
        var vSize = window.innerHeight;
        var hSize = window.innerWidth;
    } else if (document.documentElement.clientHeight) {
        var vSize = document.documentElement.clientHeight;
        var hSize = document.documentElement.clientWidth;
    } else if (document.body.clientHeight) {
        var vSize = document.body.clientHeight;
        var hSize = document.body.clientWidth;
    } else {
        var vSize = 700;  // assuming 1024x768, minus chrome and such
        var hSize = 1024; // these do not account for kiosk mode or Opera Show
    }
    var newSize = Math.min(Math.round(vSize/vScale),Math.round(hSize/hScale));

    // *** added by Marty to avoid scaling if possible
    // if (newSize >= 28) { return; }
    newSize = Math.min(newSize, 28);

    fontSize(newSize + 'px');
    
    if (isGe) {  // hack to counter incremental reflow bugs
        var obj = document.getElementsByTagName('body')[0];
        obj.style.display = 'none';
        obj.style.display = 'block';
    }
}

function fontSize(value) {
    if (!(s5ss = document.getElementById('s5ss'))) {
        if (!isIE) {
            document.getElementsByTagName('head')[0].appendChild(s5ss = document.createElement('style'));
            s5ss.setAttribute('media','screen, projection');
            s5ss.setAttribute('id','s5ss');
        } else {
            document.createStyleSheet();
            document.s5ss = document.styleSheets[document.styleSheets.length - 1];
        }
    }
    if (!isIE) {
        while (s5ss.lastChild) s5ss.removeChild(s5ss.lastChild);
        s5ss.appendChild(document.createTextNode('body {font-size: ' + value + ' !important;}'));
    } else {
        document.s5ss.addRule('body','font-size: ' + value + ' !important;');
    }
}

function notOperaFix() {
    slideCSS = document.getElementById('slideProj').href;
    var slides = document.getElementById('slideProj');
    var outline = document.getElementById('outlineStyle');
    slides.setAttribute('media','screen');
    outline.disabled = true;
    if (isGe) {
        slides.setAttribute('href','null');   // Gecko fix
        slides.setAttribute('href',slideCSS); // Gecko fix
    }
    if (isIE && document.styleSheets && document.styleSheets[0]) {
        document.styleSheets[0].addRule('img', 'behavior: url(ui/default/iepngfix.htc)');
        document.styleSheets[0].addRule('div', 'behavior: url(ui/default/iepngfix.htc)');
        document.styleSheets[0].addRule('.slide', 'behavior: url(ui/default/iepngfix.htc)');
    }
}

function getIncrementals(obj) {
    var incrementals = new Array();
    if (!obj) 
        return incrementals;
    var children = obj.childNodes;
    for (var i = 0; i < children.length; i++) {
        var child = children[i];
        if (hasClass(child, 'incremental')) {
            if (child.nodeName == 'OL' || child.nodeName == 'UL') {
                removeClass(child, 'incremental');
                for (var j = 0; j < child.childNodes.length; j++) {
                    if (child.childNodes[j].nodeType == 1) {
                        addClass(child.childNodes[j], 'incremental');
                    }
                }
            } else {
                incrementals[incrementals.length] = child;
                removeClass(child,'incremental');
            }
        }
        if (hasClass(child, 'show-first')) {
            if (child.nodeName == 'OL' || child.nodeName == 'UL') {
                removeClass(child, 'show-first');
                if (child.childNodes[isGe].nodeType == 1) {
                    removeClass(child.childNodes[isGe], 'incremental');
                }
            } else {
                incrementals[incrementals.length] = child;
            }
        }
        incrementals = incrementals.concat(getIncrementals(child));
    }
    return incrementals;
}

function createIncrementals() {
    var incrementals = new Array();
    for (var i = 0; i < smax; i++) {
        incrementals[i] = getIncrementals(document.getElementById('slide'+i));
    }
    return incrementals;
}

function defaultCheck() {
    var allMetas = document.getElementsByTagName('meta');
    for (var i = 0; i< allMetas.length; i++) {
        if (allMetas[i].name == 'defaultView') {
            defaultView = allMetas[i].content;
        }
        if (allMetas[i].name == 'controlVis') {
            controlVis = allMetas[i].content;
        }
    }
}

// Key trap fix, new function body for trap()
function trap(e) {
    e = standardizeEvent(e);
    modifierKey = e.ctrlKey || e.altKey || e.metaKey;
    return modifierKey || e.keyCode == 0;
}

var isDrawing = false;
var lastX = -1;
var lastY = -1;

function drawMouseDown(event) {
    event = standardizeEvent(event);
    // dump(event);
    
    if (event && event.button == 0) {
        // pen
        var cb = document.getElementById("enabledrawing");
        if (cb && cb.checked) {
            lastX = event.clientX;
            lastY = event.clientY;
            isDrawing = true;
        }
    
        // highlighter
        
        var HIGHLIGHT_COLOR = "yellow";
        var cb2 = document.getElementById("enableHighlighter");
        var element = event.srcElement;
        if (cb2 && element && element != cb2 && cb2.checked) {
            // stashes away old background color in fictitious 'oldBackgroundColor'
            // CSS attribute for later retrieval if necessary
            if (element.style.backgroundColor != HIGHLIGHT_COLOR) {
                if (element.style.backgroundColor) {
                    element.style.oldBackgroundColor = element.style.backgroundColor;
                } else {
                    element.style.oldBackgroundColor = "transparent";
                }
                element.style.backgroundColor = HIGHLIGHT_COLOR;
            }
        } else {
            if (element.style.oldBackgroundColor) {
                element.style.backgroundColor = element.style.oldBackgroundColor;
            }
        }
    }
}

function drawMouseUp(event) {
    event = standardizeEvent(event);
    if (event && event.button == 0) {
        lastX = -1;
        lastY = -1;
        isDrawing = false;
    }
}

function getSlideDiv(event) {
    event = standardizeEvent(event);
    if (isDrawing && event && event.srcElement) {
        var slideDiv = event.srcElement;
        while (
            (!(slideDiv instanceof HTMLDivElement) || slideDiv.className != "slide")
            && slideDiv.parentNode) {
            slideDiv = slideDiv.parentNode;
        }
        if (slideDiv instanceof HTMLDivElement && slideDiv.className == "slide") {
            return slideDiv;
        }
    }
}

// prints out all properties of the given object
function dump(obj) {
    var text = "";
    for (var prop in obj) {
        text += prop + "=" + obj[prop] + "\n";
    }
    alert(text);
}

function mouseWheelClicker(event) {
    event = standardizeEvent(event);

    // it appears that in Firefox, event.detail tells which direction to scroll
    // (positive = wheel scrolled down / go to next slide;
    //  negative = wheel scrolled up / go to previous slide)

	// it appears that Google Chrome uses event.wheelDeltaY instead of event.detail
	// (positive wheelDeltaY = scroll up (prev), negative = scroll down (next)

    if (s5mode && !focusOnTextElement(event)) {
		var props = "" + event;
		for (var prop in event) {
			if (typeof(event[prop]) !== "function") {
				props += " " + prop + "=" + event[prop];
			}
		}
		// alert(props);
		
        if ((typeof(event.detail) !== "undefined" && event.detail < 0)
				|| typeof(event.wheelDeltaY) !== "undefined" && event.wheelDeltaY > 0) {
            if (!incrementals[snum] || incpos == 0) {
                go(-1);      // previous slide
            } else {
                subgo(-1);
            }
        } else {
            if (!incrementals[snum] || incpos >= incrementals[snum].length) {
                go(1);       // next slide
            } else {
                subgo(1);
            }
        }

        if (typeof(event.stopPropagation) === "function") {
            event.stopPropagation();
        }
        return false;
    }
}

// Repairs various browser incompatibilities.
function standardizeEvent(event) {
    var e = event || window.event;
    // e.which = e.button || e.which;
    if (!e.keyCode) {
        try {
            e.keyCode = e.which;
        } catch (ex) {}
    }
    if (!e.srcElement) {
        try {
            e.srcElement = e.target;
        } catch (ex) {}
    }
    return e;
}

function fixExampleIndentation() {
    var elements = [];
    var examples = document.getElementsByTagName("pre");
    for (var i = 0; i < examples.length; i++) {
        var text = examples[i].innerHTML;
        text = text.replace(/\t/g, INDENT);
        examples[i].innerHTML = text;
    }
}

// Runs when the slides page first loads.
function startup() {
    defaultCheck();
    // if (!isOp) 
        createControls();
    slideLabel();
    fixLinks();
    externalLinks();

    fontScale();
    //if (!isOp) {
        notOperaFix();
    //}
    incrementals = createIncrementals();
    slideJump();
    if (defaultView == 'outline') {
        toggle();
    }

    // *** changed to onkeydown by Marty
    // document.onkeyup = keys;
    document.onkeydown = keys;

    // Marty is commenting out the 'trap' function that appears to destroy
    // all other keyboard input
    // (I want to be able to type in textarea boxes, etc.)

    // document.onkeypress = trap;

    // Marty Stepp has commented out left-mouse-click to advance slide;
    // I prefer to have the mouse be able to select text, click links, etc.
    // and go to the next slide with the keyboard (space, PgDn, etc.)

    // document.onclick = clicker;
    if (window.addEventListener) {
        window.addEventListener('DOMMouseScroll', mouseWheelClicker, false);
    }
    window.onmousewheel = document.onmousewheel = mouseWheelClicker;
    
    fixExampleIndentation();
    
    // size the fonts appropriately
    // setTimeout("fontScale();", 100);
    fontScale();

    if (DRAWING) {
        // for each slide, add canvas drawing overlay as a child
        var overlayHeight = screen.height;
        if ($("footer").offsetTop) {
            overlayHeight = $("footer").offsetTop;
        }

        var slides = GetElementsWithClassName("div", "slide");
        for (var i = 0; i < slides.length; i++) {
            if (typeof(DrawingOverlay) !== "undefined") {
                new DrawingOverlay(slides[i], overlayHeight);
            }
        }

        var currentOverlay = getCurrentDrawingOverlay();
        if (currentOverlay && $("enabledrawing")) {
            getCurrentDrawingOverlay().setVisible($("enabledrawing").checked);
        }
    }
}

window.onload = startup;

// window.onresize = function() {
//     setTimeout(fontScale, 100);
// }


function getCurrentDrawingOverlay() {
    var currentSlide = $("slide" + snum);
    if (!currentSlide) {
        currentSlide = $("slide0");
    }
    if (!currentSlide) return;
    
    var canvases = currentSlide.getElementsByTagName("canvas");
    for (var i = 0; i < canvases.length; i++) {
        if (canvases[i].className.match(/drawingoverlay/)) {
            return canvases[i].overlay;
        }
    }
    return null;
}

function enableDrawingClick(element) {
    var overlay = getCurrentDrawingOverlay();
    if (!overlay) {
        return;
    }
    
    overlay.clear();
    overlay.setVisible(element.checked);
}


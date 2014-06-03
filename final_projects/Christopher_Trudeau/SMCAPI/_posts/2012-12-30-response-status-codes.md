---
title: 'Response status codes'

layout: nil
---

### Success

When [searching for users](#/user-get-name) for example:

```{
    "users": [
        {
            "account_id": "213123123-db70-43e0-974a-e461b347a14b",
            "email": "cjt8@uw.edu",
            "first_name": "Christopher",
            "last_name": "Trudeau",
            "search": "chris trudeau"
        }
        {
            "account_id": "112233-db70-43e0-974a-e461b347a14b",
            "email": "trudeau.c@uw.edu",
            "first_name": "Chris",
            "last_name": "Trudeau",
            "search": "chris trudeau"
        }
    ]
}```  

```
{
"status": "ok"
}
```  

### Error

Error responses are simply returning [standard HTTP error codes](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html) along with some additional information:

* The error code is sent back as a status header,
* The body includes an object describing both the code and message (for debugging and/or display purposes),

For a call with an invalid authentication token for example:

```{
    "status": "error",
    "error": 'Access denied: invalid authentication token.'
}```

For a call with a token that does not have access to the request resource:

```{
    "status": "error",
    "error": 'Forbidden: your authentication key does not have access to this project.'
}```
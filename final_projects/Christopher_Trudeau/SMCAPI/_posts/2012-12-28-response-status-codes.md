---
title: 'Response status codes'

layout: nil
---

### Success

Successes differ from errors in that their body may not be a simple response object with a code and a message. The headers however are consistent across all calls:

* `GET`, `PUT` returns `200 OK` on success,
* `DELETE` returns `204 No Content` on success,
* `POST ` returns `201` on success,

When [retrieving a project](#/get-project) for example:

```Status: 200 OK```
```{
    id: "973066fd-b9cd-45dd-b663-3e5301e012e2", 
    { projects: [
        {
          "account_id": "25e2cae4-05c7-4c28-ae22-1e6d3d2e8bb5",
          "bup_location": "b9cd6c52-059d-44e1-ace0-be0a26568713",
          "collaborator": {"account_id": "03595161-726d-434c-8715-0478fc83ad5a", 
          "first_name": "William", "last_name": "Stein"},
          "description": "#480b #star",
          "last_edited": "1401150780000",
          "name": "math_480b___sage_2014___shared_project",
          "owner": {"account_id": "25e2cae4-05c7-4c28-ae22-1e6d3d2e8bb5", 
          "first_name": "Christopher", "last_name": "Trudeau"},
          "project_id":"4d8e463f-66e9-44b6-b9af-15207098d2c6",
          "public": "true",
          "title": "Math 480b - sage 2014 - shared project",
        }   
    ]
    }
}```    

### Error

Error responses are simply returning [standard HTTP error codes](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html) along with some additional information:

* The error code is sent back as a status header,
* The body includes an object describing both the code and message (for debugging and/or display purposes),

For a call with an invalid authentication token for example:

```Status: 401 Access denied```
```{
    code: 401,
    message: 'Access denied: invalid authentication token.'
}```

For a call with a token that does not have access to the request resource:

```Status: 403 Forbidden```
```{
    code: 403,
    message: 'Forbidden: your authentication key does not have access to this project.'
}```
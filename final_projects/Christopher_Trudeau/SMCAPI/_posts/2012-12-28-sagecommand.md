---
category: Commands
path: '/sagecommand'
title: 'Post a Sage Command'
type: 'POST'

layout: nil
---

Execute a [Sage](http://www.sagemath.org/) command inside of your project. This method allows you to find any [Sage Command inside the Sage Documentation](http://www.sagemath.org/help.html#SageStandardDoc) and get the results.

### Request

* Headers
    * x-smc-authorization a valid token

```{
    "sage": "factor(2006)"   
}```

### Response

```{
    "status": "ok"
    "sage_command_response": "2 * 17 * 59"
}```

For errors responses, see the [response status codes documentation](#response-status-codes).
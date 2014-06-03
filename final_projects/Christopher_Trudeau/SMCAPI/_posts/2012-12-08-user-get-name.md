---
category: user
path: '/user/{:name}'
title: 'Search for Users by name'
type: 'GET'

layout: nil
---

This method allows you to search for users in SageMathCloud. Using search you could add collaborators to projects.

### Request

* **`:name`** is the first/last name of the user you are searching for.
* The headers must include a **valid authentication token**.
* The body contains the name of the person you are interested in searching for.

####Body
```{
    "name":"<Name to search>",
}```

### Response

Sends back a collection of users found in SageMathCloud.

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

For errors responses, see the [response status codes documentation](#response-status-codes).
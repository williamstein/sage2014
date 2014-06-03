---
category: user
path: '/user/:name'
title: 'GET users by name'
type: 'GET'

layout: nil
---

This method allows the user to delete a project file by file ID.

### Request

* **`:name`** is the first/last name of the user you are searching for.
* The headers must include a **valid authentication token**.
* **The body is omitted**.

### Response

Sends back a collection of users.

```{
    account_id: "50d0741d-db70-43e0-974a-e461b347a14b",
    email: "cjt8@uw.edu",
    first_name: "Christopher",
    last_name: "Trudeau",
    search:"christopher trudeau"
}```

For errors responses, see the [response status codes documentation](#response-status-codes).
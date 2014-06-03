---
category: Project
path: '/projects/{:id}'
title: 'Delete a project'
type: 'DELETE'

layout: nil
---

This method allows you to delete a project available to your token. 

### Request

* **`:id`** is the id the thing to delete.
* The headers must include a **valid authentication token**.
* **The body is omitted**.

### Response

```{
    "message": 'Your project (id: 73232-213123) was deleted'
}```

For errors responses, see the [response status codes documentation](#response-status-codes).
---
category: file
path: '/files/{:id}'
title: 'Delete a file'
type: 'DELETE'

layout: nil
---

This method allows the user to delete a project file by file ID.

### Request

* **`:id`** is the id the file to delete see the [get files for how to get a file ID](#/files-get).
* The headers must include a **valid authentication token**.
* **The body is omitted**.

### Response

Sends back a collection of things.

```Status: 204 Deleted```
```{
    code: 204,
    message: 'Your file (id: 736) was deleted'
}```

For errors responses, see the [response status codes documentation](#response-status-codes).
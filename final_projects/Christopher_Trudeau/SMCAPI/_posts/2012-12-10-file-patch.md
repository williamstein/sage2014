---
category: file
path: '/files/{:id}'
title: 'Patch a file'
type: 'PATCH'

layout: nil
---

Similar to POST or PUT on files, this method allows the user to do a DIFF on a file to append new results to a file. 

### Request

* **`:id`** is the id the thing to delete.
* The headers must include a **valid authentication token**.
* **The body is omitted**.

### Response

Sends back a message of how the patch of the file went.

```{
    "message": "The patch was completed successfully",
	"URI": "https://cloud.sagemath.com/projects/<ProjectID>/file/<FileID>"
}```

OR

```{
	"status": "error",
    "message": "The patch failed, please retry",
}```

For errors responses, see the [response status codes documentation](#response-status-codes).
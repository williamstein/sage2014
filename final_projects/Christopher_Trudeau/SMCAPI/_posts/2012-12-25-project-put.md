---
category: Project
path: '/projects/{:id}'
title: 'Update a project'
type: 'PUT'

layout: nil
---

This method allows the user to update any of the properties of a project in SageMathCloud. 

### Request

* **`:id`** is the id of the project to update.
* The headers must include a **valid authentication token**.
* **The body can't be empty** and must include at least the name attribute, a `string` that will be used as the name of the thing.
* Parameters supported: 
1. bup_location (project server location)
2. description (description of project)
3. name (name of project)
4. public (visibility of project)
5. title (title of project)

### Headers
```X-smc-authorization: <API key from project>```

### Body Example
```{
    name: 'My new thing'
}```

### Response

Sends back a success message.

```{
	"message": "success/failure/etc"
}```

### Hidden feature

If you send an update request with the JSON body below, it will restart your project server if something has gone wrong. 

```
{
	"project": "restart"
}
```

### Response

```
{
	"status": "success"
}
```

For errors responses, see the [response status codes documentation](#response-status-codes).
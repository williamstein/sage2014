---
category: Project
path: '/projects'
title: 'Create Project'
type: 'POST'

layout: nil
---

This method allows users to create a new thing.

### Request

* The headers must include a **valid authentication token**.
* **The body can't be empty** and must include at least the name attribute, a `string` that will be used as the name of the thing.
* Parameters supported: 
1. **title** of the project (required)
2. **description** of the project (optional)
3. **public** visibility of the project (optional: defaults to private))

####Headers
```X-smc-authorization: <API key from project>```

####Body
```{
    "title":"<Title of Project>",
    "description":"<description of project>",
    "public":"<visibility {public or private}>"
}```

### Response

**If it succeeds**, returns the created project and a URI to use the 'GET' project API.

```{
    "project_id": "4d421231-66e9-44b6-b9af-15207098d2c6",
    "project_url": "https://cloud.sagemath.com/project/4d421231-44b6-b9af-15207098d2c6"
}```

For errors responses, see the [response status codes documentation](#response-status-codes).

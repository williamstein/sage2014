---
category: Project
path: '/projects'
title: 'Get list of Projects'
type: 'GET'

layout: nil
---

This will return to you the list of projects that are available to your authentication token.

### Request

* The headers must include a **valid authentication token**.
* The body is **omitted**.

### Response

Sends back a JSON array of projects. 

```{
    "projects": [
        {
            "account_id": "2323242s-05c7-4c28-ae22-23233434",
            "bup_location": "3ew2323-059d-44e1-ace0-eb02918234",
            "collaborator": {
                "account_id": "234232-726d-422c-81325-0472313ad5a",
                "first_name": "Win",
                "last_name": "Li"
            },
            "description": "#480b #star",
            "last_edited": "1401150780000",
            "name": "math_480b___sage_2014___shared_project",
            "owner": {
                "account_id": "25213131-05c7-4c28-ae22-1e6d3d2e8bb5",
                "first_name": "Christopher",
                "last_name": "Trudeau"
            },
            "project_id": "4d421231-66e9-44b6-b9af-15207098d2c6",
            "public": "true",
            "title": "Math 480b - sage 2014 - shared project"
        },
        {
            "account_id": "2323242s-05c7-4c28-ae22-23233434",
            "bup_location": "3ew2323-059d-44e1-ace0-eb02918234",
            "collaborator": {
                "account_id": "234232-726d-422c-81325-0472313ad5a",
                "first_name": "William",
                "last_name": "Stein"
            },
            "description": "#480b #star",
            "last_edited": "1401150780000",
            "name": "math_480b___sage_2014___shared_project",
            "owner": {
                "account_id": "25213131-05c7-4c28-ae22-1e6d3d2e8bb5",
                "first_name": "Christopher",
                "last_name": "Trudeau"
            },
            "project_id": "4d421231-66e9-44b6-b9af-15207098d2c6",
            "public": "true",
            "title": "Math 480b - sage 2014 - shared project"
        }
    ]
}```  

For errors responses, see the [response status codes documentation](#response-status-codes).
---
path: '/login'
title: 'Authenticate'

layout: nil
---

### Where to retrive API Key

To Authenticate go to [SageMathCloud](https://cloud.sagemath.com/ "SageMathCloud") 
and go to project settings to get your API key.


![Authentication API Key location](auth1.jpg)

### How to add your API to your Request

Authorization is a header to include in your request.
```
GET https://cloud.sagemath.com/project  HTTP 1.1
X-smc-authorization: <API key from project>
```


For errors responses, see the [response status codes documentation](#response-status-codes).
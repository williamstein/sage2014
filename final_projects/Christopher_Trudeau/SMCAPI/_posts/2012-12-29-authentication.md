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
* All calls to SageMathCloud API must have the X-smc-authorization header. 
* Authorization is a header to include in your request.

```
GET https://cloud.sagemath.com/projects/<ProjectID>/project/
X-smc-authorization: <API key from project>
```

### How to connect to the WebSocket 
```
TDB
```


For errors responses, see the [response status codes documentation](#response-status-codes).
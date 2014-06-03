---
category: file
path: '/files/{:id}'
title: 'Get a file by ID'
type: 'GET'

layout: nil
---

This method allows you to get (download) a file within the project by ID. Using this method you can either download single files or a whole directory using the IDs given by calling [Get on FILES](#/files-get). 

### Request

* **`:id`** is the id the file to get. Obtained by calling [Get on FILES](#/files-get)
* The headers must include a **valid authentication token**.
* **The body is omitted**.

### Response

File should start downloading via WebSocket file transfer. 

For errors responses, see the [response status codes documentation](#response-status-codes).
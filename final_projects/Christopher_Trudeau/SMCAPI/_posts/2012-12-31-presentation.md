---
title: 'SageMathCloud API Documentation Presentation'

layout: nil
---
# What is my project?

1. I wrote up documentation for the API that is contained in SageMathCloud
2. I wanted ability to use Sage to do Math in my programming without having to install Sage locally. 

# Project Goals

1. Ability to interact with SageMathCloud for any device programmatically. 
2. Allow any internet connected device to do Math using Sage.  
3. Unlock SageMathCloud to third parties.

# What is an API?

* An API or **Application Programming Interface** allows a product or service to talk to other products and services
* Opens up data and functionality to others (eg: third party developers, companies, users, toasters, etc)
* Exchange data internally and externally (separates the logic from the application)
* Leverage cloud resources, because more and more devices are becoming mobile and the need for the processing to be done in the cloud is increasing. 

# API Design

<img src="apidesign.png" alt="Drawing" style="width: 500px;"/>

# Why have an API?

1. Leverage the same logic for all of your applications (eg: web, mobile, etc)
2. Partnerships with third parties. 
3. Data exchange
4. Monetization
5. Presence/Awareness driving people to SageMathCloud
6. "SageMathCloud is a way to get Sage onto Windows Laptops" but the API for SageMathCloud is a way to get Sage onto every device!

# Delivering an API

1. **XML (Extensible Markup Language)** 

<img src="xml.png" alt="Drawing" style="width: 500px;"/>

2. **JSON (JavaScript Object Notation)**

```
{
    "Student": "Christopher Trudeau"
}
```

# What I built

* Lightweight documentation to display all possible actions that can be taken by third parties in SageMathCloud. 
* Easy to extend using **Markdown**
* [GitHub Page](https://github.com/Trudeaucj/SMCAPI) page to explain installation as well as how to add to the documentation

# Where to go next?

* Implement Authentication
* Client Library
* Spread the word of SageMathCloud APIs
* If you have any ideas of useful APIs for SageMathCloud please reach out to me and let me know! 

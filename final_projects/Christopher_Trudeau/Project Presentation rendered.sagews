
︠1ddf1b9f-89f4-472d-97b4-2650cf38962b︠
%md
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

︠afeee31e-379a-4bb1-b90e-cd027bf9a3eb︠
salvus.file('apidesign.png')
︡d56855bb-daaf-4739-8990-7b727a2e84c0︡{"once":false,"file":{"show":true,"uuid":"c21780f8-2b1b-4734-9137-91a344601401","filename":"apidesign.png"}}︡
︠0615becc-40b5-4d77-b53f-4e52ed979300︠

# Why have an API?

1. Leverage the same logic for all of your applications (eg: web, mobile, etc)
2. Partnerships with third parties. 
3. Data exchange
4. Monetization
5. Presence/Awareness driving people to SageMathCloud
6. "SageMathCloud is a way to get Sage onto Windows Laptops" but the API for SageMathCloud is a way to get Sage onto every device!

# Delivering an API

1. **XML (Extensible Markup Language)** 

salvus.file('xml.png')
︠63470f8c-4435-4fdf-bd67-e8acff0665bb︠

︠64b231c8-4803-4a5d-a631-a3c9967f11be︠

salvus.file('xml.png')
︡49079ce3-da8f-4163-98f8-80194b8fe054︡{"once":false,"file":{"show":true,"uuid":"9657939c-5127-4c06-a5b9-f6602474162e","filename":"xml.png"}}︡
︠ce45c6ec-b368-46be-937b-7a58fefdec4d︠



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
︡1e8489d2-2b24-49f3-8e1d-2b3fbd5be807︡{"html":"<h1>What is my project?</h1>\n\n<ol>\n<li>I wrote up documentation for the API that is contained in SageMathCloud</li>\n<li>I wanted ability to use Sage to do Math in my programming without having to install Sage locally. </li>\n</ol>\n\n<h1>Project Goals</h1>\n\n<ol>\n<li>Ability to interact with SageMathCloud for any device programmatically. </li>\n<li>Allow any internet connected device to do Math using Sage.  </li>\n<li>Unlock SageMathCloud to third parties.</li>\n</ol>\n\n<h1>What is an API?</h1>\n\n<ul>\n<li>An API or <strong>Application Programming Interface</strong> allows a product or service to talk to other products and services</li>\n<li>Opens up data and functionality to others (eg: third party developers, companies, users, toasters, etc)</li>\n<li>Exchange data internally and externally (separates the logic from the application)</li>\n<li>Leverage cloud resources, because more and more devices are becoming mobile and the need for the processing to be done in the cloud is increasing. </li>\n</ul>\n\n<h1>API Design</h1>\n\n<p><img src=\"apidesign.png&#8221; alt=\"Drawing&#8221; style=\"width: 500px;\"/></p>\n\n<h1>Why have an API?</h1>\n\n<ol>\n<li>Leverage the same logic for all of your applications (eg: web, mobile, etc)</li>\n<li>Partnerships with third parties. </li>\n<li>Data exchange</li>\n<li>Monetization</li>\n<li>Presence/Awareness driving people to SageMathCloud</li>\n<li>&#8220;SageMathCloud is a way to get Sage onto Windows Laptops&#8221; but the API for SageMathCloud is a way to get Sage onto every device!</li>\n</ol>\n\n<h1>Delivering an API</h1>\n\n<ol>\n<li><strong>XML (Extensible Markup Language)</strong> </li>\n</ol>\n\n<p><img src=\"xml.png&#8221; alt=\"Drawing&#8221; style=\"width: 500px;\"/></p>\n\n<ol>\n<li><strong>JSON (JavaScript Object Notation)</strong></li>\n</ol>\n\n<p><code>\n{\n    \"Student\": \"Christopher Trudeau\"\n}\n</code></p>\n\n<h1>What I built</h1>\n\n<ul>\n<li>Lightweight documentation to display all possible actions that can be taken by third parties in SageMathCloud. </li>\n<li>Easy to extend using <strong>Markdown</strong></li>\n<li><a href=\"https://github.com/Trudeaucj/SMCAPI\">GitHub Page</a> page to explain installation as well as how to add to the documentation</li>\n</ul>\n\n<h1>Where to go next?</h1>\n\n<ul>\n<li>Implement Authentication</li>\n<li>Client Library</li>\n<li>Spread the word of SageMathCloud APIs</li>\n<li>If you have any ideas of useful APIs for SageMathCloud please reach out to me and let me know!</li>\n</ul>\n"}︡
︠55680920-5ebd-471e-aa54-7a975eca00da︠










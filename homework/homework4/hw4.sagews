︠8cef1188-8ec6-4a82-bb7b-8071188044afi︠
%md
# Homework 4 - Math 480b - Spring 2014

**Due Friday, April 25, 2014 by 6pm**

This homework will be automatically collected from the folder **homework4** in your project, sometime after 6pm on Friday, April 25.

For help -- email Simon Spicer (mlungu@uw.edu) and/or William Stein (wstein@uw.edu) and/or the mailing list sagemath2014@googlegroups.com.

︡26c18510-0b31-4e9f-b459-5950914d3add︡{"html":"<h1>Homework 4 - Math 480b - Spring 2014</h1>\n\n<p><strong>Due Friday, April 25, 2014 by 6pm</strong></p>\n\n<p>This homework will be automatically collected from the folder <strong>homework4</strong> in your project, sometime after 6pm on Friday, April 25.</p>\n\n<p>For help &#8211; email Simon Spicer (mlungu@uw.edu) and/or William Stein (wstein@uw.edu) and/or the mailing list sagemath2014@googlegroups.com.</p>\n"}︡
︠fb188d1d-4781-422a-aa56-837d244c1c5c︠



︠6339ca5b-f747-47f6-81cf-e6013c149b6bi︠
%md
## Problem 1 -- vectors in 3 space

Create a Python class that models vectors in 3 dimensional space with rational number entries.  You may use code in Sage such as `QQ`, but please don't use the `vector` class in Sage, which already does all this (though of course you can look at that code if you want). 

    class Vec3:
        def __init__(self, ....?):
            ...    
        
        def __add__(self, right):
            ...
            
        def __sub__(self, right):
            ...
            
        def __repr__(self):
            ...

        def cross_product(self, right):
            ...
            
        def dot_product(self, right):
            ...
            
        def length(self):
            ...
            
        def plot(self):
            ...

You should be able to add and subtract these vectors, multiply them by scalars, compute the dot and cross products, compute their length, and draw a (3 dimensional) plot.   Write docstrings with examples for each function in your class.    You may put this code in a separate file "vec3.sage" to make writing (and testing) it easier.  You can test the examples in your docstrings by typing ``sage -t vec3.sage`` in the terminal.   The docstrings should have the following format (don't bother to document the inputs explicitly):

    """
    Short description.
    
    Longer description for more complicated functions.
    
    EXAMPLES::
    
        sage: 2+2
        4
    """


︡7f17e04b-5622-45f7-bc65-dc32f130b6a1︡{"html":"<h2>Problem 1 &#8211; vectors in 3 space</h2>\n\n<p>Create a Python class that models vectors in 3 dimensional space with rational number entries.  You may use code in Sage such as <code>QQ</code>, but please don&#8217;t use the <code>vector</code> class in Sage, which already does all this (though of course you can look at that code if you want). </p>\n\n<pre><code>class Vec3:\n    def __init__(self, ....?):\n        ...    \n\n    def __add__(self, right):\n        ...\n\n    def __sub__(self, right):\n        ...\n\n    def __repr__(self):\n        ...\n\n    def cross_product(self, right):\n        ...\n\n    def dot_product(self, right):\n        ...\n\n    def length(self):\n        ...\n\n    def plot(self):\n        ...\n</code></pre>\n\n<p>You should be able to add and subtract these vectors, multiply them by scalars, compute the dot and cross products, compute their length, and draw a (3 dimensional) plot.   Write docstrings with examples for each function in your class.    You may put this code in a separate file &#8220;vec3.sage&#8221; to make writing (and testing) it easier.  You can test the examples in your docstrings by typing <code>sage -t vec3.sage</code> in the terminal.   The docstrings should have the following format (don&#8217;t bother to document the inputs explicitly):</p>\n\n<pre><code>\"\"\"\nShort description.\n\nLonger description for more complicated functions.\n\nEXAMPLES::\n\n    sage: 2+2\n    4\n\"\"\"\n</code></pre>\n"}︡
︠2347306c-451f-4ec5-b0c5-3b9473d3e7c7︠

︠dc55e3a1-315d-4642-9cee-6e9e99a0689f︠

︠b67436dc-b949-449e-9143-53caea3befcc︠

︠ec2cd769-453c-4cc5-9c90-c978ef88a25f︠

︠f5bbc5be-d312-4ec0-bc2d-e503db512888i︠
%md
## Problem 2 -- Gaussian rational numbers

Basically the same as problem 1, except model the field of Gaussian rational numbers 
$$
  K = \\{a + b i : a, b \in \mathbf{Q}\\}.
$$  

This is the collection of complex numbers of the form "a rational number plus i times a rational number". If you add, multiply, or divide any two such numbers, the result is again of the form $a+b i$. 

NOTE: Instead of cross product and dot product methods you'll implement multiplication and division. 

I recommend putting your code in a file `gauss.sage`.

You may use code in Sage such as `QQ`, but please don't directly use the number fields code in Sage (e.g., `QQ[i]`), which already does all this (though of course you can look at that code if you want). 

︡b71c297f-e84e-4dd0-847e-578d7a54e0f4︡{"html":"<h2>Problem 2 &#8211; Gaussian rational numbers</h2>\n\n<p>Basically the same as problem 1, except model the field of Gaussian rational numbers \n$$\n  K = \\{a + b i : a, b \\in \\mathbf{Q}\\}.\n$$  </p>\n\n<p>This is the collection of complex numbers of the form &#8220;a rational number plus i times a rational number&#8221;. If you add, multiply, or divide any two such numbers, the result is again of the form $a+b i$. </p>\n\n<p>NOTE: Instead of cross product and dot product methods you&#8217;ll implement multiplication and division. </p>\n\n<p>I recommend putting your code in a file <code>gauss.sage</code>.</p>\n\n<p>You may use code in Sage such as <code>QQ</code>, but please don&#8217;t directly use the number fields code in Sage (e.g., <code>QQ[i]</code>), which already does all this (though of course you can look at that code if you want).</p>\n"}︡
︠db468032-b30c-49e0-a709-8d7c9b20f011︠

︠c69b4098-a7ee-4dce-a8df-5d82c5a42823︠

︠726afbfd-ef4a-4f3a-9654-c3af06d32c77︠

︠1301c57d-1845-4728-9cea-2f9009632e47︠

︠98d664da-8b02-445c-8b2c-c3ecc8d90641︠

︠d06cd3db-e439-4b9a-b491-38d24c76bc34︠

︠3868d082-12ad-4c92-b3bd-87581210210ci︠
%md
## Problem 3 -- Your Project

Based on feedback and possibly consultation with instructors, decide on a project topic. 
Put **two hours** of work into your project and record what happened here.    (You'll be graded on whether
what you do is genuine.)   Note that a first rough draft of your project will be due on May 9.
︡fa10495d-720f-4c70-8074-86fcc10c5d18︡{"html":"<h2>Problem 3 &#8211; Your Project</h2>\n\n<p>Based on feedback and possibly consultation with instructors, decide on a project topic. \nPut <strong>two hours</strong> of work into your project and record what happened here.    (You&#8217;ll be graded on whether\nwhat you do is genuine.)   Note that a first rough draft of your project will be due on May 9.</p>\n"}︡
︠2f02e354-e90f-4ed0-b502-ad9b9261a30e︠

︠779cacf6-f0ea-409b-ae15-1606222ff7a3︠

︠65fde8ae-b35d-48c9-afe6-48d23e3da617︠

︠4283c7b9-50cd-4a4f-a1b3-c8591e804779︠

︠506be308-a3e9-4160-8f32-91d92ed214cf︠

︠0e310e5b-a62a-422c-822c-e95d3aa7d0e3︠

︠1348e878-e039-4132-9a8e-88334e2a76e9︠

︠261f669f-adfc-444d-a59e-c44c324c731c︠

︠50e795c5-1bbc-4702-abde-66413a0c603e︠

︠757cb3c7-b0bd-4711-b0fd-53defba7b9e0︠










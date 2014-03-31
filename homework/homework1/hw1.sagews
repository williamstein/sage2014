︠5fb55eb3-eabb-4edb-ba17-dabd890d2eefi︠
%md
# Homework 1 - Math 480b - Spring 2014

**Due Friday, April 4, 2014 by 6pm**

Turn it in by creating a folder called "homework1" in your project, with this worksheet and also the latex document you create below.

You can put this worksheet in a SageMathCloud project by navigating to a directory (using the Files tab), then click "+New" and paste the following in the blank then click "From Web":

     https://raw.githubusercontent.com/williamstein/sage2014/master/homework/homework1/hw1.sagews

<br>

Make sure to email sagemath480@gmail.com by Wednesday, April 2, with your `project_id`, so I know where to find your homework!
︡fe216546-2bfd-4b4f-8e9e-0329af454762︡{"html":"<h1>Homework 1 - Math 480b - Spring 2014</h1>\n\n<p><strong>Due Friday, April 4, 2014 by 6pm</strong></p>\n\n<p>Turn it in by creating a folder called &#8220;homework1&#8221; in your project, with this worksheet and also the latex document you create below.</p>\n\n<p>You can put this worksheet in a SageMathCloud project by navigating to a directory (using the Files tab), then click &#8220;+New&#8221; and paste the following in the blank then click &#8220;From Web\":</p>\n\n<pre><code> https://raw.githubusercontent.com/williamstein/sage2014/master/homework/homework1/hw1.sagews\n</code></pre>\n\n<p><br></p>\n\n<p>Make sure to email sagemath480@gmail.com by Wednesday, April 2, with your <code>project_id</code>, so I know where to find your homework!</p>\n"}︡
︠b5a63860-9c5d-4f36-87a1-0729a9493eedi︠
%md
## Problem 1
Create a complete standalone LaTeX document (a .tex file) that should use \title, \author, \section, \subsection, \tableofcontents, a typeset math equation, and the \label and \ref commands.

︡f8422abc-e9ab-4e35-8ab7-7cb59b0e6a3a︡{"html":"<h2>Problem 1</h2>\n\n<p>Create a complete standalone LaTeX document (a .tex file) that should use \\title, \\author, \\section, \\subsection, \\tableofcontents, a typeset math equation, and the \\label and \\ref commands.</p>\n"}︡
︠0005071f-196b-4992-a0ca-a3c3075bf562︠

︠71971601-8727-4b21-aebd-ece3c7a6ab8e︠

︠3e49bc52-f897-44ad-85e7-0f2e7fdd6328︠

︠8ab154c0-5f57-47e8-848c-126a122e2e9ci︠


%md
## Problem 2

This is a programming problem that is nice and easy to get us started with programming in Python.

  - write a Pyt function that takes as input 3 arguments, and returns their sum, product, and average.  It should have a docstring.

  - write a function `fibonacci_list` that takes an integer n as input, and returns a list containing the first n Fibonacci numbers.


︡192b9b67-fb1b-42d4-b5a7-476c61129b64︡{"html":"<h2>Problem 2</h2>\n\n<p>This is a programming problem that is nice and easy to get us started with programming in Python.</p>\n\n<ul>\n<li><p>write a Pyt function that takes as input 3 arguments, and returns their sum, product, and average.  It should have a docstring.</p></li>\n<li><p>write a function <code>fibonacci_list</code> that takes an integer n as input, and returns a list containing the first n Fibonacci numbers.</p></li>\n</ul>\n"}︡
︠e805e8d9-044a-42b1-b848-c8f00e5af855︠

︠665a7c9f-b0d3-4d90-9324-ac3c498a1896︠


︠b21fc5bd-4c0e-47eb-a4bd-cd6e4a46468a︠

︠768903c4-228d-40fe-901b-f5b503667775i︠
%md
## Problem 3

- Write a function called **cashier** that makes change for you. That is, you should take as input a number between 1 and 100, and return a number of quarters, dimes, nickels, and pennies whose total value is equal to that number. You're welcome to decide on your own output format -- however, you must describe the output format in the docstring for the function.   (The number of quarters, dimes, etc., need not be optimal.)
︡d73374e6-78c5-49c3-8d66-1a29b7052481︡{"html":"<h2>Problem 3</h2>\n\n<ul>\n<li>Write a function called <strong>cashier</strong> that makes change for you. That is, you should take as input a number between 1 and 100, and return a number of quarters, dimes, nickels, and pennies whose total value is equal to that number. You&#8217;re welcome to decide on your own output format &#8211; however, you must describe the output format in the docstring for the function.   (The number of quarters, dimes, etc., need not be optimal.)</li>\n</ul>\n"}︡
︠2e5c4687-c937-4d09-a680-edd59f48dd1a︠

︠18368841-5830-4341-97ce-a4fa2d236968︠

︠3ff82d3a-4fd5-4c71-9cd9-49cacbfca80c︠

︠9d0e3ea4-24ea-482d-ad73-e60c72688769i︠
%md
## Problem 4

- We're going to see just how important indentation is in Python. Create two functions f and g, let's say both of which take a single integer argument n, that have the following properties:

   - f and g are both valid Python functions,

   - f and g are identical, except for the indentation of some number of lines in their body, and for some input value a, we have f(a) != g(a).

︡6fbe4f4e-046d-41ee-b293-559ca8db914d︡{"html":"<h2>Problem 4</h2>\n\n<ul>\n<li><p>We&#8217;re going to see just how important indentation is in Python. Create two functions f and g, let&#8217;s say both of which take a single integer argument n, that have the following properties:</p>\n\n<ul>\n<li><p>f and g are both valid Python functions,</p></li>\n<li><p>f and g are identical, except for the indentation of some number of lines in their body, and for some input value a, we have f(a) != g(a).</p></li>\n</ul></li>\n</ul>\n"}︡
︠677716cb-e52f-4ccd-9c91-ffdeec43436b︠

︠a0d9d62c-ccbd-4d69-8bed-ee2242d1b214︠

︠08157086-6813-47c7-ac66-27b26f5683e1︠

︠65f71dd3-d3a7-405a-8bca-12237c66b0c4i︠

%md

## Problem 5

Solve all of the following problems using Sage.  Show the code you use to get the answer.

- Compute the number of digits of $17^{2014}$

- make up a random 5x5 matrix and compute its rank and determinant

- make up a symbolic function of your choosing (like $x\sin(x^2)/3$, say) and compute its derivative and an integral

- compute the taylor expansion to 5 terms of the symbolic function you made up above.

- make up a 20 digit random integer by banging on your keyboard, and find the prime factorization of that integer.

- find all complex roots of the polynomial $x^9 + x + 1$.

︡71c1b12f-bf36-499c-aa9d-52acdb0b2305︡{"html":"<h2>Problem 5</h2>\n\n<p>Solve all of the following problems using Sage.  Show the code you use to get the answer.</p>\n\n<ul>\n<li><p>Compute the number of digits of $17^{2014}$</p></li>\n<li><p>make up a random 5x5 matrix and compute its rank and determinant</p></li>\n<li><p>make up a symbolic function of your choosing (like $x\\sin(x^2)/3$, say) and compute its derivative and an integral</p></li>\n<li><p>compute the taylor expansion to 5 terms of the symbolic function you made up above.</p></li>\n<li><p>make up a 20 digit random integer by banging on your keyboard, and find the prime factorization of that integer.</p></li>\n<li><p>find all complex roots of the polynomial $x^9 + x + 1$.</p></li>\n</ul>\n"}︡
︠f0e91a6d-147f-438c-8359-f2a65b475206︠

︠b8794dac-d731-482b-9c9e-ed18134f1ddf︠

︠95ad00c6-cf0b-4eef-9de3-9e9e31106aac︠

︠9018d41e-d31a-40c1-8c03-a101fbb7ee7c︠

︠5a4c8d65-4815-4493-8c99-4533342e098a︠

︠fedc9f81-6306-44b4-b1fc-8acda9f92a3f︠










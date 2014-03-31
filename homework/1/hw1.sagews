︠5fb55eb3-eabb-4edb-ba17-dabd890d2eefi︠
%md
# Homework 1 - Math 480b - Spring 2014
## Due Friday, April 4, 2014 by 6pm

Turn it in by creating a folder called "1" in your project, with this worksheet and also the latex document you create below.

You can put this worksheet in a SageMathCloud project by navigating to a directory (using the Files tab), then click "+New" and paste the following in the blank then click "From Web":

     https://raw.githubusercontent.com/williamstein/sage2014/master/homework/1/hw1.sagews

<br>

Make sure to email sagemath480@gmail.com by Wednesday, April 2, with your `project_id`, so I know where to find your homework!
︡24e90e64-ecec-4be0-9cc5-6f854327bf11︡{"html":"<h1>Homework 1 - Math 480b - Spring 2014</h1>\n\n<h2>Due Friday, April 4, 2014 by 6pm</h2>\n\n<p>Turn it in by creating a folder called &#8220;1&#8221; in your project, with this worksheet and also the latex document you create below.</p>\n\n<p>You can put this worksheet in a SageMathCloud project by navigating to a directory (using the Files tab), then click &#8220;+New&#8221; and paste the following in the blank then click &#8220;From Web\":</p>\n\n<pre><code> https://raw.githubusercontent.com/williamstein/sage2014/master/homework/1/hw1.sagews\n</code></pre>\n\n<p><br></p>\n\n<p>Make sure to email sagemath480@gmail.com by Wednesday, April 2, with your <code>project_id</code>, so I know where to find your homework!</p>\n"}︡
︠b5a63860-9c5d-4f36-87a1-0729a9493eed︠


- Create a LaTeX document that when typeset looks like the following pictured document.  It should use \title, \author, \section, \subsection, \tableofcontents, math equation typesetting, \label, \ref, and a code block using the lstlisting environment.

︠8ab154c0-5f57-47e8-848c-126a122e2e9c︠

- Something nice and easy to get us started: let's write a function fibonacci_list that takes an integer n as input, and returns a list containing the first n Fibonacci numbers.
︠c53e1797-2acd-43f3-9220-94667f66b989︠

- Create a Python function that takes as input 3 arguments, and returns their sum, product, and average.  It should have a docstring.
︠768903c4-228d-40fe-901b-f5b503667775︠

- Write a function cashier that makes change for you. That is, you should take as input a number between 1 and 100, and return a number of quarters, dimes, nickels, and pennies whose total value is equal to that number. You're welcome to decide on your own output format -- however, you must describe the output format in the docstring for the function.
︠9d0e3ea4-24ea-482d-ad73-e60c72688769︠

- We're going to see just how important indentation is in Python. Create two functions f and g, let's say both of which take a single integer argument n, that have the following properties:
   - f and g are both valid Python functions,
   - f and g are identical, except for the indentation of some number of lines in their body, and for some input value a, we have f(a) != g(a).
︠65f71dd3-d3a7-405a-8bca-12237c66b0c4︠


- Write a function myprod that takes a list of integers as input and returns the product of them. You should be able to do this in one line with map/reduce/filter.  Don't use the prod function built into Sage.

︠4b750085-29a4-4d2c-aca2-f7f2deab71b4i︠
%md

Solve the following problems using Sage.  Show the code you use to get the answer.

- number of digits of $17^{293941} + 1$

- make up a random 10x10 matrix and compute its rank and determinant

- make up a random symbolic function (like $\sin(x^2)$) and compute its derivative and an integral

- compute the taylor expansion to 5 terms of the symbolic function you made up above.

- find the prime factorization of 2014

- find all complex roots of the polynomial $x^9-1$.
︡ac708fa2-d8d5-40cf-b2eb-949b5988b965︡{"html":"<p>Solve the following problems using Sage.  Show the code you use to get the answer.</p>\n\n<ul>\n<li><p>number of digits of $17^{293941} + 1$</p></li>\n<li><p>make up a random 10x10 matrix and compute its rank and determinant</p></li>\n<li><p>make up a random symbolic function (like $\\sin(x^2)$) and compute its derivative and an integral</p></li>\n<li><p>compute the taylor expansion to 5 terms of the symbolic function you made up above.</p></li>\n<li><p>find the prime factorization of 2014</p></li>\n<li><p>find all complex roots of the polynomial $x^9-1$.</p></li>\n</ul>\n"}︡
︠fedc9f81-6306-44b4-b1fc-8acda9f92a3f︠










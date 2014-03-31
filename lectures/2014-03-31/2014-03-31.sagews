︠bd3ccf5a-ccf1-4023-858e-93684b0d98cei︠
%md

# Math 480b -- Sage Course

## March 31, 2014

**Plan**

 - Go over syllabus
 - Sage
 - SageMathCloud
 - Homework 1

︡c1b9374e-d65c-4b4f-81f3-60327aa2afb2︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>March 31, 2014</h2>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li>Go over syllabus</li>\n<li>Sage</li>\n<li>SageMathCloud</li>\n<li>Homework 1</li>\n</ul>\n"}︡
︠f3419dc5-b044-4864-96fa-115a74efbe38︠

︠3bd7262e-cdf9-4103-b0af-345b957205a9i︠
md(open("../../README.md").read())
︡5e83df95-2fce-46ad-93f6-d50f2e29b50f︡{"html":"<h1>Sage: Open Source Mathematical Software</h1>\n\n<h2>Spring 2014 at the University of Washington</h2>\n\n<p>This is a course about <a href=\"http://sagemath.org\">SageMath</a>, which is a software development project with the following mission:</p>\n\n<h4 style=\"text-align:center\">\n  Create a viable free open source alternative to Magma, Maple, Mathematica and Matlab.\n</h4>\n\n<h1>Information</h1>\n\n<ul>\n<li>Course website: <a href=\"https://github.com/williamstein/sage2014\">https://github.com/williamstein/sage2014</a></li>\n<li>Professor: <a href=\"http://wstein.org\">William Stein</a></li>\n<li>TA: Simon Spicer</li>\n<li>Office Hour for this course: Tuesdays 12-1:00pm in Padelford C423</li>\n<li>Course mailing list: <a href=\"https://groups.google.com/forum/?hl=en#!forum/sagemath2014\">https://groups.google.com/forum/?hl=en#!forum/sagemath2014</a></li>\n</ul>\n\n<h1>Objectives</h1>\n\n<p>In this course you will:</p>\n\n<ul>\n<li>Learn how to use Sage, LaTex, Python, and Cython</li>\n<li>Understand how Sage is constructed and how to change Sage</li>\n<li>Do a nontrivial project involving Sage</li>\n<li>Understand how to work with abstract mathematical objects in Sage (e.g., a &#8220;linear transformation&#8221;, a group, ring or field, etc.)</li>\n</ul>\n\n<h1>Your Responsibilities</h1>\n\n<ul>\n<li><em>Homework:</em> (40% of grade) You will submit a homework assignment every week.  <em>No late homework will be accepted</em>, and no low grades are dropped.</li>\n<li><em>Peer Grading:</em> (20% of grade) You will have to grade (on time) a lot of other students&#8217; homework in this class, and projects.  Peer grading will <em>not</em> be anonymous.  (<strong>Drop the class now if you don&#8217;t like this!</strong>)</li>\n<li><em>Project</em>: (40% of grade) You will create a project, which will be (peer) graded in May and June.</li>\n<li><em>Presentation:</em> You will give a few minutes presentation about your project at the end of the course.</li>\n<li><em>Attendance:</em> You are expected to come to class.</li>\n<li><em>Grades:</em>  They will be at least as good as indicated by the following grading scale (I will likely curve it down): [(98, 4), (96.5, 3.9), (95, 3.8), (93.5, 3.7), (92, 3.6), (90.5, 3.5), (89, 3.4), (87.5, 3.3), (86, 3.2), (84.5, 3.1), (83, 3.0), (81.5, 2.9), (80, 2.8), (78.5, 2.7), (77, 2.6), (75.5, 2.5), (74, 2.4), (72.5, 2.3), (71, 2.2), (69.5, 2.1), (68, 2.0), (66.5, 1.9), (65, 1.8), (63.5, 1.7), (62, 1.6), (60.5, 1.5), (59, 1.4), (57.5, 1.3), (56, 1.2), (54.5, 1.1), (53.0, 1.0), (51.5, 0.9), (50.1, 0.8), (50.0,0.7), (0, 0)]</li>\n</ul>\n\n<h1>Assignment Schedule</h1>\n\n<p>Homework and peer grading of homework is due every Friday by 6pm, and homework will be assigned on Friday, so you have 1 week to do each assignment.  The last week of classes will consist of project presentations.    There is no in-class midterm or final exam.</p>\n\n<ul>\n<li>Wednesday, April 2 &#8211; create a project at https://cloud.sagemath.com and email the <code>project_id</code> to sagemath480@gmail.com</li>\n<li>Friday, April 4    &#8211; Homework 1 due by 6pm &#8211; in a folder &#8220;1&#8221; of your project.</li>\n<li>Friday, April 11   &#8211; Homework 2 due; peer grading of homework 1 due</li>\n<li>Friday, April 18   &#8211; Homework 3 due; peer grading of homework 2 due</li>\n<li>Friday, April 25   &#8211; Homework 4 due; peer grading of homework 3 due</li>\n<li>Friday, May 2      &#8211; Homework 5 due; peer grading of homework 4 due</li>\n<li>Friday, May 9      &#8211; Homework 6 due; peer grading of homework 5 due; first draft of project due</li>\n<li>Friday, May 16     &#8211; Homework 7 due; peer grading of homework 6 due; peer grading of project due</li>\n<li>Friday, May 23     &#8211; Homework 8 due; peer grading of homework 7 due</li>\n<li>(Monday, May 26 is Memorial Day is memorial day)</li>\n<li>Friday, May 30     &#8211; Homework 9 due; final draft of project due; peer grading of homework 8 due</li>\n<li>Friday, June 2,4,6 &#8211; Project presentations</li>\n<li>Friday, June 6     &#8211; Peer grading of homework 9 and projects due</li>\n</ul>\n"}︡
︠77a4229a-da2a-42d4-ab16-2287cc65c0e6︠

︠22eedf74-a45d-49b8-8f58-e3ffc89e5a04i︠
%md
## SageMath

 - I started the Sage project in late 2004, frustrated by open source math software being so far behind closed source competitors, after spending many years promoting and contributing extensively to Magma (which is closed source).

 - Having the source code of mathematics software is like having access to the proofs of theorems: I am opposed to closed source math software both on basic principle and because it has a *very bad longterm impact* on computational mathematics.

 - Sage was initially aimed at number theory.

 - Quickly broadened; mission statement - "Create a viable free open source alternative to Magma, Maple, Mathematica, and Matlab."

 - Each release of Sage has about 100 contributors, and there are many releases each year.   The development process is extremely open.  See <http://trac.sagemath.org/> and <http://www.sagemath.org/doc/developer/>.

 - Sage is:
      - a **distribution** of open source math software (and all dependencies) that works on OS X, Linux, and Solaris.
      - a **massive Python library** that ties it all together and provides very substantial new functionality

 - The overall open source license of Sage is "GPLv3".

 - Sage has seen the most development in: number theory, combinatorics, graph theory, exact linear algebra, symbolic calculus

 - Notable numerical components of the Sage distribution: R and Numpy/Scipy


︡1cdbb1b5-d56a-4b01-b4a2-7921984df336︡{"html":"<h2>SageMath</h2>\n\n<ul>\n<li><p>I started the Sage project in late 2004, frustrated by open source math software being so far behind closed source competitors, after spending many years promoting and contributing extensively to Magma (which is closed source).</p></li>\n<li><p>Having the source code of mathematics software is like having access to the proofs of theorems: I am opposed to closed source math software both on basic principle and because it has a <em>very bad longterm impact</em> on computational mathematics.</p></li>\n<li><p>Sage was initially aimed at number theory.</p></li>\n<li><p>Quickly broadened; mission statement - &#8220;Create a viable free open source alternative to Magma, Maple, Mathematica, and Matlab.&#8221;</p></li>\n<li><p>Each release of Sage has about 100 contributors, and there are many releases each year.   The development process is extremely open.  See <a href=\"http://trac.sagemath.org/\">http://trac.sagemath.org/</a> and <a href=\"http://www.sagemath.org/doc/developer/\">http://www.sagemath.org/doc/developer/</a>.</p></li>\n<li><p>Sage is:</p>\n\n<ul>\n<li>a <strong>distribution</strong> of open source math software (and all dependencies) that works on OS X, Linux, and Solaris.</li>\n<li>a <strong>massive Python library</strong> that ties it all together and provides very substantial new functionality</li>\n</ul></li>\n<li><p>The overall open source license of Sage is &#8220;GPLv3&#8221;.</p></li>\n<li><p>Sage has seen the most development in: number theory, combinatorics, graph theory, exact linear algebra, symbolic calculus</p></li>\n<li><p>Notable numerical components of the Sage distribution: R and Numpy/Scipy</p></li>\n</ul>\n"}︡
︠6b9876ed-425e-4bc7-aa14-5fe48586e68c︠

︠3bc60e42-e9e3-40e4-ba54-612937a6280di︠

%md
## SageMathCloud

- I started working on using "Sage in the browser" in 2006 motivated by the need for a graphical user interface

- Many people helped on sagenb.org over the years: Alex Clemesha, Tom Boothby, Tim Dumol, Mike Hansen, and many others

- I launched SageMathCloud in 2013, to create something much larger scale that could be commercialized.

- **Motivations:**

   - Frustration with funding sources for Sage development (e.g., Simons foundation)

   - Frustration with access to Sage: it is painful to install and keep updated a MASSIVE monolithic local sage install, which reduces Sage usage.

- **A Surprise**: it turns out the whole design of sagenb.org was very limiting compared to how people really want to use it.

  - SageMathCloud makes much, much more possible with Sage, so it's now easy for people to do development on Sage itself via a web browser, which is a problem that we used to try to address with sagenb.org, but always failed.

       - a full terminal
       - editing of all file types, including LaTeX documents
       - multiple people editing the same document at once

  
︡c18b22e0-0233-4de7-876a-205d4240e267︡{"html":"<h2>SageMathCloud</h2>\n\n<ul>\n<li><p>I started working on using &#8220;Sage in the browser&#8221; in 2006 motivated by the need for a graphical user interface</p></li>\n<li><p>Many people helped on sagenb.org over the years: Alex Clemesha, Tom Boothby, Tim Dumol, Mike Hansen, and many others</p></li>\n<li><p>I launched SageMathCloud in 2013, to create something much larger scale that could be commercialized.</p></li>\n<li><p><strong>Motivations:</strong></p>\n\n<ul>\n<li><p>Frustration with funding sources for Sage development (e.g., Simons foundation)</p></li>\n<li><p>Frustration with access to Sage: it is painful to install and keep updated a MASSIVE monolithic local sage install, which reduces Sage usage.</p></li>\n</ul></li>\n<li><p><strong>A Surprise</strong>: it turns out the whole design of sagenb.org was very limiting compared to how people really want to use it.</p>\n\n<ul>\n<li><p>SageMathCloud makes much, much more possible with Sage, so it&#8217;s now easy for people to do development on Sage itself via a web browser, which is a problem that we used to try to address with sagenb.org, but always failed.</p>\n\n<ul>\n<li>a full terminal</li>\n<li>editing of all file types, including LaTeX documents</li>\n<li>multiple people editing the same document at once</li>\n</ul></li>\n</ul></li>\n</ul>\n"}︡
︠7df853f8-7c0f-48d1-b271-3e43972b4755︠











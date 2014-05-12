TOTAL: X/20
︠8cef1188-8ec6-4a82-bb7b-8071188044afi︠
%md
# Homework 7 - Math 480b - Spring 2014

**Due Monday, May 19, 2014 by 6am**

This homework will be automatically collected from the folder **homework7** in your project, around 6am on Monday, May 19.

For help -- email William Stein (<a href="mailto:wstein@uw.edu">wstein@uw.edu</a>) and/or the mailing list <a href="mailto:sagemath2014@googlegroups.com">sagemath2014@googlegroups.com</a>
You can also try to email Simon Spicer (<a href="mailto:mlungu@uw.edu">mlungu@uw.edu</a>).

︡523fb448-3899-47f2-815c-cf4d23e6328a︡{"html":"<h1>Homework 7 - Math 480b - Spring 2014</h1>\n\n<p><strong>Due Monday, May 19, 2014 by 6am</strong></p>\n\n<p>This homework will be automatically collected from the folder <strong>homework7</strong> in your project, around 6am on Monday, May 19.</p>\n\n<p>For help &#8211; email William Stein (<a href=\"mailto:wstein@uw.edu\">wstein@uw.edu</a>) and/or the mailing list <a href=\"mailto:sagemath2014@googlegroups.com\">sagemath2014@googlegroups.com</a>\nYou can also try to email Simon Spicer (<a href=\"mailto:mlungu@uw.edu\">mlungu@uw.edu</a>).</p>\n"}︡
︠e3672a44-e95f-4bdb-aba0-b45a708411cb︠

︠21d4e34a-15f3-43d8-aa4f-05a882ec363ei︠
%md
## Problem 1 -- Modify a Cython class

1. Create a Cython class that represents a list of double precision numbers and has methods to compute the *mean*, *standard deviation*, and *variance*. You can start with the code below, which I presented in class.

2. Add a method that efficiently computes the sum of the sines of the numbers in your list, e.g., if your list is v it computes `sum(sin(x) for x in v)`.   Here you should explicitly use the sin function in the C math library, which is going to be much faster than using the Python or Sage math function.  You should be able to compute this sum for 100000 doubles in under 20 milliseconds.

3. Create an array of 100000 random numbers and use it to test the speed of each of your methods using %timeit.

︡db5dcf9b-ee1b-44aa-9d6c-660cfe24f1fb︡{"html":"<h2>Problem 1 &#8211; Modify a Cython class</h2>\n\n<ol>\n<li><p>Create a Cython class that represents a list of double precision numbers and has methods to compute the <em>mean</em>, <em>standard deviation</em>, and <em>variance</em>. You can start with the code below, which I presented in class.</p></li>\n<li><p>Add a method that efficiently computes the sum of the sines of the numbers in your list, e.g., if your list is v it computes <code>sum(sin(x) for x in v)</code>.   Here you should explicitly use the sin function in the C math library, which is going to be much faster than using the Python or Sage math function.  You should be able to compute this sum for 100000 doubles in under 20 milliseconds. </p></li>\n<li><p>Create an array of 100000 random numbers and use it to test the speed of each of your methods using %timeit.</p></li>\n</ol>\n"}︡
︠b5d79901-ed83-41d0-9b1b-767e4d65b87f︠
# NOTE: when you press shift enter it *should* take about 10 seconds to compile.
%cython
cdef class DoubleList:
    cdef double* v
    cdef int n
    def __init__(self, v):
        self.n = len(v)
        self.v = <double*> sage_malloc(sizeof(double)*self.n)
        cdef int i
        for i in range(self.n):
            self.v[i] = v[i]
    def __del__(self):
        sage_free(self.v)
    def variance(self):
        cdef double m, x, s
        cdef int i, n
        n = self.n
        s = 0
        for i in range(n):
            s += self.v[i]
        m = s/n
        s = 0
        for i in range(n):
            x = self.v[i]
            s += (x-m)*(x-m)
        return s/n
︡b9283a67-9dce-4013-9ed6-61fa430698fa︡{"once":false,"file":{"show":false,"uuid":"50ce7503-3700-4fa1-ae60-31c1109f07f6","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/387/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_387_dir_r3Hght_a_pyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_387_dir_r3Hght_a_pyx_0.html"}}︡{"html":"<a href='/blobs//projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/387/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_387_dir_r3Hght_a_pyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_387_dir_r3Hght_a_pyx_0.html?uuid=50ce7503-3700-4fa1-ae60-31c1109f07f6' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='fa fa-external-link'></i></a>"}︡
︠1251eab0-d801-4764-915b-a267b350dab3︠

︠cacb5211-6fd2-4319-b37a-0d5d7a4885b4︠

︠801ee9fc-1dca-441f-9ffd-6c7a73b90a98︠

︠9c54af70-b867-46a2-bdb4-1a00ba16beab︠



︠f7bff282-25f2-41f9-9b39-bbd66533e4f7i︠
%md
## Problem 2 -- Five Projects that Use Cython

There is a list of projects that use Cython here <https://github.com/cython/cython/wiki/projects>.

Choose 5 projects from that list that sound like they do something that you might find interesting or useful at some point. (If you know of any other projects that use Cython, you could add them to the list, then choose them!)

For each project, write a paragraph about *how* they use Cython.  Your paragraph should address the following points:

  - Quick summary of what the software does

  - Very, very roughly how big is the software, and of this code, roughly how much is written in Cython?

  - Explain what *some* part that is written in Cython uses Cython to accomplish.  You don't have to address everything -- just one thing of your choice.

Obviously, to answer the above question, you will likely have to browse the source code of the relevant project.

Incidentally, I tried clicking on the second item (lxml) in the linked to list and it was broken.  Somebody could fix that.


︡819d6c2e-4a91-46d5-a255-035f12ed8225︡{"html":"<h2>Problem 2 &#8211; Five Projects that Use Cython</h2>\n\n<p>There is a list of projects that use Cython here <a href=\"https://github.com/cython/cython/wiki/projects\">https://github.com/cython/cython/wiki/projects</a>.</p>\n\n<p>Choose 5 projects from that list that sound like they do something that you might find interesting or useful at some point. (If you know of any other projects that use Cython, you could add them to the list, then choose them!)</p>\n\n<p>For each project, write a paragraph about <em>how</em> they use Cython.  Your paragraph should address the following points:</p>\n\n<ul>\n<li><p>Quick summary of what the software does</p></li>\n<li><p>Very, very roughly how big is the software, and of this code, roughly how much is written in Cython?</p></li>\n<li><p>Explain what <em>some</em> part that is written in Cython uses Cython to accomplish.  You don&#8217;t have to address everything &#8211; just one thing of your choice.</p></li>\n</ul>\n\n<p>Obviously, to answer the above question, you will likely have to browse the source code of the relevant project.</p>\n\n<p>Incidentally, I tried clicking on the second item (lxml) in the linked to list and it was broken.  Somebody could fix that.</p>\n"}︡
︠e4b4e5a5-ad1e-4474-a1d4-f0f441a29066︠

︠f3ef41aa-5561-43ee-8df7-f82c3f5ecfea︠

︠ec492057-2c0c-49d4-ac0c-3804eb28e208︠

︠d06cd3db-e439-4b9a-b491-38d24c76bc34︠

︠3868d082-12ad-4c92-b3bd-87581210210ci︠
%md
## Problem 3 -- A Presentation About Your Project

Use LaTeX beamer to create a rought draft of a 5-minute presentation about your project.

I've made a template for you in a subdirectory called "beamer", which is where you should put your presentation.

Learn about LaTeX beamer by googling for it.



︡c45645e0-8683-4cf8-afb3-40abe2fb71c7︡{"html":"<h2>Problem 3 &#8211; A Presentation About Your Project</h2>\n\n<p>Use LaTeX beamer to create a rought draft of a 5-minute presentation about your project.</p>\n\n<p>I&#8217;ve made a template for you in a subdirectory called &#8220;beamer&#8221;, which is where you should put your presentation.</p>\n\n<p>Learn about LaTeX beamer by googling for it.</p>\n"}︡
︠2f02e354-e90f-4ed0-b502-ad9b9261a30e︠

︠09632b85-7d70-4680-9d7d-23d832c19af5︠

︠17594fd6-b2ce-4765-84d9-34de084f5a53︠

︠779cacf6-f0ea-409b-ae15-1606222ff7a3︠

︠65fde8ae-b35d-48c9-afe6-48d23e3da617︠

︠4283c7b9-50cd-4a4f-a1b3-c8591e804779︠

︠506be308-a3e9-4160-8f32-91d92ed214cf︠

︠0e310e5b-a62a-422c-822c-e95d3aa7d0e3︠

︠1348e878-e039-4132-9a8e-88334e2a76e9︠

︠261f669f-adfc-444d-a59e-c44c324c731c︠

︠50e795c5-1bbc-4702-abde-66413a0c603e︠

︠757cb3c7-b0bd-4711-b0fd-53defba7b9e0︠










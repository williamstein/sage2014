
︠7af91bd3-1d59-4cbf-bcd4-c066b0c31904i︠
%md

# Math 480b -- Sage Course
## A Tour of More Advanced Cython Functionality

## May 12, 2014

Screencast: REMIND ME!

**Plan**

- Questions

- Homework:
   - I collected 6, redistributed grading, etc.  Let me know if you're missing something.
   - Go over hw7, which is about Cython and your projects.

- Cython, part 2:
   - Creating a standalone Cython module
   - Cython support for numpy -- it doesn't seem to work at all in Sage right now due to incompatibilities, so we're skipping it. Sigh.
   - Editing Cython code in the Sage library
   - Cython support for C++


Note: article about GO for student doing a project on it: <http://www.wired.com/2014/05/the-world-of-computer-go/>
︡24a6ea27-e831-4abf-b5b0-f3aa5e5548c9︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>A Tour of More Advanced Cython Functionality</h2>\n\n<h2>May 12, 2014</h2>\n\n<p>Screencast: REMIND ME!</p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions</p></li>\n<li><p>Homework:</p>\n\n<ul>\n<li>I collected 6, redistributed grading, etc.  Let me know if you&#8217;re missing something.</li>\n<li>Go over hw7, which is about Cython and your projects.</li>\n</ul></li>\n<li><p>Cython, part 2:</p>\n\n<ul>\n<li>Creating a standalone Cython module</li>\n<li>Cython support for numpy &#8211; it doesn&#8217;t seem to work at all in Sage right now due to incompatibilities, so we&#8217;re skipping it. Sigh.</li>\n<li>Editing Cython code in the Sage library</li>\n<li>Cython support for C++</li>\n</ul></li>\n</ul>\n\n<p>Note: article about GO for student doing a project on it: <a href=\"http://www.wired.com/2014/05/the-world-of-computer-go/\">http://www.wired.com/2014/05/the-world-of-computer-go/</a></p>\n"}︡
︠21ced3ae-ee45-4a0b-b2f6-4613ee02c74e︠

︠ab315ae3-ba80-4a83-a691-b05fe5e79c79i︠
%md
## Creating a standalone Cython module

We will discuss this example: <https://github.com/cython/cython/wiki/examples-mandelbrot>

**Definition:** The Mandelbrot set is the set of $c \in \mathbf{C}$ such that the sequence of complex numbers given by $z_0=0$ and
$z_{n+1} = z_n^2 + c$ remains bounded.

- Look at mandelcy1.pyx code
- Look at setup.py  -- also look at <http://docs.cython.org/src/quickstart/build.html>
- Build the code
- Run it below to create an image (which we display)
︡d09a46f3-cadd-4f54-88de-27045c37b7ca︡{"html":"<h2>Creating a standalone Cython module</h2>\n\n<p>We will discuss this example: <a href=\"https://github.com/cython/cython/wiki/examples-mandelbrot\">https://github.com/cython/cython/wiki/examples-mandelbrot</a></p>\n\n<p><strong>Definition:</strong> The Mandelbrot set is the set of $c \\in \\mathbf{C}$ such that the sequence of complex numbers given by $z_0=0$ and\n$z_{n+1} = z_n^2 + c$ remains bounded.</p>\n\n<ul>\n<li>Look at mandelcy1.pyx code</li>\n<li>Look at setup.py  &#8211; also look at <a href=\"http://docs.cython.org/src/quickstart/build.html\">http://docs.cython.org/src/quickstart/build.html</a></li>\n<li>Build the code</li>\n<li>Run it below to create an image (which we display)</li>\n</ul>\n"}︡
︠d925f1b7-2032-494c-803e-5c47e57f1eb1︠

︠e2fd6a97-7bfb-40e3-baea-b407f4706cd1︠
# BIG WARNING: though this appears to work, once you import *once* you can never import/reload again until you
# completely restart the worksheet (or to randomly name the cython module).
sys.path.append(".")
import mandelcy1
︡de31680d-5f91-4b80-a36e-4065d902d48d︡
︠4328c6da-7e3f-4ba7-811c-90df57f6f103︠
mandelcy1.demo()
︡aac55fe9-c8e1-4f49-97df-e858c7771771︡{"stdout":"it took 0.305397 seconds to run"}︡{"stdout":"\n"}︡
︠7db999d1-5ec9-4f43-b269-70aed9ed6a63︠
salvus.file("mandelbrot.png")
︡5b30293f-79ba-49f2-90f9-996ac722199a︡{"once":false,"file":{"show":true,"uuid":"0bb86d63-f5d8-446f-98ed-8d914159a511","filename":"mandelbrot.png"}}︡
︠6f0eb5e3-0c43-4e95-807f-7413677337e2︠

︠6e08f556-c6d6-4ac1-afd8-88641af05092︠

︠f2c2ffad-d71e-4380-b431-90c9a8e07581︠

︠5a086ce3-eb24-4c5b-920c-d5f8fe21d18e︠

︠6ada3f85-a424-475c-9cfd-2ad8ae75756b︠

︠c4a4ab83-8d31-40ba-825a-32aca1875b03︠

︠7f614ac7-4694-4c01-a511-38500cd537a7i︠
%md
## Editing and building Cython code in the Sage library

 - Edit the code as normal.  But if the file ends in .pyx, it is Cython code, so you have to be aware of the implications.
 - Build the code as usual: `sage -br`

︡7c6c13e8-23d1-4c99-849a-aac0033758f4︡{"html":"<h2>Editing and building Cython code in the Sage library</h2>\n\n<ul>\n<li>Edit the code as normal.  But if the file ends in .pyx, it is Cython code, so you have to be aware of the implications.</li>\n<li>Build the code as usual: <code>sage -br</code></li>\n</ul>\n"}︡
︠9b321fc8-25ac-4563-baab-ac1852eb0d77︠
# do an example involving integer.pyx
︠ddf762cc-4b9e-4bc1-b483-a98cebf73097︠

︠5bf416f4-093f-463c-b765-804042aff2ae︠

︠bc3c796b-bb83-4290-8bd1-c4d7db42fae3i︠
%md
## Cython support for external library code

A key feature of Cython is that you can use it to make functionality from existing C/C++ code available to Python (and Cython) code.

︡d0e20123-2cba-40b1-9d47-2d6c29d677e0︡{"html":"<h2>Cython support for external library code</h2>\n\n<p>A key feature of Cython is that you can use it to make functionality from existing C/C++ code available to Python (and Cython) code.</p>\n"}︡
︠4e5b9717-813f-4f2a-971b-b0ca2c4a4224︠

︠f4fa0eaf-3114-44e7-be3f-a728aac07c0c︠
%cython

# very simple example -- use the C library log directly
# See http://docs.cython.org/src/userguide/external_C_code.html for much more

cdef extern from "math.h":
    double log(double)

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

    def log(self):
        import math
        return sum(math.log(self.v[i]) for i in range(self.n))

    def log1(self):
        cdef double ans=0
        cdef int i
        for i in range(self.n):
            ans += log(self.v[i])
        return ans


︡b6f46c59-ec2c-4a63-b625-a550ee30298c︡{"once":false,"file":{"show":false,"uuid":"77a6033e-4539-4f1b-b9e4-8888a4e59f4b","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/15213/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_15213_dir_TTmJIU_a_pyx/cdefs.html"}}︡{"html":"<a href='/blobs//projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/15213/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_15213_dir_TTmJIU_a_pyx/cdefs.html?uuid=77a6033e-4539-4f1b-b9e4-8888a4e59f4b' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='fa fa-external-link'></i></a>"}︡
︠189f3ccb-901b-4f0c-957e-bda093899663︠
v =DoubleList(range(1,100000))
︡0e50db4b-b345-4906-9154-9086cd055731︡
︠25be697a-7b40-48ae-8c10-8871e1ff0af9︠
%timeit v.log()
︡c93253ce-4034-49af-a3c7-177c4e10d3a0︡{"stdout":"5 loops, best of 3: 39.4 ms per loop"}︡{"stdout":"\n"}︡
︠bcf138ea-e743-40b5-8e5c-3b1905f732d6︠
%timeit v.log1()
︡a7d1bbc2-4d9a-4779-a11a-d3c7c903ffde︡{"stdout":"25 loops, best of 3: 9.07 ms per loop"}︡{"stdout":"\n"}︡
︠f71b401d-a732-4104-a9c3-94efaf1f1e18︠










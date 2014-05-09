︠7af91bd3-1d59-4cbf-bcd4-c066b0c31904i︠
%md

# Math 480b -- Sage Course
## Overview of Sage

## May 9, 2014

Screencast: <http://youtu.be/YrO89QIizxI>

**Plan**

- Questions

- Cython
︡29bf1b24-176c-4998-8a58-45c6e68e38d6︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>Overview of Sage</h2>\n\n<h2>May 9, 2014</h2>\n\n<p>Screencast: <a href=\"http://youtu.be/YrO89QIizxI\">http://youtu.be/YrO89QIizxI</a></p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions</p></li>\n<li><p>Cython</p></li>\n</ul>\n"}︡
︠b71a5cf7-0afb-4b8b-86e4-44aadf41ef02i︠

%md
## "The C Level"

<div>
<img src="http://www.divingcity.com/wp-content/uploads/2012/12/scuba3.jpg" style="width:40%">
<img src="http://xtremesport4u.com/wp-content/uploads/2012/04/kitesurf.jpg" style="width:40%">
</div>

<br>

- Python is like floating around underwater -- you can easily float around, etc., but you move slowly.

- C is like flying around in the air -- you go much more quickly, but can also easily crash and burn

- [Cython](http://cython.org/) makes it so you can fly

︡344c322b-6b8a-4323-a1b3-450c6fcbf151︡{"html":"<h2>&#8220;The C Level&#8221;</h2>\n\n<div>\n<img src=\"http://www.divingcity.com/wp-content/uploads/2012/12/scuba3.jpg\" style=\"width:40%\">\n<img src=\"http://xtremesport4u.com/wp-content/uploads/2012/04/kitesurf.jpg\" style=\"width:40%\">\n</div>\n\n<p><br></p>\n\n<ul>\n<li><p>Python is like floating around underwater &#8211; you can easily float around, etc., but you move slowly.</p></li>\n<li><p>C is like flying around in the air &#8211; you go much more quickly, but can also easily crash and burn</p></li>\n<li><p><a href=\"http://cython.org/\">Cython</a> makes it so you can fly</p></li>\n</ul>\n"}︡
︠15dcc561-dfba-46c4-b000-c8ad4f6cc80di︠
%html
<img src="http://imgs.xkcd.com/comics/python.png">
︡5994c073-a71d-4ab7-91fe-6be10f75e97d︡{"html":"<img src=\"http://imgs.xkcd.com/comics/python.png\">"}︡
︠515a8a89-f201-4012-9110-779bf4123a2b︠

︠f09ca91c-378f-43bf-8089-b9339fa37534i︠
%md
## Motivation

 - Browse <http://benchmarksgame.alioth.debian.org/u64/benchmark.php?test=all&lang=python3&lang2=gcc&data=u64> and compare speed of languages on number crunching tasks.
︡430aa0b4-267c-4cce-90a9-d390c1aac5f1︡{"html":"<h2>Motivation</h2>\n\n<ul>\n<li>Browse <a href=\"http://benchmarksgame.alioth.debian.org/u64/benchmark.php?test=all&amp;lang=python3&amp;lang2=gcc&amp;data=u64\">http://benchmarksgame.alioth.debian.org/u64/benchmark.php?test=all&amp;lang=python3&amp;lang2=gcc&amp;data=u64</a> and compare speed of languages on number crunching tasks.</li>\n</ul>\n"}︡
︠6c1651bd-a3fa-4cd9-b4c3-806331e0bc35i︠
%md

## First benchmark: pi-digits

Let's look at and try out the pi digits benchmark.  Here Python and C are pretty close!

But note the use of gmpy, i.e., all the hard work in the python implementation happens "at the C level".

︡ebded16d-a24e-4e53-b932-c56ba8dcd283︡{"html":"<h2>First benchmark: pi-digits</h2>\n\n<p>Let&#8217;s look at and try out the pi digits benchmark.  Here Python and C are pretty close!</p>\n\n<p>But note the use of gmpy, i.e., all the hard work in the python implementation happens &#8220;at the C level&#8221;.</p>\n"}︡
︠544a0eb8-532b-4436-91a4-dcded2bf8dd9︠
# sage is way faster... (probably a different algorithm!)
%time s = str(N(pi, digits=10000))
︡f8f6aa29-b013-42da-b3b4-7ce474fe1ab5︡{"stdout":"CPU time: 0.01 s, Wall time: 0.01 s\n"}︡
︠dad91d9e-1f6f-46fe-bae4-9796a2b3b5e9︠

︠a62960fd-ef63-4743-be6c-4a4c505b9188i︠
%md
## Next benchmark: Mandelbrot

Oh crap, Python **sucks**

<http://benchmarksgame.alioth.debian.org/u64/performance.php?test=mandelbrot>

Of all languages, C is the fastest.  And Python is almost the worst, being about 86 times slower.

I looked into the Python code, and it does the computation in parallel using 64 processes, even on a single core computer.
On a 1600x1600 case, just the time to start those processes and do nothing takes more time than the C program takes
to do everything...


︡fcb78f7c-bfdf-49cf-9823-59c204f2bd66︡{"html":"<h2>Next benchmark: Mandelbrot</h2>\n\n<p>Oh crap, Python <strong>sucks</strong></p>\n\n<p><a href=\"http://benchmarksgame.alioth.debian.org/u64/performance.php?test=mandelbrot\">http://benchmarksgame.alioth.debian.org/u64/performance.php?test=mandelbrot</a></p>\n\n<p>Of all languages, C is the fastest.  And Python is almost the worst, being about 86 times slower.</p>\n\n<p>I looked into the Python code, and it does the computation in parallel using 64 processes, even on a single core computer.\nOn a 1600x1600 case, just the time to start those processes and do nothing takes more time than the C program takes\nto do everything&#8230;</p>\n"}︡
︠2c695479-c3ba-4ad4-9aae-4d35e3cf0bcf︠

︠6f7f7855-09a2-4293-a0d6-05300ecb2deb︠

︠feba36df-131b-49ca-a86e-8283c4289464i︠
%md

## Next benchmark: binary-trees

This one is also very depressing for Python.

<http://benchmarksgame.alioth.debian.org/u64/performance.php?test=binarytrees>

C is first and Python is nearly last, being over 50 times slower.
︡a6fea56f-2b5a-4d85-858e-dc101c275bf7︡{"html":"<h2>Next benchmark: binary-trees</h2>\n\n<p>This one is also very depressing for Python.</p>\n\n<p><a href=\"http://benchmarksgame.alioth.debian.org/u64/performance.php?test=binarytrees\">http://benchmarksgame.alioth.debian.org/u64/performance.php?test=binarytrees</a></p>\n\n<p>C is first and Python is nearly last, being over 50 times slower.</p>\n"}︡
︠817f69fa-219c-4879-9fc5-536047a270d5︠

︠22868acd-da2c-496a-a236-5782bddb5dddi︠
%md

## ???

 - why?
 - what can we do?
 - but Python is so nice and fun.
 - Extending Python with C/C++: <https://docs.python.org/2/extending/extending.html>
 - Cython: <cython.org> -- basically makes "extending Python with C/C++" way, way easier than the official approach
 
Let's take a very, very simple example in Python and speed it up using Cython.  


︡3ed68c34-2576-4ff2-b067-19ccb26b1a92︡{"html":"<h2>???</h2>\n\n<ul>\n<li>why?</li>\n<li>what can we do?</li>\n<li>but Python is so nice and fun.</li>\n<li>Extending Python with C/C++: <a href=\"https://docs.python.org/2/extending/extending.html\">https://docs.python.org/2/extending/extending.html</a></li>\n<li>Cython: <cython.org> &#8211; basically makes &#8220;extending Python with C/C++&#8221; way, way easier than the official approach</li>\n</ul>\n\n<p>Let&#8217;s take a very, very simple example in Python and speed it up using Cython.</p>\n"}︡
︠2e44ae56-50fb-4c11-8c47-4fe8439fc61di︠
%md

## Problem: variance of a list of floating point numbers

**variance** = the mean of the squares of the difference of each value from the mean = $\sum \frac{1}{n} (x_i-\mu)^2$.

︡680f033e-aedb-4a7e-adc2-101df26f1d7c︡{"html":"<h2>Problem: variance of a list of floating point numbers</h2>\n\n<p><strong>variance</strong> = the mean of the squares of the difference of each value from the mean = $\\sum \\frac{1}{n} (x_i-\\mu)^2$.</p>\n"}︡
︠5eb37ce8-9545-45ce-9de0-2ac387576d6e︠

︠eaf5b2a5-14f6-4080-92a6-583ba791bb68︠
%python
# straightforward Python implementation
def var0(v):
    m = float(sum(v))/len(v)
    return sum([(x-m)**2 for x in v])/len(v)  # use ** so this is standard Python
︡5240cd0b-d11c-4fba-a599-cc2a25e48b36︡
︠e32d47f0-2ce9-4768-97bb-4c17a4120805︠
v = [random() for _ in range(10)]
v
︡6da9bf48-833a-4963-891c-28c8be7824e4︡{"stdout":"[0.1241999666440795, 0.7688493160210794, 0.27251914257554644, 0.4032333800198763, 0.9485561288153582, 0.696677854333964, 0.7357727102496147, 0.7339442720461534, 0.5379013599960007, 0.7868187591689886]\n"}︡
︠a92bca6e-36bb-4eb4-8115-16059e6be567︠
var0(v)
︡3f928b72-e578-4745-965f-2914d87b6fd5︡{"stdout":"0.06068201681775176\n"}︡
︠13560568-57ae-4151-aa18-a6ce6a528cc0︠
v = [random() for _ in range(10000)]
︡680d8987-c4fa-469e-85d2-c7e49bf58e95︡
︠ba0eef40-8766-4e83-b92e-e4bbdc480e47︠
%timeit var0(v)
︡4beb9695-0517-4189-a955-978c1ff2c6dd︡{"stdout":"125 loops, best of 3: 4.07 ms per loop"}︡{"stdout":"\n"}︡
︠c62c9af4-23f0-48d8-ad24-b93e69bb876e︠
# Straightforward Cython implementation
# (if the "show auto-generated" doesn't work properly for you -- with yellow -- restart your project server, since I just fixed a bug in this.)
%cython
def var1(v):
    m = float(sum(v))/len(v)
    return sum([(x-m)**2 for x in v])/len(v)
︡4b539cee-b2d7-42ef-bac0-c7466994c211︡{"once":false,"file":{"show":false,"uuid":"f2309c10-79da-4755-88d1-5a6b61c8be6b","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_WBuxvh_a_pyx/interrupt.html"}}︡{"html":"<a href='/blobs//projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_WBuxvh_a_pyx/interrupt.html?uuid=f2309c10-79da-4755-88d1-5a6b61c8be6b' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='fa fa-external-link'></i></a>"}︡
︠9853e6b7-4bf1-4dae-96ea-f4b902a42712︠
%timeit var1(v)
︡e528306c-8f24-460b-9bce-ded8e04a5cdf︡{"stdout":"125 loops, best of 3: 2.44 ms per loop"}︡{"stdout":"\n"}︡
︠8fbc4063-ae67-48dc-adca-2d86462a0b91︠
4.07/2.44
︡d792b177-96d3-4e16-bacf-6667ba31502b︡{"stdout":"1.66803278688525\n"}︡
︠e3e500c6-889f-4951-9b04-53e1b00304cb︠
a =float(7)
b = a
c = a
c
︡e81ea1f1-4f8c-46f6-ba03-b63d029a3194︡{"stdout":"7.0\n"}︡
︠6b23a284-bc53-406f-9e2f-c48d772a9dd0︠
del b
︡08877ccc-4593-4556-8c28-74df71290d6d︡
︠aa255dd5-1b77-495b-a2bf-444427344041︠
# Declare some types

%cython
def var2(list v):
    cdef double m, x
    m = float(sum(v))/len(v)
    return sum([(x-m)**2 for x in v])/len(v)
︡d34a5241-d699-4129-b3ff-0fe33166f237︡{"once":false,"file":{"show":false,"uuid":"cd2303b7-5453-464c-bf84-e75460155833","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_pPHKcV_a_pyx/stdsage.html"}}︡{"html":"<a href='/blobs//projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_pPHKcV_a_pyx/stdsage.html?uuid=cd2303b7-5453-464c-bf84-e75460155833' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='fa fa-external-link'></i></a>"}︡
︠593d401a-cf7b-4b22-8336-d040aa2624c8︠
%timeit var2(v)
︡fa442a0d-99c4-4adb-aa24-5d3a51937ff0︡{"stdout":"625 loops, best of 3: 807 µs per loop"}︡{"stdout":"\n"}︡
︠2674d3de-7cf3-4b2d-a74b-a30fe5451e08︠
4.07/.786
︡6742bd22-ae56-41e4-b18e-1b03ad53bb00︡{"stdout":"5.17811704834606\n"}︡
︠a083a526-15a3-4e8f-ad4c-b89cc029c637︠

# Don't call Python's sum function, but do the sum ourselves; also don't use square which is potentially slow.

%cython
def var3(list v):
    cdef double m, x, s, n
    n = len(v)
    s = 0    
    for x in v:
        s += x
    m = s/n
    s = 0
    for x in v:
        s += (x-m)*(x-m)
    return s/n
︡0a08cda4-195a-4c74-8f6d-82c6cf59228d︡{"once":false,"file":{"show":false,"uuid":"b2a2561a-08e0-4134-8f30-1f7706b0c73f","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_xYuHv5_a_pyx/interrupt.html"}}︡{"html":"<a href='/blobs//projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_xYuHv5_a_pyx/interrupt.html?uuid=b2a2561a-08e0-4134-8f30-1f7706b0c73f' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='fa fa-external-link'></i></a>"}︡
︠668b47aa-eb37-4583-a7a8-7e0cb7f3a4cf︠
%timeit var3(v)
︡903ec259-27a6-427d-9984-58cbb884caa8︡{"stdout":"625 loops, best of 3: 194 µs per loop"}︡{"stdout":"\n"}︡
︠a95b2ca2-fad2-466f-ab05-f02ef8a23c3b︠
4.07/.209
︡27c38993-e6b7-4b1e-a9e0-c8f70ef13434︡{"stdout":"19.4736842105263\n"}︡
︠37d0cfd1-fad2-44e2-91ac-39764ccd7ec7︠
# Next, make our own data type for a list of doubles
︠598a80d6-a464-40c7-b911-76fa6f933086︠
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
︡8daf37cc-581a-4fad-8235-56114f574872︡{"once":false,"file":{"show":false,"uuid":"22a43544-ea7d-4f57-96b8-441789d55ff8","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_8g25Tr_a_pyx/interrupt.html"}}︡{"html":"<a href='/blobs//projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_8g25Tr_a_pyx/interrupt.html?uuid=22a43544-ea7d-4f57-96b8-441789d55ff8' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='fa fa-external-link'></i></a>"}︡
︠c25b10b6-0109-4349-8f39-740bfeab2d25︠
vd = DoubleList(v)
︡975a6469-ad58-4ba5-97ca-280685d942f1︡
︠db30d6b0-e190-4e2d-8ef0-e8607e8b5239︠
vd
︡b8e010d2-5c5c-4f16-a356-34ea53dae5bb︡{"stdout":"<_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_8g25Tr_a_pyx_0.DoubleList object at 0x8c9f230>\n"}︡
︠e5e656ad-f202-41ac-83bd-d965f5e41a0d︠
%timeit vd.variance()
︡2b9eede2-696d-4f75-97ff-170995310ec9︡{"stdout":"625 loops, best of 3: 29.8 µs per loop"}︡{"stdout":"\n"}︡
︠eca694d1-f0fd-4e63-8476-60c00a7bbb59︠
# WIN
4.07/.0298
︡fa67015b-aa29-43a8-8803-2e2f8c9220f4︡{"stdout":"136.577181208054\n"}︡
︠71f1c795-073b-4cc2-8c68-80e214a5577b︠

    
︠c3b7a228-0070-4bf4-b73b-4e7a73b00866︠

︠ffd5f277-b6ac-4cdc-9206-7be8b961444a︠

︠a5c8bd97-80e4-4f74-be22-7f5ebf78a218︠

︠bd6e0794-4649-4bd2-8495-c62c14ebd2f9i︠
%md
## Why it is called Cython...
<http://www.mohawkradio.com/images/merch_images/mens/cython_01.jpg>
<br>
    <img src="http://www.mohawkradio.com/images/merch_images/mens/cython_01.jpg">
︡38ade705-c5e4-4d24-ac1e-ef92e8c5544e︡{"html":"<h2>Why it is called Cython&#8230;</h2>\n\n<p><a href=\"http://www.mohawkradio.com/images/merch_images/mens/cython_01.jpg\">http://www.mohawkradio.com/images/merch_images/mens/cython_01.jpg</a>\n<br>\n    <img src=\"http://www.mohawkradio.com/images/merch_images/mens/cython_01.jpg\"></p>\n"}︡
︠e75519e3-a40f-4b70-b0a9-d7cb5a059b00︠










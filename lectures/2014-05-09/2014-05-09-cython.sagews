︠7af91bd3-1d59-4cbf-bcd4-c066b0c31904i︠
%md

# Math 480b -- Sage Course
## Overview of Sage

## May 9, 2014

Screencast: REMIND ME

**Plan**

- Questions

- Cython
︡809e0640-cfde-4385-8773-32bab80ed25f︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>Overview of Sage</h2>\n\n<h2>May 9, 2014</h2>\n\n<p>Screencast: REMIND ME</p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions</p></li>\n<li><p>Cython</p></li>\n</ul>\n"}︡
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
︠eaf5b2a5-14f6-4080-92a6-583ba791bb68︠
# straightforward Python implementation
def var0(v):
    m = float(sum(v))/len(v)
    return sum([(x-m)**2 for x in v])/len(v)  # use ** so this is standard Python
︡8c38a9ce-8d7c-43aa-a443-6966bf510f34︡
︠e32d47f0-2ce9-4768-97bb-4c17a4120805︠
v = [random() for _ in range(10)]
v
︡09f51036-ab3c-4a1b-aec2-980857591ada︡{"stdout":"[0.8589381826391068, 0.8681592440262227, 0.6892358810838731, 0.5800153806503944, 0.6653829882189602, 0.18009338714825207, 0.9077079599252226, 0.8509199973502831, 0.9766987594487242, 0.7177646364529632]\n"}︡
︠a92bca6e-36bb-4eb4-8115-16059e6be567︠
var0(v)
︡a0cacd4a-b2a4-4bef-beac-45204cc2c9dd︡{"stdout":"0.04736519346871963\n"}︡
︠13560568-57ae-4151-aa18-a6ce6a528cc0︠
v = [random() for _ in range(10000)]
︠ba0eef40-8766-4e83-b92e-e4bbdc480e47︠
%timeit var0(v)
︡98435305-bffb-4420-bcf1-af86dc53b5c2︡{"stdout":"25 loops, best of 3: 8.63 ms per loop"}︡{"stdout":"\n"}︡
︠c62c9af4-23f0-48d8-ad24-b93e69bb876e︠
# Straightforward Cython implementation
# (if the "show auto-generated" doesn't work properly for you -- with yellow -- restart your project server, since I just fixed a bug in this.)
%cython
def var1(v):
    m = float(sum(v))/len(v)
    return sum([(x-m)**2 for x in v])/len(v)
︡b320c980-c672-4456-81a6-71825cb37595︡{"once":false,"file":{"show":false,"uuid":"691f0279-4c77-4c59-bbb6-f2e9c9691f1d","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_wbVbwx_a_pyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_wbVbwx_a_pyx_0.html"}}︡{"html":"<a href='/blobs//projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_wbVbwx_a_pyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_wbVbwx_a_pyx_0.html?uuid=691f0279-4c77-4c59-bbb6-f2e9c9691f1d' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='fa fa-external-link'></i></a>"}︡
︠9853e6b7-4bf1-4dae-96ea-f4b902a42712︠
%timeit var1(v)
︡69b8a04e-a520-46bb-9a76-c7ac3d23572e︡{"stdout":"125 loops, best of 3: 3.08 ms per loop"}︡{"stdout":"\n"}︡
︠8fbc4063-ae67-48dc-adca-2d86462a0b91︠
8.63/3.08
︡d3675de5-8df6-4d90-98e2-f0270ded820b︡{"stdout":"2.80194805194805\n"}︡
︠aa255dd5-1b77-495b-a2bf-444427344041︠
# Declare some types

%cython
def var2(list v):
    cdef double m, x
    m = float(sum(v))/len(v)
    return sum([(x-m)**2 for x in v])/len(v)
︡bcb9a961-c794-4d62-ba11-6ef53c13adbe︡{"once":false,"file":{"show":false,"uuid":"f56adb5e-24d0-44df-94b5-b03867d712dc","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_9ruo88_a_pyx/stdsage.html"}}︡{"html":"<a href='/blobs//projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_9ruo88_a_pyx/stdsage.html?uuid=f56adb5e-24d0-44df-94b5-b03867d712dc' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='fa fa-external-link'></i></a>"}︡
︠593d401a-cf7b-4b22-8336-d040aa2624c8︠
%timeit var2(v)
︡c8a92698-5182-492e-acaa-feaccba13b8c︡{"stdout":"625 loops, best of 3: 786 µs per loop"}︡{"stdout":"\n"}︡
︠2674d3de-7cf3-4b2d-a74b-a30fe5451e08︠
8.63/.786
︡1f01eb9c-ef2a-423a-95c3-22b41439faff︡{"stdout":"10.9796437659033\n"}︡
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
︡cd37badd-8958-4822-ab44-583c4c27817c︡{"once":false,"file":{"show":false,"uuid":"55f5ede0-a2bb-4ed2-a5a1-a6c6b67955fb","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_Oi43Zg_a_pyx/stdsage.html"}}︡{"html":"<a href='/blobs//projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_Oi43Zg_a_pyx/stdsage.html?uuid=55f5ede0-a2bb-4ed2-a5a1-a6c6b67955fb' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='fa fa-external-link'></i></a>"}︡
︠668b47aa-eb37-4583-a7a8-7e0cb7f3a4cf︠
%timeit var3(v)
︡0a1555ed-fbb6-4a39-b00d-5c5001a0c9d8︡{"stdout":"625 loops, best of 3: 209 µs per loop"}︡{"stdout":"\n"}︡
︠a95b2ca2-fad2-466f-ab05-f02ef8a23c3b︠
8.63/.209
︡1a0a4479-d161-4f3b-81cb-847d8d8b75fe︡{"stdout":"41.2918660287081\n"}︡
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
︡a59e549b-9173-47dd-8202-8ffe79d69c2d︡{"once":false,"file":{"show":false,"uuid":"66159b17-c255-42be-908c-f6c61681bd01","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_rD2Ets_a_pyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_rD2Ets_a_pyx_0.html"}}︡{"html":"<a href='/blobs//projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/9366/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_rD2Ets_a_pyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_9366_dir_rD2Ets_a_pyx_0.html?uuid=66159b17-c255-42be-908c-f6c61681bd01' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='fa fa-external-link'></i></a>"}︡
︠c25b10b6-0109-4349-8f39-740bfeab2d25︠
vd = DoubleList(v)
︡d9a0be6f-de92-4421-9c96-daa71827469b︡
︠e5e656ad-f202-41ac-83bd-d965f5e41a0d︠
%timeit vd.variance()
︡ebc12d17-4b0c-4885-a033-a6bad847ae6c︡{"stdout":"625 loops, best of 3: 29.8 µs per loop"}︡{"stdout":"\n"}︡
︠eca694d1-f0fd-4e63-8476-60c00a7bbb59︠
# WIN
8.63/.0298
︡9e3f8f3b-547a-4c34-8dbf-e08a624f32cd︡{"stdout":"289.597315436242\n"}︡
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










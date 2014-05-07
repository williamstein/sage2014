︠2927fd33-96d8-4cf3-9690-ea39c7db21fdi︠
%md

# Math 480b -- Sage Course
## Overview of Sage

## May 7, 2014

Screencast: <http://youtu.be/ry-hbfTlVqI>

**Plan**

- Questions

- Build Sage from source: quick checkup

- Sync changes: some remarks...

- HTML/CSS/JS instead of interact

- Overview of what is in Sage -- continued

︡10383ae1-b93c-43a4-8d09-bfe4c89ccc1f︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>Overview of Sage</h2>\n\n<h2>May 7, 2014</h2>\n\n<p>Screencast: <a href=\"http://youtu.be/ry-hbfTlVqI\">http://youtu.be/ry-hbfTlVqI</a></p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions</p></li>\n<li><p>Build Sage from source: quick checkup</p></li>\n<li><p>Sync changes: some remarks&#8230;</p></li>\n<li><p>HTML/CSS/JS instead of interact</p></li>\n<li><p>Overview of what is in Sage &#8211; continued</p></li>\n</ul>\n"}︡
︠1c500ce6-486f-4b84-8d20-c906db56942e︠
@interact
def f(n=5):
    print n*random()
︡043f2060-259f-4215-af83-a829961c27c8︡{"interact":{"style":"None","flicker":false,"layout":[[["n",12,null]],[["",12,null]]],"id":"3b34a755-9be4-4a99-bd12-d64a6c07a30c","controls":[{"control_type":"input-box","default":5,"label":"n","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"n","type":null}]}}︡
︠dd9857bd-98e7-4424-8170-ffce92d41ad9i︠
%md
## Distribution -- here's what's included

(see also <http://sagemath.org/packages/standard/>)

    ~/sage% ls upstream/
    atlas-3.10.1.tar.bz2            gsl-1.15.tar.bz2           Pillow-2.2.2.tar.gz
    boehm_gc-7.2d.tar.bz2           iconv-1.14.tar.bz2         polybori-0.8.3.tar.bz2
    boost_cropped-1.52.0.tar.bz2    iml-1.0.3.tar.bz2          polytopes_db-20120220.tar.bz2
    bzip2-1.0.6.tar.gz              ipython-0.13.2.tar.bz2     ppl-1.1pre9.tar.bz2
    cddlib-094f.tar.bz2             jinja2-2.5.5.tar.bz2       pycrypto-2.6.1.tar.gz
    cephes-2.8.tar.bz2              jmol-12.3.27.tar.bz2       pygments-1.3.1.tar.bz2
    cliquer-1.21.tar.bz2            lcalc-1.23.tar.bz2         pynac-0.3.0.tar.bz2
    conway_polynomials-0.4.tar.bz2  libfplll-4.0.4.tar.bz2     python-2.7.5.tar.bz2
    cvxopt-1.1.6.tar.bz2            libgap-4.6.4.tar.bz2       r-3.0.2.tar.bz2
    cython-0.19.1.tar.bz2           libm4ri-20130416.tar.bz2   ratpoints-2.1.3.tar.bz2
    docutils-0.7.tar.bz2            libm4rie-20130416.tar.bz2  readline-6.2.tar.bz2
    ecl-12.12.1.tar.bz2             libpng-1.2.35.tar.bz2      rpy2-2.3.8.tar.gz
    eclib-20120830.tar.bz2          linbox-1.3.2.tar.bz2       rubiks-20070912.tar.bz2
    ecm-6.4.4.tar.bz2               lrcalc-1.1.6.tar.bz2       sagenb-0.10.8.2.tar
    elliptic_curves-0.7.tar.bz2     matplotlib-1.2.1.tar.bz2   sagetex-2.3.4.tar.bz2
    fflas_ffpack-1.6.0.tar.bz2      maxima-5.29.1.tar.bz2      scipy-0.12.0.tar.bz2
    flint-2.3.tar.bz2               mpc-1.0.tar.bz2            scons-1.2.0.tar.bz2
    flintqs-20070817.tar.bz2        mpfi-1.5.1.tar.bz2         setuptools-0.6.16.tar.bz2
    freetype-2.5.2.tar.bz2          mpfr-3.1.2.tar.bz2         singular-3.1.5.tar.bz2
    gap-4.6.4.tar.bz2               mpir-2.6.0.tar.bz2         sphinx-1.1.2.tar.bz2
    gd-2.0.35.tar.bz2               mpmath-0.17.tar.bz2        sqlalchemy-0.5.8.tar.bz2
    gdmodule-0.56.tar.bz2           ncurses-5.9.tar.bz2        sqlite-3.7.17.tar.bz2
    genus2reduction-0.3.tar.bz2     networkx-1.8.1.tar.gz      symmetrica-2.0.tar.bz2
    gf2x-1.1.tar.bz2                ntl-5.5.2.tar.bz2          sympow-1.018.1.tar.bz2
    gfan-0.5.tar.bz2                numpy-1.7.0.tar.bz2        sympy-0.7.4.tar.gz
    git-1.8.4.4.tar.bz2             palp-2.1.tar.bz2           tachyon-0.98.9.tar.bz2
    givaro-3.7.1.tar.bz2            pari-2.5.5.tar.bz2         zlib-1.2.8.tar.bz2
    glpk-4.44.tar.bz2               patch-2.5.9.tar.bz2        zn_poly-0.9.tar.bz2
    graphs-20120404.tar.bz2         pexpect-2.0.tar.bz2
︡ae64ae1f-cfe0-4f02-a06a-ffce7f6136a6︡{"html":"<h2>Distribution &#8211; here&#8217;s what&#8217;s included</h2>\n\n<p>(see also <a href=\"http://sagemath.org/packages/standard/\">http://sagemath.org/packages/standard/</a>)</p>\n\n<pre><code>~/sage% ls upstream/\natlas-3.10.1.tar.bz2            gsl-1.15.tar.bz2           Pillow-2.2.2.tar.gz\nboehm_gc-7.2d.tar.bz2           iconv-1.14.tar.bz2         polybori-0.8.3.tar.bz2\nboost_cropped-1.52.0.tar.bz2    iml-1.0.3.tar.bz2          polytopes_db-20120220.tar.bz2\nbzip2-1.0.6.tar.gz              ipython-0.13.2.tar.bz2     ppl-1.1pre9.tar.bz2\ncddlib-094f.tar.bz2             jinja2-2.5.5.tar.bz2       pycrypto-2.6.1.tar.gz\ncephes-2.8.tar.bz2              jmol-12.3.27.tar.bz2       pygments-1.3.1.tar.bz2\ncliquer-1.21.tar.bz2            lcalc-1.23.tar.bz2         pynac-0.3.0.tar.bz2\nconway_polynomials-0.4.tar.bz2  libfplll-4.0.4.tar.bz2     python-2.7.5.tar.bz2\ncvxopt-1.1.6.tar.bz2            libgap-4.6.4.tar.bz2       r-3.0.2.tar.bz2\ncython-0.19.1.tar.bz2           libm4ri-20130416.tar.bz2   ratpoints-2.1.3.tar.bz2\ndocutils-0.7.tar.bz2            libm4rie-20130416.tar.bz2  readline-6.2.tar.bz2\necl-12.12.1.tar.bz2             libpng-1.2.35.tar.bz2      rpy2-2.3.8.tar.gz\neclib-20120830.tar.bz2          linbox-1.3.2.tar.bz2       rubiks-20070912.tar.bz2\necm-6.4.4.tar.bz2               lrcalc-1.1.6.tar.bz2       sagenb-0.10.8.2.tar\nelliptic_curves-0.7.tar.bz2     matplotlib-1.2.1.tar.bz2   sagetex-2.3.4.tar.bz2\nfflas_ffpack-1.6.0.tar.bz2      maxima-5.29.1.tar.bz2      scipy-0.12.0.tar.bz2\nflint-2.3.tar.bz2               mpc-1.0.tar.bz2            scons-1.2.0.tar.bz2\nflintqs-20070817.tar.bz2        mpfi-1.5.1.tar.bz2         setuptools-0.6.16.tar.bz2\nfreetype-2.5.2.tar.bz2          mpfr-3.1.2.tar.bz2         singular-3.1.5.tar.bz2\ngap-4.6.4.tar.bz2               mpir-2.6.0.tar.bz2         sphinx-1.1.2.tar.bz2\ngd-2.0.35.tar.bz2               mpmath-0.17.tar.bz2        sqlalchemy-0.5.8.tar.bz2\ngdmodule-0.56.tar.bz2           ncurses-5.9.tar.bz2        sqlite-3.7.17.tar.bz2\ngenus2reduction-0.3.tar.bz2     networkx-1.8.1.tar.gz      symmetrica-2.0.tar.bz2\ngf2x-1.1.tar.bz2                ntl-5.5.2.tar.bz2          sympow-1.018.1.tar.bz2\ngfan-0.5.tar.bz2                numpy-1.7.0.tar.bz2        sympy-0.7.4.tar.gz\ngit-1.8.4.4.tar.bz2             palp-2.1.tar.bz2           tachyon-0.98.9.tar.bz2\ngivaro-3.7.1.tar.bz2            pari-2.5.5.tar.bz2         zlib-1.2.8.tar.bz2\nglpk-4.44.tar.bz2               patch-2.5.9.tar.bz2        zn_poly-0.9.tar.bz2\ngraphs-20120404.tar.bz2         pexpect-2.0.tar.bz2\n</code></pre>\n"}︡
︠3a77d969-a055-401b-bc01-871e7d2dfb72︠

︠0e60b6bb-64fa-40cd-9d7b-ff5d114a19d0i︠
%md
## Distribution -- discuss some notable components of Sage that don't require a Ph.D. to appreciate



More notable components:
︡e9b455df-bb89-4836-a58b-bd9a7d81ad5e︡{"html":"<h2>Distribution &#8211; discuss some notable components of Sage that don&#8217;t require a Ph.D. to appreciate</h2>\n\n<p>More notable components:</p>\n"}︡
︠2ccfd4b9-8003-4470-8057-ed6d8ea9266bi︠
%md
- **atlas**: Automatically Tuned Linear Algebra software = operations with floating point matrices quickly; used by numpy
︡cbceb6c7-7da4-4733-bdee-f8525ebbf251︡{"html":"<ul>\n<li><strong>atlas</strong>: Automatically Tuned Linear Algebra software = operations with floating point matrices quickly; used by numpy</li>\n</ul>\n"}︡
︠577eba2a-7752-4e69-9d52-abe27b98e28f︠
import numpy.random, numpy
n = 1000
a = numpy.random.rand(n,n)  # see http://docs.scipy.org/doc/numpy/reference/routines.random.html
b = numpy.random.rand(n,n)
%time c = a*b  # component-wise multiplication
%time d = numpy.dot(a,b)   # matrix multiplication (probably uses ATLAS heavily)
︡34851f5b-98ba-455a-af1e-827512d6d02d︡{"stdout":"CPU time: 0.01 s, Wall time: 0.01 s\n"}︡{"stdout":"CPU time: 0.28 s, Wall time: 0.27 s"}︡{"stdout":"\n"}︡
︠e6825f4c-2be5-4cf9-a35a-396648b8bcb7︠

︠fcd13fdb-276a-488b-876d-d438b9102156i︠
%md
 - **cvxopt**: big convex optimization package; "Convex minimization has applications in a wide range of disciplines, such as automatic control systems, estimation and signal processing, communications and networks, electronic circuit design, data analysis and modeling, statistics (optimal design), and finance." -- Wikipedia

Example here: <http://cvxopt.org/examples/tutorial/lp.html>

<img src="http://cvxopt.org/_images/math/6c7602a7b7dac314c2ee41126fa771a3375d60b7.png">
︡7a36813d-f624-4d21-8483-8f1434181e6f︡{"html":"<ul>\n<li><strong>cvxopt</strong>: big convex optimization package; &#8220;Convex minimization has applications in a wide range of disciplines, such as automatic control systems, estimation and signal processing, communications and networks, electronic circuit design, data analysis and modeling, statistics (optimal design), and finance.&#8221; &#8211; Wikipedia</li>\n</ul>\n\n<p>Example here: <a href=\"http://cvxopt.org/examples/tutorial/lp.html\">http://cvxopt.org/examples/tutorial/lp.html</a></p>\n\n<p><img src=\"http://cvxopt.org/_images/math/6c7602a7b7dac314c2ee41126fa771a3375d60b7.png\"></p>\n"}︡
︠575eeba1-7525-4bed-be8c-f8d80163be72︠
%var x1, x2
a = -x1 + x2 <= 1
a
︡c35de5ab-8cd3-4e11-9a4f-f67850b42885︡{"stdout":"-x1 + x2 <= 1\n"}︡
︠3009cd15-7c15-4bd3-a663-76a9e9195948︠
type(a)
︡eb7caa38-9794-469c-a756-5803acc41031︡{"stdout":"<type 'sage.symbolic.expression.Expression'>\n"}︡
︠1e7e24e1-f36b-4c8b-87fc-ca9c07fe8549︠
preparse('2.5')
︡5a0f54a9-6e44-4073-8270-965e677490d7︡{"stdout":"\"RealNumber('2.5')\"\n"}︡
︠a68ec833-6ce5-4031-9675-2a5590ab69fb︠
8585856.929028340824082094380298409284098204382083402834098204982084208402834
︡559622a8-7be2-45a2-ba1e-0dd298055515︡{"stdout":"8.58585692902834082408209438029840928409820438208340283409820498208420840283e6\n"}︡
︠55835a15-6aeb-4b9b-8ede-99f545962d02︠
%python
8585856.929028340824082094380298409284098204382083402834098204982084208402834
︡8f42ea5f-8ddc-4dfa-b2db-3ce8cf9c9903︡{"stdout":"8585856.929028342\n"}︡
︠de62f840-1289-47a8-aa52-e399261007d0︠
%python  # disable preparsing in this cell; alternatively, do RealNumber=float
from cvxopt import matrix, solvers
A = matrix([ [-1.0, -1.0, 0.0, 1.0], [1.0, -1.0, -1.0, -2.0] ])
b = matrix([ 1.0, -2.0, 0.0, 4.0 ])
c = matrix([ 2.0, 1.0 ])
sol=solvers.lp(c,A,b)
print(sol['x'])
︡122c91ec-aa61-4c52-9864-59a31c0a21aa︡{"stdout":"     pcost       dcost       gap    pres   dres   k/t\n 0:  2.6471e+00 -7.0588e-01  2e+01  8e-01  2e+00  1e+00\n 1:  3.0726e+00  2.8437e+00  1e+00  1e-01  2e-01  3e-01\n 2:  2.4891e+00  2.4808e+00  1e-01  1e-02  2e-02  5e-02\n 3:  2.4999e+00  2.4998e+00  1e-03  1e-04  2e-04  5e-04\n 4:  2.5000e+00  2.5000e+00  1e-05  1e-06  2e-06  5e-06\n 5:  2.5000e+00  2.5000e+00  1e-07  1e-08  2e-08  5e-08\nOptimal solution found.\n"}︡{"stdout":"[ 5.00e-01]\n[ 1.50e+00]\n\n"}︡
︠081c8298-ea4c-4f12-be72-7905cec1bd95︠
RealNumber = float
from cvxopt import matrix, solvers
A = matrix([ [-1.0, -1.0, 0.0, 1.0], [1.0, -1.0, -1.0, -2.0] ])
b = matrix([ 1.0, -2.0, 0.0, 4.0 ])
c = matrix([ 2.0, 1.0 ])
sol=solvers.lp(c,A,b)
print(sol['x'])
︡df176dbe-2c78-451f-80b6-970917347772︡{"stdout":"     pcost       dcost       gap    pres   dres   k/t\n 0:  2.6471e+00 -7.0588e-01  2e+01  8e-01  2e+00  1e+00\n 1:  3.0726e+00  2.8437e+00  1e+00  1e-01  2e-01  3e-01\n 2:  2.4891e+00  2.4808e+00  1e-01  1e-02  2e-02  5e-02\n 3:  2.4999e+00  2.4998e+00  1e-03  1e-04  2e-04  5e-04\n 4:  2.5000e+00  2.5000e+00  1e-05  1e-06  2e-06  5e-06\n 5:  2.5000e+00  2.5000e+00  1e-07  1e-08  2e-08  5e-08\nOptimal solution found.\n"}︡{"stdout":"[ 5.00e-01]\n[ 1.50e+00]\n\n"}︡
︠da3ec2f9-ab79-41dc-903c-dfcc7a2f1e3b︠

︠a75b00e1-0690-4ad9-82be-b9055a485d89i︠
%md

<img src="http://upload.wikimedia.org/wikipedia/en/c/ce/Cython-logo.svg">

 - **cython**: "Cython is an optimising static compiler for both the Python programming language and the extended Cython programming language.  It makes writing C extensions for Python as easy as Python itself. Cython gives you the combined power of Python and C."  Hundreds of thousands of lines of Sage are written in Cython; we're learn the basics very soon.
︡0bfc19d4-98ba-472e-868a-ec0fb2f40e82︡{"html":"<p><img src=\"http://upload.wikimedia.org/wikipedia/en/c/ce/Cython-logo.svg\"></p>\n\n<ul>\n<li><strong>cython</strong>: &#8220;Cython is an optimising static compiler for both the Python programming language and the extended Cython programming language.  It makes writing C extensions for Python as easy as Python itself. Cython gives you the combined power of Python and C.&#8221;  Hundreds of thousands of lines of Sage are written in Cython; we&#8217;re learn the basics very soon.</li>\n</ul>\n"}︡
︠53aab564-0f8a-4054-8043-86601d76f57e︠
%python
def f0(n):
    k = 0
    for m in range(n):
        k += 2*m+1
    return k
︡7e157f5f-d716-4f10-9709-2d87fa02eedc︡
︠75f3aa1b-b432-4e4c-88e0-cd9d47bc1a9co︠
%cython
def f1(int n):
    cdef long m, k=0
    z = 5
    for m in range(n):
        k += 2*m+1
    print(type(z)        )
    return k
︡e6d09206-d2f7-484d-bf17-a3d48495ad1d︡{"once":false,"file":{"show":false,"uuid":"6e1aa023-2f2f-488a-9fad-e34e074ea464","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/28616/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_28616_dir_uqv0J5_a_pyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_28616_dir_uqv0J5_a_pyx_0.html"}}︡{"html":"<a href='/blobs//projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/28616/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_28616_dir_uqv0J5_a_pyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_28616_dir_uqv0J5_a_pyx_0.html?uuid=6e1aa023-2f2f-488a-9fad-e34e074ea464' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='fa fa-external-link'></i></a>"}︡
︠fc82c39d-592e-4754-a5e1-361bc2135cae︠
k.<a> = GF(9)
k
︡47fe1c54-db46-4832-a258-e13a83bafab5︡{"stdout":"Finite Field in a of size 3^2\n"}︡
︠19a38d95-4417-49e7-8811-22df190b812f︠
b = a+1; c = a+2
b, c
︡705aa5de-a493-4a04-943b-87977d2d6424︡{"stdout":"(a + 1, a + 2)\n"}︡
︠49a6a7f6-3f53-4634-b5c6-45f887a5f4b9︠
%time b*c
︡d0aee924-7a0f-4b99-8405-4062fd73e265︡{"stdout":"a\n"}︡{"stdout":"CPU time: 0.00 s, Wall time: 0.00 s\n"}︡
︠03079baa-54af-4cb7-b791-8ea81c25122e︠
%timeit b*c
︡35df14d2-60de-4019-bbf8-ad6b9f07443b︡{"stdout":"625 loops, best of 3: 76.7 ns per loop\n"}︡
︠785aeeb2-14e9-439b-81fe-129a0aa97ec2︠
%time f0(10^7)
︡32aef22a-70dc-4ee8-a949-d6b6848364a7︡{"stdout":"100000000000000"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 1.22 s, Wall time: 1.22 s\n"}︡
︠f1f51f36-44ce-401d-b7f4-c2c0280fc955︠
%time f1(10^7)   # very fast, C semantics (so silent overflow), etc.
︡cbeb0e45-fa16-49b5-84f8-e060df777c7b︡{"stdout":"<type 'int'>\n100000000000000\n"}︡{"stdout":"CPU time: 0.01 s, Wall time: 0.01 s\n"}︡
︠24dbdf79-e556-4d85-9d5d-ed8291bc3582︠
3.63/0.01
︡b1b41dd3-83e6-45c5-92fa-1c0adbf8857c︡{"stdout":"363.000000000000\n"}︡
︠3c43fb6d-43a9-4970-8a06-064e4a1412e1︠



︠1a3cff50-dd31-4350-a33e-6cf47f03a8fdi︠
%md
- **GAP**: Groups, Algorithms and Programming -- a System for Computational Discrete Algebra

"GAP is a system for computational discrete algebra, with particular emphasis on Computational Group Theory. GAP provides a programming language, a library of thousands of functions implementing algebraic algorithms written in the GAP language as well as large data libraries of algebraic objects."
<http://www.gap-system.org/>

︡2f97a817-4284-4748-ab5e-9e93cbd2edfa︡{"html":"<ul>\n<li><strong>GAP</strong>: Groups, Algorithms and Programming &#8211; a System for Computational Discrete Algebra</li>\n</ul>\n\n<p>&#8220;GAP is a system for computational discrete algebra, with particular emphasis on Computational Group Theory. GAP provides a programming language, a library of thousands of functions implementing algebraic algorithms written in the GAP language as well as large data libraries of algebraic objects.&#8221;\n<a href=\"http://www.gap-system.org/\">http://www.gap-system.org/</a></p>\n"}︡
︠c3247287-2bac-411f-8217-46b38296407c︠
G = SymmetricGroup(4); G
︡5203a571-267d-4555-93a4-189afb722633︡{"stdout":"Symmetric group of order 4! as a permutation group\n"}︡
︠df073f22-3711-4473-902f-b082bc9643f0︠
list(G)
︡0966982c-7a95-4844-b582-2718110271d3︡{"stdout":"[(), (3,4), (2,3), (2,3,4), (2,4,3), (2,4), (1,2), (1,2)(3,4), (1,2,3), (1,2,3,4), (1,2,4,3), (1,2,4), (1,3,2), (1,3,4,2), (1,3), (1,3,4), (1,3)(2,4), (1,3,2,4), (1,4,3,2), (1,4,2), (1,4,3), (1,4), (1,4,2,3), (1,4)(2,3)]"}︡{"stdout":"\n"}︡
︠27e2be3e-72d6-4b6c-8430-9bd5bada70f1︠
G.algebra
︠5e04b852-5bfb-4014-ba7b-2e2584c85913︠
# This uses nontrivial functionality of GAP behind the scenes...
for H in G.normal_subgroups():
    print H
︡94aef2b2-7c8a-4b0a-a386-f396c67ed1c2︡{"stdout":"Subgroup of (Symmetric group of order 4! as a permutation group) generated by [()]\nSubgroup of (Symmetric group of order 4! as a permutation group) generated by [(1,3)(2,4), (1,4)(2,3)]\nSubgroup of (Symmetric group of order 4! as a permutation group) generated by [(2,4,3), (1,3)(2,4), (1,4)(2,3)]\nSubgroup of (Symmetric group of order 4! as a permutation group) generated by [(1,2), (1,2,3,4)]\n"}︡
︠b442065d-23a1-4068-9466-37e62c458bf0︠
groups.permutationutation.
︠73112e97-9061-413a-954a-80a7540aff5a︠
groups.permutatio
︠84443dba-998f-45e9-b3b2-a0b97ff94a0fi︠
%md
Directly using GAP (see <http://www.gap-system.org/Manuals/doc/tut/chap5.html#X8171DAF2833FF728>)
︡408692f3-25ac-4718-8fca-d650a35f46d6︡{"html":"<p>Directly using GAP (see <a href=\"http://www.gap-system.org/Manuals/doc/tut/chap5.html#X8171DAF2833FF728\">http://www.gap-system.org/Manuals/doc/tut/chap5.html#X8171DAF2833FF728</a>)</p>\n"}︡
︠65d65d61-2adb-4e81-a0ec-a29df94876bf︠
%gap
s8 := Group( (1,2), (1,2,3,4,5,6,7,8) );
︡f8505689-d20e-4454-b746-f6b76af890e6︡{"stdout":"Group([ (1,2), (1,2,3,4,5,6,7,8) ])"}︡
︠437168ce-7ae3-4567-b327-c6006f929981︠
%gap
a8 := DerivedSubgroup( s8 );
︡547194f4-5377-4637-9556-73c564fe77d7︡{"stdout":"Group([ (1,2,3), (2,3,4), (2,4)(3,5), (2,6,4), (2,4)(5,7), (2,8,6,4)(3,5) ])"}︡
︠a9eec74e-9dc3-4063-9860-da5394695945︠
%gap
Size( a8 ); IsAbelian( a8 ); IsPerfect( a8 );
︡02e5b257-535a-41ce-b93a-1cabcbadfe1a︡{"stdout":"20160\nfalse\ntrue"}︡
︠7b1a29d7-7b11-4d47-9b25-dfc0ad9a69dd︠
%gap
IsNaturalAlternatingGroup(a8);
︡012e9eb5-9cd6-4d09-9f4c-bd01827d33f0︡{"stdout":"true"}︡
︠620b1d44-7d43-4db8-ba3c-6373faaacab7i︠
%md
NOTE: You can switch a whole worksheet into gap mode by typing

        %default_mode gap
︡67b860d9-ee2a-4172-a159-868176e4adea︡{"html":"<p>NOTE: You can switch a whole worksheet into gap mode by typing</p>\n\n<pre><code>    %default_mode gap\n</code></pre>\n"}︡
︠0b92b38d-a394-465d-a162-6b39d229f93c︠

︠92205c5f-9fc2-4757-a6e6-eda5c0df9515︠

︠a182799c-de37-4267-ab9b-c7a602835e8di︠

%md
- **Pillow**: image processing capabilities to [Sage].

<http://pillow.readthedocs.org/en/latest/> says Pillow:

 - provides extensive file format support, an efficient internal representation, and fairly powerful image processing capabilities.

 - designed for fast access to data stored in a few basic pixel formats. [...] a solid foundation for a general image processing tool.

 - create thumbnails, convert between file formats, print images, etc.

 - point operations, filtering with a set of built-in convolution kernels, and colour space conversions, image resizing, rotation and arbitrary affine transforms.
︡33447702-a5c5-4b5a-b543-2adb26abad46︡{"html":"<ul>\n<li><strong>Pillow</strong>: image processing capabilities to [Sage].</li>\n</ul>\n\n<p><a href=\"http://pillow.readthedocs.org/en/latest/\">http://pillow.readthedocs.org/en/latest/</a> says Pillow:</p>\n\n<ul>\n<li><p>provides extensive file format support, an efficient internal representation, and fairly powerful image processing capabilities.</p></li>\n<li><p>designed for fast access to data stored in a few basic pixel formats. [&#8230;] a solid foundation for a general image processing tool.</p></li>\n<li><p>create thumbnails, convert between file formats, print images, etc.</p></li>\n<li><p>point operations, filtering with a set of built-in convolution kernels, and colour space conversions, image resizing, rotation and arbitrary affine transforms.</p></li>\n</ul>\n"}︡
︠86c3cfab-7bab-4ae9-8934-e03631685c58︠
from PIL import Image
︡04b0ded7-0a2a-49a4-be3e-8d9324e8aef4︡
︠caf21218-8322-4880-b3d9-581ce7f97b6c︠
im = Image.open("santi.png")
︡4baabddc-e9b1-4a3b-b300-d5118a33580d︡
︠c403a4be-3982-43b8-b738-11f9f934429ao,o︠
print(im.format, im.size, im.mode)
︡b497eefe-922b-409f-a72a-8990ee8e45b4︡{"stdout":"('PNG', (510, 472), 'RGB')\n"}︡
︠593f4c13-c1f2-47cf-b5e2-2b46354b237eo,o︠
# convert file to a JPEG (and view it)
im.save("tmp.jpg"); salvus.file("tmp.jpg")
︡7aac346b-18d2-468f-866b-c581d96dffc6︡{"once":false,"file":{"show":true,"uuid":"3f8dd807-ae11-4d8d-8c79-3aa26fe00ef3","filename":"tmp.jpg"}}︡
︠585d6671-abec-4fb8-89ce-38d80863d848o,o︠
# create a thumbnail
im = Image.open("santi.png")
im.thumbnail((128,128))
im.save('thumb.png'); salvus.file('thumb.png')
︡e7a17e6c-acff-4987-ba4b-b5f99098531b︡{"once":false,"file":{"show":true,"uuid":"043225f0-ae89-4eba-a084-5d8737dda60f","filename":"thumb.png"}}︡
︠85f7eab8-985a-4ae8-9975-b7e11cd9a64eo,o︠
# copy, flip, and paste a region
im = Image.open("santi.png")
box = (100, 100, 400, 400)
region = im.crop(box)
region = region.transpose(Image.ROTATE_180)
im.paste(region, box)
im.save("tmp3.jpg"); salvus.file("tmp3.jpg")
︡40971761-6199-46e3-b646-18c5bcb5bcd8︡{"once":false,"file":{"show":true,"uuid":"0ee1298d-8254-41fc-abb1-ada624536918","filename":"tmp3.jpg"}}︡
︠2a59939c-5f19-4fb8-b992-ef19f3c23276o,o︠
# copy, rotate, and paste a region
im = Image.open("santi.png")
box = (100, 100, 400, 400); region = im.crop(box)
region = region.rotate(-30)
im.paste(region, box)
im.save("tmp.jpg"); salvus.file("tmp.jpg")
︡c045403a-2cd0-4a56-87d7-8d9897346865︡{"once":false,"file":{"show":true,"uuid":"7f49a584-5298-4d82-a155-ec75555f36f8","filename":"tmp.jpg"}}︡
︠26e569ea-641c-4f5f-9ab4-397b1ecb0763o,o︠
from PIL import ImageFilter
out = im.filter(ImageFilter.CONTOUR)
out.save("tmp.jpg"); salvus.file("tmp.jpg")
︡c24eca11-bdcc-4651-a374-854aaeb2712f︡{"once":false,"file":{"show":true,"uuid":"c3c738d8-5a43-4beb-a301-78536f076e40","filename":"tmp.jpg"}}︡
︠ca5d6df0-b158-4b6c-897d-0bf2fd91a583o,o︠
from PIL import ImageFilter
filters = [x for x in dir(ImageFilter) if hasattr(getattr(ImageFilter,x),'name')]
@interact
def _(filter = selector(filters,buttons=True)):
    out = im.filter(getattr(ImageFilter, filter))
    out.save("tmp.jpg"); salvus.file("tmp.jpg")

︡3b29282d-c847-4418-99a7-0d59d6c7b2ff︡{"interact":{"style":"None","flicker":false,"layout":[[["filter",12,null]],[["",12,null]]],"id":"bc4fe461-4d3b-4a1f-83e1-d05d217cd6a9","controls":[{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["BLUR","CONTOUR","DETAIL","EDGE_ENHANCE","EDGE_ENHANCE_MORE","EMBOSS","FIND_EDGES","GaussianBlur","MaxFilter","MedianFilter","MinFilter","ModeFilter","RankFilter","SHARPEN","SMOOTH","SMOOTH_MORE","UnsharpMask"],"label":"filter","nrows":null,"width":null,"var":"filter"}]}}︡
︠d43d8016-9340-43e3-b958-298a459a37eco,o︠










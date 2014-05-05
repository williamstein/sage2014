︠1d8d0898-2f6a-439b-afcd-9fbf238f8074i︠
%md

# Math 480b -- Sage Course
## Overview of Sage

## May 5, 2014

Screencast: <http://youtu.be/tNQN7WPyBD4>

**Plan**

- Questions

- Homework remark: all collected, grading assigned, new homework available

- Build Sage from source -- quick review

- Overview of what is in Sage
︡e5817ee2-d89c-4e2f-a2ca-a23f72c9d52f︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>Overview of Sage</h2>\n\n<h2>May 5, 2014</h2>\n\n<p>Screencast: <a href=\"http://youtu.be/tNQN7WPyBD4\">http://youtu.be/tNQN7WPyBD4</a></p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions</p></li>\n<li><p>Homework remark: all collected, grading assigned, new homework available</p></li>\n<li><p>Build Sage from source &#8211; quick review</p></li>\n<li><p>Overview of what is in Sage</p></li>\n</ul>\n"}︡
︠8c65abd5-3e15-4bf2-a92f-2bd2ee2c52a4︠
u = (x^2, x, x+3)
︡33f198c1-73d0-40a9-92c3-599a0f0a77a5︡
︠fd6a7423-81e6-43cd-b72c-af929d9b3e09︠
u
︡4224fb56-9d34-47bb-b10e-e03163c1acdb︡{"stdout":"(x^2, x, x + 3)\n"}︡
︠8db3732f-1173-469b-9dd5-902d61ccd579︠
tuple(a(x=4) for a in u)
︡467f57c6-55b6-413e-b2b7-cf512ff5bf4b︡{"stdout":"(16, 4, 7)\n"}︡
︠5faf573c-e9de-44bd-b9dc-11d872face9d︠
u
︡ce1ba193-3fad-4d98-bb8d-90e205c8384a︡{"stdout":"(x^2, x, x + 3)\n"}︡
︠b0547846-f96a-4260-8ec6-c4db0115caba︠

︠5d914d16-efe4-465b-84f5-fc4e92dd77a3i︠
%md

<img src="http://3.bp.blogspot.com/-8z54WpUD61Y/TscH_EbhmyI/AAAAAAAAAMM/DDoQINTDOko/s320/tamaguchi.jpg">

## Check on our personal copies of Sage

- Everybody should build their own copy of Sage from source.  So far 8 (of 40) of you have: Brian Chan, Taran Dike, Robert Irving, Matt Lorentz, Brad Schlenker, Yueqi Sheng, Bryant Wong, Yamin Zhou.  Everybody else, do it!  Think of your Sage install as like a tamaguchi or something...

        git clone git://github.com/sagemath/sage.git
        cd sage
        make


<br>
Let's check on our builds.


        ~% cd ~/sage
        ~/sage% du -sch .
        1.9G    .
        1.9G    total
        ~/sage% ./sage
        # it works; type quit


<br>Let's change something!

        ~/sage% open src/sage/all.py   # put a print statement at the end
        ~/sage% ./sage -br
        ~/sage% git status
        ~/sage% git diff



︡827cf2fb-d0a7-48c6-a9d4-1b12b96f11fa︡{"html":"<p><img src=\"http://3.bp.blogspot.com/-8z54WpUD61Y/TscH_EbhmyI/AAAAAAAAAMM/DDoQINTDOko/s320/tamaguchi.jpg\"></p>\n\n<h2>Check on our personal copies of Sage</h2>\n\n<ul>\n<li><p>Everybody should build their own copy of Sage from source.  So far 8 (of 40) of you have: Brian Chan, Taran Dike, Robert Irving, Matt Lorentz, Brad Schlenker, Yueqi Sheng, Bryant Wong, Yamin Zhou.  Everybody else, do it!  Think of your Sage install as like a tamaguchi or something&#8230;</p>\n\n<pre><code>git clone git://github.com/sagemath/sage.git\ncd sage\nmake\n</code></pre></li>\n</ul>\n\n<p><br>\nLet&#8217;s check on our builds.</p>\n\n<pre><code>    ~% cd ~/sage\n    ~/sage% du -sch .\n    1.9G    .\n    1.9G    total\n    ~/sage% ./sage\n    # it works; type quit\n</code></pre>\n\n<p><br>Let&#8217;s change something!</p>\n\n<pre><code>    ~/sage% open src/sage/all.py   # put a print statement at the end\n    ~/sage% ./sage -br\n    ~/sage% git status\n    ~/sage% git diff\n</code></pre>\n"}︡
︠2e99eed9-235e-4302-96b4-98efaf1b4bcb︠
SAGE_ROOT
︡cc3cf968-b3cf-4772-b78b-0a7e18597318︡{"stdout":"'/usr/local/sage/sage-6.2.rc0'\n"}︡
︠aedd45fa-5f83-4ef2-b3a7-abf08eba676f︠
factor??
︡2ee5e043-7a24-41cc-afe7-06c5b0efc6b8︡{"stdout":"   File: /usr/local/sage/sage-6.2.rc0/local/lib/python2.7/site-packages/sage/rings/arith.py\n   Source:\n   def factor(n, proof=None, int_=False, algorithm='pari', verbose=0, **kwds):\n    \"\"\"\n    Returns the factorization of ``n``.  The result depends on the\n    type of ``n``.\n\n    If ``n`` is an integer, returns the factorization as an object\n    of type ``Factorization``.\n\n    If n is not an integer, ``n.factor(proof=proof, **kwds)`` gets called.\n    See ``n.factor??`` for more documentation in this case.\n\n    .. warning::\n\n       This means that applying ``factor`` to an integer result of\n       a symbolic computation will not factor the integer, because it is\n       considered as an element of a larger symbolic ring.\n\n       EXAMPLE::\n\n           sage: f(n)=n^2\n           sage: is_prime(f(3))\n           False\n           sage: factor(f(3))\n           9\n\n    INPUT:\n\n    -  ``n`` - an nonzero integer\n\n    -  ``proof`` - bool or None (default: None)\n\n    -  ``int_`` - bool (default: False) whether to return\n       answers as Python ints\n\n    -  ``algorithm`` - string\n\n       - ``'pari'`` - (default) use the PARI c library\n\n       - ``'kash'`` - use KASH computer algebra system (requires the\n         optional kash package be installed)\n\n       - ``'magma'`` - use Magma (requires magma be installed)\n\n    -  ``verbose`` - integer (default: 0); PARI's debug\n       variable is set to this; e.g., set to 4 or 8 to see lots of output\n       during factorization.\n\n    OUTPUT:\n\n    -  factorization of n\n\n    The qsieve and ecm commands give access to highly optimized\n    implementations of algorithms for doing certain integer\n    factorization problems. These implementations are not used by the\n    generic factor command, which currently just calls PARI (note that\n    PARI also implements sieve and ecm algorithms, but they aren't as\n    optimized). Thus you might consider using them instead for certain\n    numbers.\n\n    The factorization returned is an element of the class\n    :class:`~sage.structure.factorization.Factorization`; see Factorization??\n    for more details, and examples below for usage. A Factorization contains\n    both the unit factor (+1 or -1) and a sorted list of (prime, exponent)\n    pairs.\n\n    The factorization displays in pretty-print format but it is easy to\n    obtain access to the (prime,exponent) pairs and the unit, to\n    recover the number from its factorization, and even to multiply two\n    factorizations. See examples below.\n\n    EXAMPLES::\n\n        sage: factor(500)\n        2^2 * 5^3\n        sage: factor(-20)\n        -1 * 2^2 * 5\n        sage: f=factor(-20)\n        sage: list(f)\n        [(2, 2), (5, 1)]\n        sage: f.unit()\n        -1\n        sage: f.value()\n        -20\n        sage: factor( -next_prime(10^2) * next_prime(10^7) )\n        -1 * 101 * 10000019\n\n    ::\n\n        sage: factor(-500, algorithm='kash')      # optional - kash\n        -1 * 2^2 * 5^3\n\n    ::\n\n        sage: factor(-500, algorithm='magma')     # optional - magma\n        -1 * 2^2 * 5^3\n\n    ::\n\n        sage: factor(0)\n        Traceback (most recent call last):\n        ...\n        ArithmeticError: Prime factorization of 0 not defined.\n        sage: factor(1)\n        1\n        sage: factor(-1)\n        -1\n        sage: factor(2^(2^7)+1)\n        59649589127497217 * 5704689200685129054721\n\n    Sage calls PARI's factor, which has proof False by default.\n    Sage has a global proof flag, set to True by default (see\n    :mod:`sage.structure.proof.proof`, or proof.[tab]). To override\n    the default, call this function with proof=False.\n\n    ::\n\n        sage: factor(3^89-1, proof=False)\n        2 * 179 * 1611479891519807 * 5042939439565996049162197\n\n    ::\n\n        sage: factor(2^197 + 1)  # long time (2s)\n        3 * 197002597249 * 1348959352853811313 * 251951573867253012259144010843\n\n    Any object which has a factor method can be factored like this::\n\n        sage: K.<i> = QuadraticField(-1)\n        sage: factor(122 - 454*i)\n        (-1) * (-i - 4) * (-3*i - 2) * (-i - 2)^3 * (i + 1)^3\n\n    To access the data in a factorization::\n\n        sage: f = factor(420); f\n        2^2 * 3 * 5 * 7\n        sage: [x for x in f]\n        [(2, 2), (3, 1), (5, 1), (7, 1)]\n        sage: [p for p,e in f]\n        [2, 3, 5, 7]\n        sage: [e for p,e in f]\n        [2, 1, 1, 1]\n        sage: [p^e for p,e in f]\n        [4, 3, 5, 7]\n\n    \"\"\"\n    if isinstance(n, (int, long)):\n        n = ZZ(n)\n\n    if isinstance(n, integer.Integer):\n        return n.factor(proof=proof, algorithm=algorithm,\n                        int_ = int_, verbose=verbose)\n    else:\n        # e.g. n = x**2 + y**2 + 2*x*y\n        try:\n            return n.factor(proof=proof, **kwds)\n        except AttributeError:\n            raise TypeError(\"unable to factor n\")\n        except TypeError:\n            # Just in case factor method doesn't have a proof option.\n            try:\n                return n.factor(**kwds)\n            except AttributeError:\n                raise TypeError(\"unable to factor n\")\n"}︡{"stdout":"\n"}︡
︠66dfdd98-2856-4967-9e87-f01a967ca55e︠

︠23f46c03-cfe1-4fc1-9c31-28eb6a5f84efi︠
%md

<img src="http://sagemath.org/pix/sage_logo_new.png">

## What is SageMath?


1. A self-contained **distribution** of open source math-related software that builds from source on Linux, OS X, Solaris, and Cygwin.

2. A **Python library** that smoothly ties together these packages, and adds (a *lot of*) new functionality to fill in the gaps.

<br>
In addition, you can

 - install third-party **packages** into Sage, including:
     - Python packages (43228 packages): <https://pypi.python.org/pypi>
     - R packages (5509 packages): <http://cran.r-project.org/web/packages/>
     - GAP packages (115 packages): <http://www.gap-system.org/Packages/packages.html><br><br>

 - use **interfaces** to most other math software, e.g., Mathematica, Maple, Matlab, Scilab, Octave, etc.  Type `help(sage.interfaces)`.

︡20ccb9a2-046b-4522-9444-32453b962542︡{"html":"<p><img src=\"http://sagemath.org/pix/sage_logo_new.png\"></p>\n\n<h2>What is SageMath?</h2>\n\n<ol>\n<li><p>A self-contained <strong>distribution</strong> of open source math-related software that builds from source on Linux, OS X, Solaris, and Cygwin.</p></li>\n<li><p>A <strong>Python library</strong> that smoothly ties together these packages, and adds (a <em>lot of</em>) new functionality to fill in the gaps.</p></li>\n</ol>\n\n<p><br>\nIn addition, you can</p>\n\n<ul>\n<li><p>install third-party <strong>packages</strong> into Sage, including:</p>\n\n<ul>\n<li>Python packages (43228 packages): <a href=\"https://pypi.python.org/pypi\">https://pypi.python.org/pypi</a></li>\n<li>R packages (5509 packages): <a href=\"http://cran.r-project.org/web/packages/\">http://cran.r-project.org/web/packages/</a></li>\n<li>GAP packages (115 packages): <a href=\"http://www.gap-system.org/Packages/packages.html\">http://www.gap-system.org/Packages/packages.html</a><br><br></li>\n</ul></li>\n<li><p>use <strong>interfaces</strong> to most other math software, e.g., Mathematica, Maple, Matlab, Scilab, Octave, etc.  Type <code>help(sage.interfaces)</code>.</p></li>\n</ul>\n"}︡
︠245f0e35-566e-4779-9a43-f79b38009c44︠
# Python moto: "Batteries Included"
salvus.file('python-batteries.png')
︡eb9c5086-f544-4145-8033-8f93acf7f362︡{"once":false,"file":{"show":true,"uuid":"347b0efc-e1a5-4c76-aae4-64d2e8cce471","filename":"python-batteries.png"}}︡
︠2331199c-7e98-4c63-b3c8-8b5683de8012︠

︠8072cef4-7704-48e4-aaa8-1e978ffbac2f︠

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
︡258ca898-8ea1-4c29-8bc8-384c9cbdbde8︡{"stdout":"CPU time: 0.00 s, Wall time: 0.00 s\n"}︡{"stdout":"CPU time: 0.29 s, Wall time: 0.00 s"}︡{"stdout":"\n"}︡
︠e6825f4c-2be5-4cf9-a35a-396648b8bcb7︠

︠fcd13fdb-276a-488b-876d-d438b9102156i︠
%md
 - **cvxopt**: big convex optimization package; "Convex minimization has applications in a wide range of disciplines, such as automatic control systems, estimation and signal processing, communications and networks, electronic circuit design, data analysis and modeling, statistics (optimal design), and finance." -- Wikipedia

Example here: <http://cvxopt.org/examples/tutorial/lp.html>

<img src="http://cvxopt.org/_images/math/6c7602a7b7dac314c2ee41126fa771a3375d60b7.png">
︡7a36813d-f624-4d21-8483-8f1434181e6f︡{"html":"<ul>\n<li><strong>cvxopt</strong>: big convex optimization package; &#8220;Convex minimization has applications in a wide range of disciplines, such as automatic control systems, estimation and signal processing, communications and networks, electronic circuit design, data analysis and modeling, statistics (optimal design), and finance.&#8221; &#8211; Wikipedia</li>\n</ul>\n\n<p>Example here: <a href=\"http://cvxopt.org/examples/tutorial/lp.html\">http://cvxopt.org/examples/tutorial/lp.html</a></p>\n\n<p><img src=\"http://cvxopt.org/_images/math/6c7602a7b7dac314c2ee41126fa771a3375d60b7.png\"></p>\n"}︡
︠de62f840-1289-47a8-aa52-e399261007d0︠
%python  # disable preparsing in this cell; alternatively, do RealNumber=float
from cvxopt import matrix, solvers
A = matrix([ [-1.0, -1.0, 0.0, 1.0], [1.0, -1.0, -1.0, -2.0] ])
b = matrix([ 1.0, -2.0, 0.0, 4.0 ])
c = matrix([ 2.0, 1.0 ])
sol=solvers.lp(c,A,b)
print(sol['x'])
︡33021024-ddfc-4174-95e9-5846bc4e8966︡{"stdout":"     pcost       dcost       gap    pres   dres   k/t"}︡{"stdout":"\n 0:  2.6471e+00 -7.0588e-01  2e+01  8e-01  2e+00  1e+00\n 1:  3.0726e+00  2.8437e+00  1e+00  1e-01  2e-01  3e-01\n 2:  2.4891e+00  2.4808e+00  1e-01  1e-02  2e-02  5e-02\n 3:  2.4999e+00  2.4998e+00  1e-03  1e-04  2e-04  5e-04\n 4:  2.5000e+00  2.5000e+00  1e-05  1e-06  2e-06  5e-06\n 5:  2.5000e+00  2.5000e+00  1e-07  1e-08  2e-08  5e-08\nOptimal solution found.\n"}︡{"stdout":"[ 5.00e-01]\n[ 1.50e+00]\n\n"}︡
︠081c8298-ea4c-4f12-be72-7905cec1bd95︠

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
︡59f18d02-2cae-42b2-b9f3-0282f845449f︡
︠75f3aa1b-b432-4e4c-88e0-cd9d47bc1a9co︠
%cython
def f1(int n):
    cdef long m, k=0
    for m in range(n):
        k += 2*m+1
    return k
︡031fa47a-df96-4b6f-ae38-46620a2a126c︡{"once":false,"file":{"show":false,"uuid":"e84e02f2-fdb6-49e6-846f-b80b50e26cdb","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/12203/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_12203_dir_hDFZy5_a_pyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_12203_dir_hDFZy5_a_pyx_0.html"}}︡{"html":"<a href='/blobs//projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/12203/spyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_12203_dir_hDFZy5_a_pyx/_projects_74af30b7_ad25_4308_a02e_c71fcd84de6e__sage_temp_compute19dc0_12203_dir_hDFZy5_a_pyx_0.html?uuid=e84e02f2-fdb6-49e6-846f-b80b50e26cdb' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='fa fa-external-link'></i></a>"}︡
︠19a38d95-4417-49e7-8811-22df190b812f︠
︠785aeeb2-14e9-439b-81fe-129a0aa97ec2︠
%time f0(10^7)
︡1b568af4-7940-4d17-9867-c0b1306ba7bb︡{"stdout":"100000000000000"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 3.63 s, Wall time: 3.08 s\n"}︡
︠f1f51f36-44ce-401d-b7f4-c2c0280fc955︠
%time f1(10^7)   # very fast, C semantics (so silent overflow), etc.
︡f2b34f9d-4f07-4577-a3d6-c7364a2326c4︡{"stdout":"100000000000000\n"}︡{"stdout":"CPU time: 0.01 s, Wall time: 0.00 s\n"}︡
︠24dbdf79-e556-4d85-9d5d-ed8291bc3582︠
3.63/0.01
︡b1b41dd3-83e6-45c5-92fa-1c0adbf8857c︡{"stdout":"363.000000000000\n"}︡
︠3c43fb6d-43a9-4970-8a06-064e4a1412e1︠



︠49a52787-3809-49c6-a60e-7b3b0e082504︠

︠89e58aa2-763f-4763-9702-78d6ba804d4bi︠
%md

<img src="http://skunklogic.com/strips/lisp.png">
<br><br>

- **ecl**: Embedded Common Lisp -- used by Maxima; but makes using lisp from Sage fast.
If you like lisp try %lisp in the notebook.


︡0d0d6c04-348d-4a58-919b-ae296be3de36︡{"html":"<p><img src=\"http://skunklogic.com/strips/lisp.png\">\n<br><br></p>\n\n<ul>\n<li><strong>ecl</strong>: Embedded Common Lisp &#8211; used by Maxima; but makes using lisp from Sage fast. \nIf you like lisp try %lisp in the notebook.</li>\n</ul>\n"}︡
︠36c364cd-f0e5-4248-aa54-9be215458900︠
%lisp

(+ 3 5)
︡599b4de3-7251-4bae-8255-98d4cc9044eb︡{"stdout":"8"}︡
︠4f51fac3-5064-4add-8692-408a0b8a9da0︠
%lisp
(setq a 13)
(setq b 17)
︡dc998d28-b219-4059-bdcf-84b7843eafb9︡{"stdout":"13"}︡
︠51e67003-419b-46b0-b200-a170ba68b0ec︠
%lisp
(* a b)
︡2f44ef2c-bf71-4a52-8951-4ba82419bf9a︡{"stdout":"221"}︡
︠0b482972-6b3d-4557-9aaf-3ff4534a454a︠
%lisp
(defun factors (n &aux (lows '()) (highs '()))
  (do ((limit (isqrt n)) (factor 1 (1+ factor)))
      ((= factor limit)
       (when (= n (* limit limit))
         (push limit highs))
       (nreconc lows highs))
    (multiple-value-bind (quotient remainder) (floor n factor)
      (when (zerop remainder)
        (push factor lows)
        (push quotient highs)))))
︡160860ef-817d-42a7-a400-8c8058a34d18︡{"stdout":"FACTORS"}︡
︠f167ba7f-23d6-4eba-877a-759de28995a5︠
%lisp
(factors 2015)
︡13f7e1fc-b5a7-4f0c-9acd-ad81dcc612cb︡{"stdout":"(1 5 13 31 65 155 403 2015)"}︡
︠88ca0a5e-2eb7-4497-b764-547128f0a293︠

︠1a3cff50-dd31-4350-a33e-6cf47f03a8fdi︠
%md
- **GAP**: Groups, Algorithms and Programming -- a System for Computational Discrete Algebra

"GAP is a system for computational discrete algebra, with particular emphasis on Computational Group Theory. GAP provides a programming language, a library of thousands of functions implementing algebraic algorithms written in the GAP language as well as large data libraries of algebraic objects."
<http://www.gap-system.org/>

︡2f97a817-4284-4748-ab5e-9e93cbd2edfa︡{"html":"<ul>\n<li><strong>GAP</strong>: Groups, Algorithms and Programming &#8211; a System for Computational Discrete Algebra</li>\n</ul>\n\n<p>&#8220;GAP is a system for computational discrete algebra, with particular emphasis on Computational Group Theory. GAP provides a programming language, a library of thousands of functions implementing algebraic algorithms written in the GAP language as well as large data libraries of algebraic objects.&#8221;\n<a href=\"http://www.gap-system.org/\">http://www.gap-system.org/</a></p>\n"}︡
︠c3247287-2bac-411f-8217-46b38296407c︠
G = SymmetricGroup(4); G
︡76453f13-2875-4741-81d5-d18dc62c5cea︡{"stdout":"Symmetric group of order 4! as a permutation group\n"}︡
︠5e04b852-5bfb-4014-ba7b-2e2584c85913︠
# This uses nontrivial functionality of GAP behind the scenes...
for H in G.normal_subgroups():
    print H
︡94aef2b2-7c8a-4b0a-a386-f396c67ed1c2︡{"stdout":"Subgroup of (Symmetric group of order 4! as a permutation group) generated by [()]\nSubgroup of (Symmetric group of order 4! as a permutation group) generated by [(1,3)(2,4), (1,4)(2,3)]\nSubgroup of (Symmetric group of order 4! as a permutation group) generated by [(2,4,3), (1,3)(2,4), (1,4)(2,3)]\nSubgroup of (Symmetric group of order 4! as a permutation group) generated by [(1,2), (1,2,3,4)]\n"}︡
︠73112e97-9061-413a-954a-80a7540aff5a︠
groups.permutation.<tab>
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
︠a182799c-de37-4267-ab9b-c7a602835e8d︠

︠d971258c-381e-490f-8cc8-3e4c45828c9c︠

# next time, some subset of these...

gdmodule-0.56.tar.bz2
genus2reduction-0.3.tar.bz2
gf2x-1.1.tar.bz2
gfan-0.5.tar.bz2
git-1.8.4.4.tar.bz2
givaro-3.7.1.tar.bz2
glpk-4.44.tar.bz2
graphs-20120404.tar.bz2
gsl-1.15.tar.bz2
iconv-1.14.tar.bz2
iml-1.0.3.tar.bz2
ipython-0.13.2.tar.bz2
jinja2-2.5.5.tar.bz2
jmol-12.3.27.tar.bz2
lcalc-1.23.tar.bz2
libfplll-4.0.4.tar.bz2
libgap-4.6.4.tar.bz2
libm4ri-20130416.tar.bz2
libm4rie-20130416.tar.bz2
libpng-1.2.35.tar.bz2
linbox-1.3.2.tar.bz2
lrcalc-1.1.6.tar.bz2
matplotlib-1.2.1.tar.bz2
maxima-5.29.1.tar.bz2
mpc-1.0.tar.bz2
mpfi-1.5.1.tar.bz2
mpfr-3.1.2.tar.bz2
mpir-2.6.0.tar.bz2
mpmath-0.17.tar.bz2
ncurses-5.9.tar.bz2
networkx-1.8.1.tar.gz
ntl-5.5.2.tar.bz2
numpy-1.7.0.tar.bz2
palp-2.1.tar.bz2
pari-2.5.5.tar.bz2
patch-2.5.9.tar.bz2
pexpect-2.0.tar.bz2
Pillow-2.2.2.tar.gz
polybori-0.8.3.tar.bz2
polytopes_db-20120220.tar.bz2
ppl-1.1pre9.tar.bz2
pycrypto-2.6.1.tar.gz
pygments-1.3.1.tar.bz2
pynac-0.3.0.tar.bz2
python-2.7.5.tar.bz2
r-3.0.2.tar.bz2
ratpoints-2.1.3.tar.bz2
readline-6.2.tar.bz2
rpy2-2.3.8.tar.gz
rubiks-20070912.tar.bz2
sagenb-0.10.8.2.tar
sagetex-2.3.4.tar.bz2
scipy-0.12.0.tar.bz2
scons-1.2.0.tar.bz2
setuptools-0.6.16.tar.bz2
singular-3.1.5.tar.bz2
sphinx-1.1.2.tar.bz2
sqlalchemy-0.5.8.tar.bz2
sqlite-3.7.17.tar.bz2
symmetrica-2.0.tar.bz2
sympow-1.018.1.tar.bz2
sympy-0.7.4.tar.gz
tachyon-0.98.9.tar.bz2
zlib-1.2.8.tar.bz2
zn_poly-0.9.tar.bz2



︠41f739d7-3c59-40e4-854c-53819a7c3cfb︠

︠dc2d96ae-177a-49d2-accd-fd2d45cc0511︠












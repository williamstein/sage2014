︠f442d1b7-b234-4dd5-9f8a-f31f9fcf159ar︠
#Implement crank-nicolson
#Implement Thomas Algorithm to solve tridiagonal
#Hopefully this is finite difference. Then shift it into the cranknic sage file
import math
import numpy as np
from scipy import linalg

#Equation passed needs to be solved so == 0. This way like terms are auto combined
def cranknic(t_range,x_range,ic,eq):

    if len(x_range) != len(ic):
        raise Exception('Initial conditions and x_range do not match')
    
    #Grab step sizes
    k = t_range[1] - t_range[0]
    h = x_range[1] - x_range[0]
    
    ##IC needs to be m,1 dimension, not 1d array
    
    #Manipulate equation
    var('uin','uipn','uimn','uinp','uimnp','uipnp')
    #Define approx.
    approx = {
    u: (uin + uinp)/2, 
    dudt: (uinp - uin)/k,
    dudx: (uipn - uimn)/h,
    du2dx2: ((uipn - 2*uin + uimn)+(uipnp - 2*uinp + uimnp))/(2*(h**2))
    }
    
    show(eq)
    eq_approx = eq(approx) #Make the approximations
    show(eq_approx) #make sure this thing worked
    
    #extract the coefficients
    A = eq_approx.coefficient(uipnp)
    B = eq_approx.coefficient(uinp)
    C = eq_approx.coefficient(uimnp)
    D1 = eq_approx.coefficient(uimn)
    D2 = eq_approx.coefficient(uin)
    D3 = eq_approx.coefficient(uipn)
    
    #Pre-define matrices
    ic = np.array(ic)
    leftcoeff = np.zeros((len(x_range),len(x_range)))
    rightcoeff = np.zeros((len(x_range),len(x_range)))
    d = np.zeros((len(x_range),1))
    sol = np.zeros((len(x_range),1))
       
    #populate first column of solution with ICs
    for i in range(len(x_range)):
        sol[i] = ic[i]
    
    #populate the leftside coeff matrix
    leftcoeff[0][0] = B
    leftcoeff[0][1] = C
    r = len(x_range)-1
    for i in range(1,r):
        leftcoeff[i][i] = B
        leftcoeff[i][i-1] = A
        leftcoeff[i][i+1] = C
    leftcoeff[r][r-1] = A
    leftcoeff[r][r] = B
        
    #populate rightside coeff matrix, make things negative
    rightcoeff[0][0] = -D2
    rightcoeff[0][1] = -D3
    s = len(x_range)-1
    for j in range(1,s):
        rightcoeff[j][j] = -D2
        rightcoeff[j][j-1] = -D1
        rightcoeff[j][j+1] = -D3
    rightcoeff[s][s-1] = -D1
    rightcoeff[s][s] = -D2
        
    #Thomas Algorithm wants a, b, c, d
    #need to grab a, b, c
    m,n = leftcoeff.shape
    a = [leftcoeff[i][j] for i in range(m) for j in range(n) if i == j+1]
    b = [leftcoeff[i][j] for i in range(m) for j in range(n) if i == j]
    c = [leftcoeff[i][j] for i in range(m) for j in range(n) if i == j-1]
    
    #populate D with initial conditions
    #Need to flip signs because original equation is == 0
    # |-> so D1, D2, D3 are negative
    '''
    d[0] = ic[0]*-D2 + ic[1]*-D3
    for i in range(1,m - 1):
        d[i] = ic[i-1]*-D1 + ic[i]*-D2 + ic[i+1]*-D3
    d[m-1] = ic[m-2]*-D1 + ic[m-1]*-D2
    '''
    
    d = np.dot(rightcoeff,ic)
    #####Try scipy built in solve functionality
    nextsol = linalg.solve(leftcoeff, d)
    #print "Linalg.solve solution: ", sol1
    #Use the Thomas Algo
    #nextsol = thomas(a,b,c,d)
    #add solution to solution matrix
    sol = np.append(sol,nextsol, axis=1)
    #replace d with nextsol

    #alternate way to populate, using matrix math
    #c = np.dot(rightcoeff,ic)
    
    #--------------> Begin loop?
    for k in range(1,len(t_range)-1):
        '''
        d[0] = nextsol[0]*-D2 + nextsol[1]*-D3
        for i in range(1,m - 1):
            d[i] = nextsol[i-1]*-D1 + nextsol[i]*-D2 + nextsol[i+1]*-D3
        d[m-1] = nextsol[m-2]*-D1 + nextsol[m-1]*-D2
        '''
        #problem is here, dot is making huge values
        d = np.dot(rightcoeff,nextsol)
        nextsol = linalg.solve(leftcoeff,d)
        sol = np.append(sol,nextsol,axis=1)
        
    #--------------> End loop?
    
    return sol

    #Dp = thomas(A,B,C,D) #calculate the next iteration
    #return a,b,c,d,coefficients
︡6bfe11e5-3e21-4b24-b0a4-96b2901d6cf0︡
︠8e9d9ec7-e3f7-473d-9e27-55581e4f725d︠
def thomas(a,b,c,d):
    n = len(d) - 1 
    c[0] /= b[0]
    d[0] /= b[0]
    for i in range(1, n): 
        c[i] /= b[i] - a[i] * c[i-1]
        d[i] = (d[i] - a[i] * d[i-1]) / (b[i] - a[i] * c[i-1])
    
    #Final interation, one past where c stops.
    d[n] = (d[n] - a[n-1] * d[n-1]) / (b[n] - a[n-1] * c[n-1])
    #Backwards substitution for solution.
    for i in reversed(range(n)):
	    d[i] = d[i] - c[i] * d[i+1]
    return d

︡fd142407-19ea-4db5-83bf-40797b5fb98b︡
︠826e5c7b-0d9b-40a2-bab3-8bd1cf6e38fb︠
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
var('x t u dudt dudx du2dx2')
D = 1
R = 0

#It appears at this point, you can't define the variable in terms of actual derivatives. Can't substitute. 
#dudt = uin.diff(t)
#du2dx2 = u.diff(x,2)
#equation = dudt - du2dx2*D - R  # du/dt = D*d^2u/dx^2 + Reaction
equation = du2dx2*D + R - dudt
#show(equation)

t = np.linspace(0,10,num = 100)
x = np.linspace(0,10,num = 10)
ic = [5 for i in range(0,10)]
ic = np.array(ic)
ic.resize(len(ic),1)

sol = cranknic(t,x,ic,equation)

fig = plt.figure()
what = plt.contourf(t,x,sol)
fig.show()

#IS EMPTY THE PROBLEM? FILLS A MATRIX WITH SMALL NUMBERS NOT ZERO.

︡772fbe4e-72ce-43db-820a-84046f7de82f︡{"stdout":"(x, t, u, dudt, dudx, du2dx2)\n"}︡{"tex":{"tex":"\\mathit{du2dx}_{2} - \\mathit{dudt}","display":true}}︡{"tex":{"tex":"0.405 \\, \\mathit{uimn} + 0.405 \\, \\mathit{uimnp} + 9.09 \\, \\mathit{uin} - 10.71 \\, \\mathit{uinp} + 0.405 \\, \\mathit{uipn} + 0.405 \\, \\mathit{uipnp}","display":true}}︡{"once":false,"file":{"show":true,"uuid":"478a0583-8d80-414c-8ff1-264fb0f9ca9f","filename":"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sage/temp/compute16dc0/13945/tmp_J_BzKR.png"}}︡
︠35f7cf6e-d541-442b-afed-6f1b7e112be6︠

︡7fda5a95-2398-4cb3-ab90-cdd857223abb︡
︠2d31fa47-5e0e-4843-b157-100c74b56c82︠
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
var('x t u dudt du2dx2')
D = 0.07
R = 0

#It appears at this point, you can't define the variable in terms of actual derivatives. Can't substitute. 
#dudt = uin.diff(t)
#du2dx2 = u.diff(x,2)
#equation = dudt - du2dx2*D - R  # du/dt = D*d^2u/dx^2 + Reaction
equation = du2dx2*D + R - dudt
#show(equation)

t = np.linspace(0,10,num = 70)
x = np.linspace(0,1,num = 7)
ic = [i for i in range(0,7)]
ic = np.array(ic)
ic.resize(len(ic),1)

sol = cranknic(t,x,ic,equation)

fig1 = plt.figure()
plt.contourf(t,x,sol)
fig1.show()

fig2 = plt.figure()
plt.plot(sol[:,1])
fig2.show()

#can I animate? using sage objects
#v = [list_plot(sol[:,i],plotjoined=True) for i in range(0,50)]
#anim = animate(v, ymin = 0, ymax = 7)
#show(anim)


︡767431a0-43bc-4c70-b32c-f4ea3c719fe4︡{"stdout":"(x, t, u, dudt, du2dx2)\n"}︡{"stdout":"<matplotlib.contour.QuadContourSet instance at 0xb61c488>\n"}︡{"once":false,"file":{"show":true,"uuid":"b9c5c593-4811-4189-9bf8-cea0a3dd15b0","filename":"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sage/temp/compute16dc0/966/tmp_WpU8G3.png"}}︡{"stdout":"[<matplotlib.lines.Line2D object at 0xb691d10>]\n"}︡{"once":false,"file":{"show":true,"uuid":"7208d4b9-02ff-449f-a2e9-d84ee041cf89","filename":"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sage/temp/compute16dc0/966/tmp_yaksln.png"}}︡{"stderr":"Error in lines 28-28\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sagemathcloud/sage_salvus.py\", line 2196, in show\n    show_animation(obj, **kwds)\n"}︡{"stderr":"  File \"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sagemathcloud/sage_salvus.py\", line 2121, in show_animation\n    obj.gif(savefile=t, **kwds)\n  File \"/usr/local/sage/sage-6.2.rc0/local/lib/python2.7/site-packages/sage/plot/animate.py\", line 583, in gif\n    raise OSError(msg)\nOSError: \nError: Cannot generate GIF animation.  Verify that convert\n(ImageMagick) or ffmpeg is installed, and that the objects passed to\nthe animate command can be saved in PNG image format.\n\nSee www.imagemagick.org and www.ffmpeg.org for more information.\n"}︡
︠b4cb3dd0-b441-49d2-b200-8a80ad3f3026︠
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
var('x t u dudt dudx du2dx2')
D = 0.07
R = 0.5

#It appears at this point, you can't define the variable in terms of actual derivatives. Can't substitute. 
#dudt = uin.diff(t)
#du2dx2 = u.diff(x,2)
#equation = dudt - du2dx2*D - R  # du/dt = D*d^2u/dx^2 + Reaction
equation = du2dx2*D + R*u - dudt
#show(equation)

t = np.linspace(0,10,num = 70)
x = np.linspace(0,1,num = 7)
ic = [i for i in range(0,7)]
ic = np.array(ic)
ic.resize(len(ic),1)

sol = cranknic(t,x,ic,equation)

fig1 = plt.figure()
theplot = plt.contour(t,x,sol)
anum = int(12)
print type(anum)
plt.clabel(theplot, inline=1, fontsize=anum)
plt.title('Diffusion with source')
fig1.show()
︡8a52a922-b863-47e2-a73a-c9a28f9e4b4e︡{"stdout":"(x, t, u, dudt, dudx, du2dx2)\n"}︡{"tex":{"tex":"0.0700000000000000 \\, \\mathit{du2dx}_{2} - \\mathit{dudt} + 0.500000000000000 \\, u","display":true}}︡{"tex":{"tex":"1.26 \\, \\mathit{uimn} + 1.26 \\, \\mathit{uimnp} + 4.63000000000000 \\, \\mathit{uin} - 9.17000000000000 \\, \\mathit{uinp} + 1.26 \\, \\mathit{uipn} + 1.26 \\, \\mathit{uipnp}","display":true}}︡{"stdout":"<type 'int'>\n"}︡{"stdout":"<a list of 6 text.Text objects>\n"}︡{"stdout":"<matplotlib.text.Text object at 0xb55ab90>\n"}︡{"once":false,"file":{"show":true,"uuid":"d2d1c5e1-8a0d-43c6-833f-f0481fa00791","filename":"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sage/temp/compute16dc0/13945/tmp_a1uFUh.png"}}︡
︠373eb981-e591-42d9-9565-04d1212cfe02︠
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
var('x t u dudt dudx du2dx2')
vel = 0.01
vis = 0.07

#It appears at this point, you can't define the variable in terms of actual derivatives. Can't substitute. 
#dudt = uin.diff(t)
#du2dx2 = u.diff(x,2)
#equation = dudt - du2dx2*D - R  # du/dt = D*d^2u/dx^2 + Reaction
equation = vel*du2dx2 - vis*dudx - dudt
#show(equation)

t = np.linspace(0,10,num = 100)
x = np.linspace(0,1,num = 10)
ic = [i for i in range(0,10)]
ic = np.array(ic)
ic.resize(len(ic),1)

sol = cranknic(t,x,ic,equation)

fig1 = plt.figure()
theplot = plt.contour(t,x,sol)
anum = int(12)
print type(anum)
plt.clabel(theplot, inline=1, fontsize=anum)
plt.title('Odd Equation')
fig1.show()
︡fb97d6fd-1b29-4639-901a-5578116d1e54︡{"stdout":"(x, t, u, dudt, dudx, du2dx2)\n"}︡{"stdout":"<type 'int'>\n"}︡{"stdout":"<a list of 5 text.Text objects>\n"}︡{"stdout":"<matplotlib.text.Text object at 0xb5befd0>\n"}︡{"once":false,"file":{"show":true,"uuid":"7ed60df4-c6aa-48a2-b9b3-562649dc83d9","filename":"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sage/temp/compute16dc0/966/tmp_in1u4_.png"}}︡
︠9635081c-983a-4914-a668-bdc7d943c07d︠
#Burger's eqn.
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
var('x t u dudt dudx du2dx2')
vel = 0.01
vis = 0.07

#It appears at this point, you can't define the variable in terms of actual derivatives. Can't substitute. 
#dudt = uin.diff(t)
#du2dx2 = u.diff(x,2)
#equation = dudt - du2dx2*D - R  # du/dt = D*d^2u/dx^2 + Reaction
equation = vel*du2dx2 - u*dudx - dudt
#show(equation)

t = np.linspace(0,10,num = 100)
x = np.linspace(0,1,num = 10)
ic = [i for i in range(0,10)]
ic = np.array(ic)
ic.resize(len(ic),1)

sol = cranknic(t,x,ic,equation)

fig1 = plt.figure()
theplot = plt.contour(t,x,sol)
anum = int(12)
print type(anum)
plt.clabel(theplot, inline=1, fontsize=anum)
plt.title('Burger"s eqn.')
fig1.show()
︡cf7c3de6-aba0-4018-a861-59b26bc804e9︡{"stdout":"(x, t, u, dudt, dudx, du2dx2)\n"}︡{"tex":{"tex":"-\\mathit{dudx} u + 0.0100000000000000 \\, \\mathit{du2dx}_{2} - \\mathit{dudt}","display":true}}︡{"tex":{"tex":"\\frac{9}{2} \\, {\\left(\\mathit{uimn} - \\mathit{uipn}\\right)} {\\left(\\mathit{uin} + \\mathit{uinp}\\right)} + 0.405 \\, \\mathit{uimn} + 0.405 \\, \\mathit{uimnp} + 9.09 \\, \\mathit{uin} - 10.71 \\, \\mathit{uinp} + 0.405 \\, \\mathit{uipn} + 0.405 \\, \\mathit{uipnp}","display":true}}︡{"stderr":"Error in lines 19-19\nTraceback (most recent call last):\n  File \"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"\", line 37, in cranknic\n  File \"expression.pyx\", line 1178, in sage.symbolic.expression.Expression.__float__ (sage/symbolic/expression.cpp:8057)\nTypeError: unable to simplify to float approximation\n"}︡
︠35343cd3-5172-4379-a07e-319849cd6b33︠
%md
Contained in this folder should be:

* sandbox.sagews - I used this to test and develop my algorithms
* timing.sagews - This contains an example I used to test relative speeds
* working_examples.sagews - This contains some example systems and plots

* cranknic.sage - This contains the Crank-Nicolson class definition

* cranknic_Opt.sage - This is a higher-level class to wrap up together Cython and symbolic math
* parse_eq.sage - This contains the equation and coefficient handling
* cranknicC.spyx - This contains the Cython Crank-Nicolson implementation

* and some *.md files and a presentation folder.

This project was borne out of a desire to explore numerical methods for solving partial differential equation, specifically the Reaction-Diffusion equation, which is a parabolic partial differential equation that has many applications in biology, pattern formation and chemical kinetics, etc. 

Broadly speaking, numerical methods for solving these PDEs fall into several categories: 

* Finite Difference Schemes
* Numerical Spectral Methods (huh...?)
* Finite Element or Volume Analysis
* Method of lines

Briefly, the finite difference schemes approximate derivatives using a various linear approximations, as in the defintion of a derivative. The finite volume methods approximate fluxes instead of derivatives as in Finite-Difference. Spectral methods use Fourier analysis to rewrite the PDE as a sum of sines. And the method of lines involves discretization in all but one dimension, and numeric integration in the remaining dimension.

Beginning this project, I was naive to how vast these categories were, and the process was a great learning experience. I aimed to try to get through a few methods but ultimately fell short. There are so many applications and PDEs are so diverse and, as yet, not systematically solved, that there are dozens of solution procedures. I implemented the Crank-Nicolson scheme, an old standby within the finite-difference category. It turns out here are many, many finite difference schemes that differ in how they approximate derivatives so as to achieve stability and numerical accuracy. 

The Crank-Nicolson is an implicit scheme, meaning that to solve for the next step involves both the current and the next step itself. It employs the following discretizations:

$
u(x,t) = \frac{u_{i,n+1} u_{i,n+1}}{2} \\
\frac{du}{dt} = \frac{u_{i,n+1} - u_{in}}{k} \\
\frac{du}{dx} = \frac{u_{i+1,n} - u_{i-1,n}}{h} \\
\frac{d^{2}u}{dx^{2}} = \frac{(u_{i+1,n} - 2*u_{i,n} + u_{i-1,n+1}) + (u_{i+1,n+1} - 2*u_{i,n+1} + u_{i-1,n+1})}{2h^{2}}
$

where k is the time step and h is the spatial step.

Re-arranging a PDE after the discretizations have been made, collecting the future time step terms on one side, the system can be written as a tri-diagonal matrix:

$
\begin{bmatrix}
   {b_1} &amp; {c_1} &amp; {   } &amp; {   } &amp; { 0 } \\
   {a_2} &amp; {b_2} &amp; {c_2} &amp; {   } &amp; {   } \\
   {   } &amp; {a_3} &amp; {b_3} &amp; \ddots &amp; {   } \\
   {   } &amp; {   } &amp; \ddots &amp; \ddots &amp; {c_{n-1}}\\
   { 0 } &amp; {   } &amp; {   } &amp; {a_n} &amp; {b_n}\\
\end{bmatrix}
\begin{bmatrix}
   {x_1 }  \\
   {x_2 }  \\
   {x_3 }  \\
   \vdots   \\
   {x_n }  \\
\end{bmatrix}
=
\begin{bmatrix}
   {d_1 }  \\
   {d_2 }  \\
   {d_3 }  \\
   \vdots   \\
   {d_n }  \\
\end{bmatrix}
$

Where d would be the $u_{i+1,n}$, the next time step. This matrix has an efficient algorithm for solving, called the Thomas algorithm:

$
\begin{cases}
\begin{array}{lcl}
  \cfrac{c_i}{b_i}                  &amp; ; &amp; i = 1 \\
  \cfrac{c_i}{b_i - a_i c'_{i - 1}} &amp; ; &amp; i = 2, 3, \dots, n-1 \\
\end{array}
\end{cases} \\

\begin{cases}
\begin{array}{lcl}
  \cfrac{d_i}{b_i}                  &amp; ; &amp; i = 1 \\
  \cfrac{d_i - a_i d'_{i - 1}}{b_i - a_i c'_{i - 1}} &amp; ; &amp; i = 2, 3, \dots, n. \\
\end{array}
\end{cases} //
$

Backwards substitution yields the solution, the next time step:

$
x_n = d'_n \\
x_i = d'_i - c'_i x_{i + 1} \\
$

While this sub-algorithm of LU-decomposition is supposed to be specialized, I found Numpy's implementation of generic LU-decomposition to be faster. 

Having implemented the Crank-Nicolson algorithm in one dimension, I was left to choose between going for two dimensions or trying to speed up the algorithm. Apparently, Crank-Nicolson becomes very messy if extended to higher dimensions, so different methods are used resulting in block-diagonal matrices. This was too complicated for me to do in this time frame, so I opted to go for the speed increase.

Humorously, my attempt at Cythonizing backfired, and I ultimately created a slower class. The issue I had was separating the symbolic math that dealt with the input equation, which could not be Cythonized, from the actual finite-difference algorithm. The cost of separting these into separate classes was greater than whatever computation increase I got from implementing the CN algorithm with cython. 

Use the sandbox file or the timing file as templates for how to use cranknic.sage and mess around with it. Be warned though - stability is guaranteed by this implicit method, but not numerical accuracy. PDEs are tough because most of them are too complicated to work out correctly.
︡e467ced8-982d-408b-ba8d-d9556e1c0c48︡{"html":"<p>Contained in this folder should be:</p>\n\n<ul>\n<li>sandbox.sagews - I used this to test and develop my algorithms</li>\n<li>timing.sagews - This contains an example I used to test relative speeds</li>\n<li><p>working_examples.sagews - This contains some example systems and plots</p></li>\n<li><p>cranknic.sage - This contains the Crank-Nicolson class definition</p></li>\n<li><p>cranknic_Opt.sage - This is a higher-level class to wrap up together Cython and symbolic math</p></li>\n<li>parse_eq.sage - This contains the equation and coefficient handling</li>\n<li><p>cranknicC.spyx - This contains the Cython Crank-Nicolson implementation</p></li>\n<li><p>and some *.md files and a presentation folder.</p></li>\n</ul>\n\n<p>This project was borne out of a desire to explore numerical methods for solving partial differential equation, specifically the Reaction-Diffusion equation, which is a parabolic partial differential equation that has many applications in biology, pattern formation and chemical kinetics, etc. </p>\n\n<p>Broadly speaking, numerical methods for solving these PDEs fall into several categories: </p>\n\n<ul>\n<li>Finite Difference Schemes</li>\n<li>Numerical Spectral Methods (huh&#8230;?)</li>\n<li>Finite Element or Volume Analysis</li>\n<li>Method of lines</li>\n</ul>\n\n<p>Briefly, the finite difference schemes approximate derivatives using a various linear approximations, as in the defintion of a derivative. The finite volume methods approximate fluxes instead of derivatives as in Finite-Difference. Spectral methods use Fourier analysis to rewrite the PDE as a sum of sines. And the method of lines involves discretization in all but one dimension, and numeric integration in the remaining dimension.</p>\n\n<p>Beginning this project, I was naive to how vast these categories were, and the process was a great learning experience. I aimed to try to get through a few methods but ultimately fell short. There are so many applications and PDEs are so diverse and, as yet, not systematically solved, that there are dozens of solution procedures. I implemented the Crank-Nicolson scheme, an old standby within the finite-difference category. It turns out here are many, many finite difference schemes that differ in how they approximate derivatives so as to achieve stability and numerical accuracy. </p>\n\n<p>The Crank-Nicolson is an implicit scheme, meaning that to solve for the next step involves both the current and the next step itself. It employs the following discretizations:</p>\n\n<p>$\nu(x,t) = \\frac{u_{i,n+1} u_{i,n+1}}{2} \\\\\n\\frac{du}{dt} = \\frac{u_{i,n+1} - u_{in}}{k} \\\\\n\\frac{du}{dx} = \\frac{u_{i+1,n} - u_{i-1,n}}{h} \\\\\n\\frac{d^{2}u}{dx^{2}} = \\frac{(u_{i+1,n} - 2*u_{i,n} + u_{i-1,n+1}) + (u_{i+1,n+1} - 2*u_{i,n+1} + u_{i-1,n+1})}{2h^{2}}\n$</p>\n\n<p>where k is the time step and h is the spatial step.</p>\n\n<p>Re-arranging a PDE after the discretizations have been made, collecting the future time step terms on one side, the system can be written as a tri-diagonal matrix:</p>\n\n<p>$\n\\begin{bmatrix}\n   {b_1} &amp; {c_1} &amp; {   } &amp; {   } &amp; { 0 } \\\\\n   {a_2} &amp; {b_2} &amp; {c_2} &amp; {   } &amp; {   } \\\\\n   {   } &amp; {a_3} &amp; {b_3} &amp; \\ddots &amp; {   } \\\\\n   {   } &amp; {   } &amp; \\ddots &amp; \\ddots &amp; {c_{n-1}}\\\\\n   { 0 } &amp; {   } &amp; {   } &amp; {a_n} &amp; {b_n}\\\\\n\\end{bmatrix}\n\\begin{bmatrix}\n   {x_1 }  \\\\\n   {x_2 }  \\\\\n   {x_3 }  \\\\\n   \\vdots   \\\\\n   {x_n }  \\\\\n\\end{bmatrix}\n=\n\\begin{bmatrix}\n   {d_1 }  \\\\\n   {d_2 }  \\\\\n   {d_3 }  \\\\\n   \\vdots   \\\\\n   {d_n }  \\\\\n\\end{bmatrix}\n$</p>\n\n<p>Where d would be the $u_{i+1,n}$, the next time step. This matrix has an efficient algorithm for solving, called the Thomas algorithm:</p>\n\n<p>$\n\\begin{cases}\n\\begin{array}{lcl}\n  \\cfrac{c_i}{b_i}                  &amp; ; &amp; i = 1 \\\\\n  \\cfrac{c_i}{b_i - a_i c'_{i - 1}} &amp; ; &amp; i = 2, 3, \\dots, n-1 \\\\\n\\end{array}\n\\end{cases} \\\\\n\n\\begin{cases}\n\\begin{array}{lcl}\n  \\cfrac{d_i}{b_i}                  &amp; ; &amp; i = 1 \\\\\n  \\cfrac{d_i - a_i d'_{i - 1}}{b_i - a_i c'_{i - 1}} &amp; ; &amp; i = 2, 3, \\dots, n. \\\\\n\\end{array}\n\\end{cases} //\n$</p>\n\n<p>Backwards substitution yields the solution, the next time step:</p>\n\n<p>$\nx_n = d'_n \\\\\nx_i = d'_i - c'_i x_{i + 1} \\\\\n$</p>\n\n<p>While this sub-algorithm of LU-decomposition is supposed to be specialized, I found Numpy&#8217;s implementation of generic LU-decomposition to be faster. </p>\n\n<p>Having implemented the Crank-Nicolson algorithm in one dimension, I was left to choose between going for two dimensions or trying to speed up the algorithm. Apparently, Crank-Nicolson becomes very messy if extended to higher dimensions, so different methods are used resulting in block-diagonal matrices. This was too complicated for me to do in this time frame, so I opted to go for the speed increase.</p>\n\n<p>Humorously, my attempt at Cythonizing backfired, and I ultimately created a slower class. The issue I had was separating the symbolic math that dealt with the input equation, which could not be Cythonized, from the actual finite-difference algorithm. The cost of separting these into separate classes was greater than whatever computation increase I got from implementing the CN algorithm with cython. </p>\n\n<p>Use the sandbox file or the timing file as templates for how to use cranknic.sage and mess around with it. Be warned though - stability is guaranteed by this implicit method, but not numerical accuracy. PDEs are tough because most of them are too complicated to work out correctly.</p>\n"}︡
︠d11e5268-f654-432b-b1fb-45fad3ecbeb2︠










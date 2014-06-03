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
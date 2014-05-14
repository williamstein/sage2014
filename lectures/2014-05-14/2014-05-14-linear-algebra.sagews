
︠7af91bd3-1d59-4cbf-bcd4-c066b0c31904i︠
%md

# Math 480b -- Sage Course
## Linear Algebra

## May 14, 2014

Screencast:

**Plan**

- Questions

- Homework:
   - hw7, etc., due Monday morning at 6am
   - talk to Simon about any grading related issues
   - Simon extra office hours: "Thursday from 13:00-15:00 in my office, PDL C-430. Come chat if you have any queries about the homework for this week, the grading for last week, or the grading results from the week before!"


- Topic: Exact linear algebra
   - solving a system of equations: simple small naive approach
   - creating matrices and vectors
   - solving a matrix equations
   - computing invariants of matrices
   - vector spaces
   - linear algebra over finite fields (very important for coding theory)
   - remarks about asymptotically fast algorithms




︡956c4dbf-3a29-4978-a429-709612b87a6b︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>Linear Algebra</h2>\n\n<h2>May 14, 2014</h2>\n\n<p>Screencast: </p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions</p></li>\n<li><p>Homework:</p>\n\n<ul>\n<li>hw7, etc., due Monday morning at 6am</li>\n<li>talk to Simon about any grading related issues</li>\n<li>Simon extra office hours: &#8220;Thursday from 13:00-15:00 in my office, PDL C-430. Come chat if you have any queries about the homework for this week, the grading for last week, or the grading results from the week before!&#8221;</li>\n</ul></li>\n<li><p>Topic: Exact linear algebra</p>\n\n<ul>\n<li>solving a system of equations: simple small naive approach</li>\n<li>creating matrices and vectors</li>\n<li>solving a matrix equations</li>\n<li>computing invariants of matrices</li>\n<li>vector spaces</li>\n<li>linear algebra over finite fields (very important for coding theory)</li>\n<li>remarks about asymptotically fast algorithms</li>\n</ul></li>\n</ul>\n"}︡
︠bca2cebc-deac-4e93-81f0-7bdb8863e21bi︠
%md
## Exact Linear Algebra

Our topic for today is "exact" linear algebra, by which I mean algebra with matrices whose entries are exact numbers (integers, rational numbers, elements of a finite field, etc.), rather than approximate numbers (floating point numbers).

These are very important in coding theory, combinatorics, much of pure math research, etc.   They are not so important in applied math, where one usually works with matrices having floating point (or complex) entries, and the algorithms and issues (e.g., numerical analysis to deal with rounding errors) are much different.
︡12689af2-4622-4bb8-a9dc-7f9d51927a75︡{"html":"<h2>Exact Linear Algebra</h2>\n\n<p>Our topic for today is &#8220;exact&#8221; linear algebra, by which I mean algebra with matrices whose entries are exact numbers (integers, rational numbers, elements of a finite field, etc.), rather than approximate numbers (floating point numbers).</p>\n\n<p>These are very important in coding theory, combinatorics, much of pure math research, etc.   They are not so important in applied math, where one usually works with matrices having floating point (or complex) entries, and the algorithms and issues (e.g., numerical analysis to deal with rounding errors) are much different.</p>\n"}︡
︠5785fe91-0eae-4981-b2ba-3cbd7118ce8c︠

︠d5f1b781-8291-43ad-85d2-a7ccca5d0ff4i︠
%md
## Solving a system of linear equations

Here is an example to illustrate the naive (painful) direct approach, which is fine for small example and some educational applications.
︡36543c09-6ebe-40fb-8d33-01abfa473048︡{"html":"<h2>Solving a system of linear equations</h2>\n\n<p>Here is an example to illustrate the naive (painful) direct approach, which is fine for small example and some educational applications.</p>\n"}︡
︠a0234834-cf32-4e4d-9543-3a96248aa798︠
# create 3 symbolic variables:
%var x,y,z

# make a list of 3 linear equations
v = [2*x + 3*y + 5*z == 10,
     7*x - 4*y == 5,
     2*x - 5*y + z == 2]

# solve the equations for x,y,z
s = solve(v, [x,y,z], solution_dict=True)
s
︡fb2bc50b-1a4f-4944-8f0b-ad958bb3aaa0︡{"stdout":"[{z: 62/41, x: 35/41, y: 10/41}]\n"}︡
︠909e799b-7c7a-4db9-9ca9-5db838af48cc︠
solve(sin(3*x)+cos(x*pi) == 0, x)
︡79727a64-8c9b-46ef-8539-f653694806b0︡{"stdout":"[cos(pi*x) == -sin(3*x)]"}︡{"stdout":"\n"}︡
︠7b100923-39ce-4712-91dd-2da4b8aea94a︠
find_root(sin(3*x)+cos(x*pi), 0, 15)
︡40677830-619f-43f0-9100-140ecd9d5102︡{"stdout":"14.067002298373158\n"}︡
︠f7cf8db4-afc5-49ba-a000-cba9ef1588f7︠
plot(sin(3*x)+cos(x*pi), 0, 15)
︡626e94e7-7238-43ce-9cce-feec7473de3f︡{"once":false,"file":{"show":true,"uuid":"c85882e1-bff4-44c9-a2a6-64c9add18b54","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/20896/tmp_J6lZoG.png"}}︡
︠7cd066f7-73ef-439e-b390-e0b628ebee5e︠
# the only solution:
t = s[0]; t
︡2c59b347-533a-49e2-be85-54136577d64e︡{"stdout":"{z: 62/41, x: 35/41, y: 10/41}\n"}︡
︠e14cacb7-7266-49d8-a800-837c16907fca︠
t[z]
︡280a5947-d79d-49f0-bf01-5de0a3d2f7d5︡{"stdout":"62/41\n"}︡
︠580642d3-1a0c-4986-a8fd-f669db5c93f0i︠
%md
NOTE: The solve command mostly uses some very generic/general machinery, so you can put some weird nonlinear terms in.

︡f5739171-d810-418d-a17d-550c44f1fa57︡{"html":"<p>NOTE: The solve command mostly uses some very generic/general machinery, so you can put some weird nonlinear terms in.</p>\n"}︡
︠efce9573-12f6-4883-b720-6ce6c489c245︠
v = [2*x^2 + 3*y + 5*z == 10,
     7*x - 4*y == 5,
     2*x - 5*y + z^2 == 2]

solve(v,[x,y,z])
︡c319c079-d670-4c86-8db2-f86f7ed95b63︡{"stdout":"[[x == (-4.59043682722 - 2.3161925967*I), y == (-9.28326444764 - 4.05333704422*I), z == (1.28701382069 - 6.07386640933*I)], [x == (-4.59043682722 + 2.3161925967*I), y == (-9.28326444764 + 4.05333704422*I), z == (1.28701382069 + 6.07386640933*I)], [x == 0.930873621713, y == 0.379028882378, z == 1.42597239649], [x == 3, y == 4, z == -4]]"}︡{"stdout":"\n"}︡
︠e4376cb1-04ef-4630-81c5-8261b08a7164︠
# solve a cubic algebraic equation
solve(x^5 + 5*x + 2, x)
︡fbc88e30-698d-4e96-9e70-ed355fa1661b︡{"stdout":"[0 == x^5 + 5*x + 2]\n"}︡
︠91fa1c0d-9d61-4437-b37c-bae6f361ac59︠

︠9a7cf088-b58b-4b58-9ac8-d6e903edbd05︠

︠8276c3c2-e196-479f-a106-a8f9206580eei︠
%md
## Creating matrices and vectors
︡d59baf1a-4fb5-4d6a-99c9-e1119911bcde︡{"html":"<h2>Creating matrices and vectors</h2>\n"}︡
︠fa4f6aa0-db08-4d3f-a94e-ba44e420e903︠
#2*x + 3*y + 5*z == 10,
#7*x - 4*y == 5,
#2*x - 5*y + z == 2

m = matrix(3,3, [2,3,5,  7,-4,0,  2,-5,1])

v = vector([10,5,2])
︡7dcbb62e-d958-4d23-8f6d-929eb39665ec︡
︠599c21e9-1fd1-46c8-b548-c6c6205a551d︠
m[0,0]
︡f1f71091-ec6c-4847-8e21-ae92cd322e0c︡{"stdout":"2\n"}︡
︠b2916c0b-fe72-45e6-9713-1ef85edb4a6f︠
m[0,0] = 10
︡9b68c23f-0fe8-45a1-a6dc-45da627325d6︡
︠9bba0b6e-9dd2-45e6-856e-13abbcb30985︠
m[0]
︡5338edf7-eed9-482f-bd48-36de17cf7327︡{"stdout":"(10, 3, 5)\n"}︡
︠a2db812f-f8fa-4aca-847b-24d70e0654c1︠
m.column(0)
︡da81aa33-6863-4b39-8b25-5d446e8d31ee︡{"stdout":"(10, 7, 2)\n"}︡
︠ee5200dc-cc5c-44c8-bc7b-cb05cac03462︠
m.row(0)
︡15cd5d0e-a528-4d6c-8599-12b3f90acffa︡{"stdout":"(10, 3, 5)\n"}︡
︠5a58534c-0525-4ba3-903e-88dde5d31c10︠
m[0][0] = 20
︡23cd982d-7fbb-4bbb-9eb3-44579aa28634︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"vector_integer_dense.pyx\", line 185, in sage.modules.vector_integer_dense.Vector_integer_dense.__setitem__ (sage/modules/vector_integer_dense.c:3760)\nValueError: vector is immutable; please change a copy instead (use copy())\n"}︡
︠7278905a-dfab-4474-a14b-002127372f67︠
type(m)
︡c87da23c-dce3-4483-bbb5-b849b226f61d︡{"stdout":"<type 'sage.matrix.matrix_integer_dense.Matrix_integer_dense'>\n"}︡
︠d5a1afb2-e4ef-44fc-b160-ec4ea68fedcd︠
m[0] = 10/3
︡89525d42-f6ba-422b-b50e-16d68374107d︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"matrix0.pyx\", line 1404, in sage.matrix.matrix0.Matrix.__setitem__ (sage/matrix/matrix0.c:7295)\n  File \"matrix0.pyx\", line 1483, in sage.matrix.matrix0.Matrix._coerce_element (sage/matrix/matrix0.c:8266)\n  File \"parent.pyx\", line 1070, in sage.structure.parent.Parent.__call__ (sage/structure/parent.c:8858)\n  File \"rational.pyx\", line 3795, in sage.rings.rational.Q_to_Z._call_ (sage/rings/rational.c:26796)\nTypeError: no conversion of this rational to integer\n"}︡
︠8fef596a-815c-4b54-82d4-d35a3caa8105︠
m[0]
︡d3f90b4e-d33a-484e-9ab4-f6c3d8a5e3d7︡{"stdout":"(2, 3, 5)\n"}︡
︠ebc1e978-d892-4d04-a0b6-9b1b6fdb29d6︠
show(m)
show(v)
︡fdf5b0ac-e77f-4915-8931-148206514216︡{"tex":{"tex":"\\left(\\begin{array}{rrr}\n2 & 3 & 5 \\\\\n7 & -4 & 0 \\\\\n2 & -5 & 1\n\\end{array}\\right)","display":true}}︡{"tex":{"tex":"\\left(10,\\,5,\\,2\\right)","display":true}}︡
︠10e297ea-5779-4a2f-a700-185a4454ba35︠
matrix([[1,2], [3,4/7]])
︡e017cc21-9149-4770-ad7a-96cb97fdcdb2︡{"stdout":"[  1   2]\n[  3 4/7]\n"}︡
︠2d782363-90f7-46fc-aac3-01d2e610a7d2︠
# a matrix with entries in the symbolic ring
%var x
reset('e')
[[pi,e,sqrt(2)], [1,2,sin(x)]]
︡57a87f47-f5c5-46f0-ae28-7cfb9f4be2fe︡{"stdout":"[[pi, e, sqrt(2)], [1, 2, sin(x)]]\n"}︡
︠f03f57a9-c487-41ee-ae04-c27619c07bc6︠
m = matrix([[pi,e,sqrt(2)], [1,2,sin(x)]])
show(m)
︡d9357391-567a-44ae-9c70-704d088f68c5︡{"tex":{"tex":"\\left(\\begin{array}{rrr}\n\\pi & e & \\sqrt{2} \\\\\n1 & 2 & \\sin\\left(x\\right)\n\\end{array}\\right)","display":true}}︡
︠a391f8ba-ff14-4eb7-8fba-2127432e4de4︠
m.base_ring()
︡42928443-1059-4233-afe4-c5b5b4a6c8f3︡{"stdout":"Symbolic Ring\n"}︡
︠dc6081bd-6416-4a38-bb22-14195433118b︠
︠03fa335c-1d31-478e-a613-bd53251528ff︠
%var x, y
m = matrix(1,[sin(x)/cos(y) == 1])
︡f5b3ef68-1311-453a-8208-85ec7bd38f10︡
︠973cbd45-d929-4552-844b-c7b2089d06ba︠
m.subs({x:5, y:10})
︡bf61d58d-a732-45a1-8050-b9af97ce1a6c︡{"stdout":"[sin(5)/cos(10) == 1]\n"}︡
︠0f99bcd3-0148-439e-bf43-b7a65c461abd︠

︠864e5b71-f3a7-42a2-88f3-1395c8bca3ef︠
# a biger matrix (all entries are zero by default)
m = matrix(25,50)
m
︡2fea165e-dbc7-479d-ba0e-936e049a01a6︡{"stdout":"25 x 50 dense matrix over Integer Ring (type 'print m.str()' to see all of the entries)\n"}︡
︠862a7d0b-806b-4d79-8a67-cc7b42e1e372︠
print m.str()
︡ae9820dc-f580-4ef5-a247-496e7e7ad1be︡{"stdout":"[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]\n"}︡
︠260cf441-2586-4874-84d9-f85c5e3672cf︠
# a random matrix with integer entries
random_matrix(ZZ, 5, 10)
︡5af87872-87e6-47f5-b81e-f46abfd9a8e2︡{"stdout":"[  0   0  -1   0   0  -1   2  -2   1   0]\n[  0   0  -2   0   0   0   2  -1  -1   2]\n[ -3  -1  -1   0  -1  -1 369  25   1   0]\n[  0  -1  -2  -1   0  -1  13   0   1  -3]\n[  1  12  -1   3  -3   9  -5  -1  -2   1]\n"}︡
︠5565ad52-83f3-4e7f-8cb0-aef9e36c3471︠
ZZ.random_element()
︡bac1f067-f9ab-4f47-9c35-f2dbc71337a7︡{"stdout":"-2\n"}︡
︠59d09fea-ab63-4c11-bb12-c74e36acdfd8︠
random_matrix(ZZ, 5, 10, x=-3, y=3)  # entries chosen uniformly from [-3..3]
︡a7a0119c-4639-444f-90c0-83120967bcf0︡{"stdout":"[-3  2 -2 -3  1  2 -3 -1  0  0]\n[-1  0 -2  0 -3  1 -3 -3  2  1]\n[-1 -3  1  2  1  1 -2 -3 -2 -2]\n[ 1 -1 -2 -3 -3  0  2  1 -2 -3]\n[-3 -3 -3  0  0  0 -1  0 -2 -1]\n"}︡
︠faa1cfcf-c666-4095-8154-a2be8a314c3d︠
a = random_matrix(QQ, 3); a
b = random_matrix(QQ, 3); b

︡6a51d82a-9bbd-42ff-b81d-06bb5b97e7cc︡{"stdout":"[  -1    1   -1]\n[-1/2    1    0]\n[  -2   -1    2]\n"}︡{"stdout":"[   1    1    2]\n[  -2  1/2    2]\n[-1/2  1/2    0]\n"}︡
︠0a9477ae-344a-4717-8a4a-5fc52575bd0c︠
QQ.random_element()
︡f3c1aff6-e096-4a90-91e6-1def3297cbd7︡{"stdout":"-14/3\n"}︡
︠af0bf34d-0bf2-4987-be88-02edd9677ca4︠
a + b
︡74145af6-f800-4f0b-941f-0b2e5ccadb37︡{"stdout":"[   0    2    1]\n[-5/2  3/2    2]\n[-5/2 -1/2    2]\n"}︡
︠9b717166-1ffb-4856-880c-7ad03ca8fd94︠
a
︡6f2bfe32-3ec1-4a3a-b751-e166c826fa05︡{"stdout":"[  -1    1   -1]\n[-1/2    1    0]\n[  -2   -1    2]\n"}︡
︠86880e30-81fc-4a16-bd0c-132b964c6e0f︠
# addition adds to the *diagonal*
a + 10
︡edf79e99-3bf1-4ac0-9db2-96e04c71415a︡{"stdout":"[   9    1   -1]\n[-1/2   11    0]\n[  -2   -1   12]\n"}︡
︠ec15ac3e-cb62-4206-a724-934ff5b1727d︠
# matrix multiplication is matrix multiplication
a * b
︡5bded47f-a61e-4cee-ac21-3a13fa54ed07︡{"stdout":"[-5/2   -1    0]\n[-5/2    0    1]\n[  -1 -3/2   -6]\n"}︡
︠b4f1d91e-8cb9-4419-9810-4ce865f650e8︠
a + a.transpose()
︡f8ef6a27-987c-420f-9466-e1f16ce8e5eb︡{"stdout":"[ -2 1/2  -3]\n[1/2   2  -1]\n[ -3  -1   4]\n"}︡
︠7fb9fa44-c6ff-4b97-9107-ad4c0e6c197c︠
a = matrix(RR, 2,2, [1,2,3,4]); a
︡a7b59af5-4c28-418d-aa94-3e7e6862e119︡{"stdout":"[1.00000000000000 2.00000000000000]\n[3.00000000000000 4.00000000000000]\n"}︡
︠634d73e6-d26d-4619-b893-4fda6356b08c︠
a = matrix(2, [1,2,3,4]); a
︡d371cea1-382d-45c4-a181-c746704fc19e︡{"stdout":"[1 2]\n[3 4]\n"}︡
︠82e76da4-6e89-45a5-873d-e294ecddadd0︠
a.change_ring(RR)
︡e01c086f-eeb2-46a6-a93f-6c8b32f636bc︡{"stdout":"[1.00000000000000 2.00000000000000]\n[3.00000000000000 4.00000000000000]\n"}︡
︠6a38a175-7f6c-4595-9967-fe84161a60f1︠
M = MatrixSpace(RR, 2)
M
︡def84370-f21b-40f6-a02d-fd6ffc3eeff3︡{"stdout":"Full MatrixSpace of 2 by 2 dense matrices over Real Field with 53 bits of precision\n"}︡
︠96aca45a-425d-4214-bba3-5b870bd8eeaf︠
M([1,2,3,4])
︡3003e8e2-a196-4540-883e-0bdc37dc9b54︡{"stdout":"[1.00000000000000 2.00000000000000]\n[3.00000000000000 4.00000000000000]\n"}︡
︠46a62aff-cf43-49ef-ba27-cd28c3ac0d30︠

︠152cd6a9-6c95-4be5-8a5a-7a859dd30dbci︠

%md
## Solving a matrix equations
︡bc556d74-bac5-4bbc-b61e-567fa36a4d1b︡{"html":"<h2>Solving a matrix equations</h2>\n"}︡
︠76ce0d4c-2e43-4d4e-9661-ac465ae8c58f︠
m = matrix(3,3, [2,3,5,  7,-4,0,  2,-5,1])
v = vector([10,5,2])
︡fc5b0477-6f09-49aa-a25d-4e41a9090f48︡
︠47541ea2-a631-4e4a-873f-055fe86b226c︠
m
︡fd210c56-851e-4f13-9462-4ebb993595fa︡{"stdout":"[ 2  3  5]\n[ 7 -4  0]\n[ 2 -5  1]\n"}︡
︠70604b97-4e22-4066-ac24-90db270b548c︠
# solve m*x = v
x = m.solve_right(v); x
︡75a9d722-d4fb-442c-a450-a7015a0c6ccb︡{"stdout":"(35/41, 10/41, 62/41)\n"}︡
︠5fdc8af3-4598-4d06-92c5-7475f52432c2︠
m*x == v
︡08102c97-7abe-4c61-84d9-8ec04f5fb304︡{"stdout":"True\n"}︡
︠d5027d59-5330-4cec-a7f8-dcbde892bdc6︠
# solve x*m = v
︠3924094f-2440-48ad-b303-92c5ba0ec7a6︠
x = m.solve_left(v); x
︡53d8d956-fbf3-4741-957c-fea71940d458︡{"stdout":"(129/164, 72/41, -317/164)\n"}︡
︠bddb693d-2a21-4459-a463-6836a0ffc461︠
x*m
︡d2f99cb5-23c8-4e3c-8f91-65c5625b57e1︡{"stdout":"(10, 5, 2)\n"}︡
︠d8012141-171e-4585-bad5-80f3c40c0fed︠
# use matlab notation
x = m \ v; x
︡d78b4f9e-c8fa-4e44-98bf-89ce79c35db4︡{"stdout":"(35/41, 10/41, 62/41)\n"}︡
︠38100ca4-bdde-45bb-87bd-7792cf891e12︠
preparse('x = m \ v')
︡ee25b4ae-8f84-4aa6-aea5-6a55c8393830︡{"stdout":"'x = m  * BackslashOperator() * v'\n"}︡
︠d2b1eef9-270c-4642-940e-6290eaa3bbcai︠
%md
Solving gives you back one solution, if there is one, even if there are infinitely many.
To get all of them you would add elements of the nullspace (or kernel)...
︡8ad09256-5315-46e6-8cd5-54761757d4a5︡{"html":"<p>Solving gives you back one solution, if there is one, even if there are infinitely many.\nTo get all of them you would add elements of the nullspace (or kernel)&#8230;</p>\n"}︡
︠f93ecacc-6ff4-406a-b6d3-ffaa7c7cf63b︠
m = matrix(3,3, [2,3,5,  7,-4,0,  2,-5,1])
b = random_matrix(QQ, 3,2); b
︡4bfa8cd6-f88b-44d9-81f2-13150376f5c6︡{"stdout":"[  0  -1]\n[ -2 1/2]\n[  2   2]\n"}︡
︠128080e7-b40b-4361-b9e7-c677bfd9d453︠
# solve m*x == b, where b is a *matrix*, so x is also a matrix
x = m.solve_right(b); x
︡0c2e304b-f441-41cd-91e2-0ca76e230a3c︡{"stdout":"[ -24/41  -15/82]\n[ -43/82 -73/164]\n[  45/82  23/164]\n"}︡
︠465275d4-a8ad-4423-b0cf-cfc2d2b7261b︠
m*x == b
︡9068c5d8-d2a8-424b-b814-cb5cf2dbca9a︡{"stdout":"True\n"}︡
︠9477627f-ff19-4dac-a640-8b3730ec4699︠

︠0d3a36de-1670-406c-88ed-d18487e6a745︠

︠2fbe5684-50b3-419d-9750-e66b12cf718fi︠

%md
## Computing invariants of matrices
︡cd9cfd0b-a68f-4f4e-b94e-32389345d1e2︡{"html":"<h2>Computing invariants of matrices</h2>\n"}︡
︠4f80d547-2720-480f-9dfe-19b2e2a6878b︠
m = matrix(3,3, [2,3,5,  7,-4,0,  2,-5,1])
︡2b2a66c3-abbf-42a0-a4ae-f3b88cf55f15︡
︠3d6dea8f-18ad-4433-ae42-cc48e0c3344e︠
m.determinant()
︡4866de98-03cf-4206-b1f3-e9462ad43ba8︡{"stdout":"-164\n"}︡
︠3aeb21a4-5431-4706-8234-72cace4e6f81︠
m.rank()
︡8381964b-3dc4-4d2c-8508-0c57780be575︡{"stdout":"3\n"}︡
︠bef7cc45-6945-4f1a-948d-93920f31fb4c︠
m.nullity()
︡6361b074-68e8-4914-9b2f-8fd89e3d60a7︡{"stdout":"0\n"}︡
︠2329a2f9-fc0f-44bd-8555-83f410281bb1︠
m.rref()  # watch out -- not the same as m.echelon_form(), in general...
︡46c2adee-bc90-4dd8-9401-c1a5f0af5ce3︡{"stdout":"[1 0 0]\n[0 1 0]\n[0 0 1]\n"}︡
︠bb7249ca-e75d-4f2b-a5e8-35c7ff7990f1︠
m.echelon_form()  # this is the echelon form *over ZZ* -- no dividing allowed
︡63a2db12-e3af-4036-83ee-12400965ddc2︡{"stdout":"[  1   0  12]\n[  0   1 103]\n[  0   0 164]\n"}︡
︠a68400e4-760a-4e73-8c9d-3b4320f5e8e5︠
m.characteristic_polynomial()
︡f688b329-66ec-4d37-bf5f-a0bb55d55ca6︡{"stdout":"x^3 + x^2 - 41*x + 164\n"}︡
︠83981e06-3a7b-434a-a361-e59769068ae1︠
m.minimal_polynomial()
︡fb24a50c-adbf-4329-9b76-b8d0497194b2︡{"stdout":"x^3 + x^2 - 41*x + 164\n"}︡
︠bbfe283b-ac8b-4d9b-8d67-8bbb2ab51605︠
e = m.eigenvalues(); e
︡7a66f7ad-b3a9-412d-aa81-f8a98abd49b8︡{"stdout":"[-8.30939752116266?, 3.654698760581329? - 2.525839783704967?*I, 3.654698760581329? + 2.525839783704967?*I]\n"}︡
︠98388e36-28b3-454f-9fab-60d74aba567e︠
lamb = e[0]; lamb
︡29e5bfe6-444c-4559-893c-cec06b96b998︡{"stdout":"-8.30939752116266?\n"}︡
︠30ee85a9-855e-43fb-90a9-b8be9f52f975︠
# what's up with the "?"?
type(lamb)
︡1e2811b8-a057-443a-94f8-40fdd51537bd︡{"stdout":"<class 'sage.rings.qqbar.AlgebraicNumber'>\n"}︡
︠ff95837c-da14-4a96-8329-f808be240171︠
lamb.minpoly()
︡cb10bcb5-5030-41cb-99f1-f993ae4439e1︡{"stdout":"x^3 + x^2 - 41*x + 164\n"}︡
︠6121deec-c72f-45b0-bd59-6c5f61bdb7b1︠
# really lamb is an *infinite* precision eigenvalue -- you can ask for more (correct) digits...
lamb.numerical_approx(digits=50)
︡58cfc012-1d1f-47a0-950d-67eef495e9b2︡{"stdout":"-8.3093975211626568404213346750855507682720825670697\n"}︡
︠7ae45892-3bc1-45a1-87b4-ce4c3260faa1︠
# compute the eigespace decomposition
m.eigenspaces_right()
︡e84866d4-8b73-4ceb-ae7f-0e2847f5a393︡{"stdout":"[\n(-8.30939752116266?, Vector space of degree 3 and dimension 1 over Algebraic Field\nUser basis matrix:\n[                  1 -1.624356993204802? -1.087265308309651?]),\n(3.654698760581329? - 2.525839783704967?*I, Vector space of degree 3 and dimension 1 over Algebraic Field\nUser basis matrix:\n[                                           1   0.824678496602401? + 0.2721211925688051?*I -0.1638673458451749? - 0.6684406722822763?*I]),\n(3.654698760581329? + 2.525839783704967?*I, Vector space of degree 3 and dimension 1 over Algebraic Field\nUser basis matrix:\n[                                           1   0.824678496602401? - 0.2721211925688051?*I -0.1638673458451749? + 0.6684406722822763?*I])\n]\n"}︡
︠c52b8f39-18ee-4f42-90ad-8384c426343d︠
# Jordan Canonical Form
m.jordan_form(QQbar)
︡43710cfb-a20a-40f2-b6c4-e04466ef4eae︡{"stdout":"[                       -8.30939752116266?|                                        0|                                        0]\n[-----------------------------------------+-----------------------------------------+-----------------------------------------]\n[                                        0|3.654698760581329? - 2.525839783704967?*I|                                        0]\n[-----------------------------------------+-----------------------------------------+-----------------------------------------]\n[                                        0|                                        0|3.654698760581329? + 2.525839783704967?*I]\n"}︡
︠f5f30be0-c0de-4d9a-8ccc-11cda66707ea︠

︠29df6095-c779-49d2-bbfb-4d9de9062d0f︠

︠76ecc5ae-f93d-4c32-be61-a1222190f419︠

︠0c8268db-f140-4184-b697-a5d5850a991ci︠

%md
## Vector spaces
︡c41bedee-062e-48c9-bb10-218bf99eacc4︡{"html":"<h2>Vector spaces</h2>\n"}︡
︠2e87ab54-457a-45d9-b60c-b5b7ba47fb3c︠
# The vector space of all 3-tuples of rational numbers (i.e., vectors in 3-space with tail at the origin)
V = QQ^3
V
︡90166fa9-3412-4c18-8a9a-6b9bffc0a9ae︡{"stdout":"Vector space of dimension 3 over Rational Field\n"}︡
︠c8baadc3-141e-467c-ac93-c4641405af2a︠
# These arise natural as spans, kernels (=nullspaces), etc.

m = matrix(QQ, 2,3, [2,3,5,  7,-4,0]); m
︡14ecca2f-b009-4ad0-9fae-80caa073e2d3︡{"stdout":"[ 2  3  5]\n[ 7 -4  0]\n"}︡
︠ac55fad2-1fb6-48d0-a974-1b3c24198ecf︠
# Compute the vector space of vector x such that m*x = 0
V = m.right_kernel(); V
︡69cbc1da-872f-471d-8229-cda05ee153ff︡{"stdout":"Vector space of degree 3 and dimension 1 over Rational Field\nBasis matrix:\n[     1    7/4 -29/20]\n"}︡
︠5bede5c5-68e4-4997-ba12-a609b603f09b︠
type(V)
︡c564e708-a2bb-47b9-8cad-015e0e68f8b6︡{"stdout":"<class 'sage.modules.free_module.FreeModule_submodule_field_with_category'>\n"}︡
︠7db7c23d-1332-4c5a-baef-9db4536a018c︠
V.dimension()
︡019fae1d-2e7f-4558-89f6-1da9768e937e︡{"stdout":"1\n"}︡
︠ce0470cf-f0b0-4a17-9de1-5268f0654d4b︠
V.basis()
︡db41115e-14d0-4543-bc82-0ec97621f81c︡{"stdout":"[\n(1, 7/4, -29/20)\n]\n"}︡
︠2f424850-a0b5-4114-9494-f696b48151d1︠
# compute another 1-dimensional vector space
m = matrix(QQ, 2,3, [1,2,3,4,5,6]); m
W = m.right_kernel(); W
︡48aedc6c-2d20-4b8d-a53f-5bc159bad0ba︡{"stdout":"[1 2 3]\n[4 5 6]\n"}︡{"stdout":"Vector space of degree 3 and dimension 1 over Rational Field\nBasis matrix:\n[ 1 -2  1]\n"}︡
︠020172eb-5521-4f7c-a04e-5947a803b2ab︠
V.intersection(W)
︡a548964a-bb75-43fd-bd68-f139a40c0385︡{"stdout":"Vector space of degree 3 and dimension 0 over Rational Field\nBasis matrix:\n[]\n"}︡
︠4977da54-6d51-4c0f-b80e-1efe73f2eba1︠
V + W
︡99ba2c8d-32d8-44cd-96ba-6fdf63b21475︡{"stdout":"Vector space of degree 3 and dimension 2 over Rational Field\nBasis matrix:\n[     1      0 -23/75]\n[     0      1 -49/75]\n"}︡
︠aa0d6757-3ee6-4cb4-a2cd-baacfea02629︠

︠4f9345fd-2739-42e9-928a-768c96d6f4a4︠

︠abb89b37-c94e-4a0c-8747-f4b46be08a7bi︠

%md
## Linear algebra over finite fields (very important for coding theory)
︡618ea3eb-3dce-4eda-8926-385ed878da63︡{"html":"<h2>Linear algebra over finite fields (very important for coding theory)</h2>\n"}︡
︠1873a332-bbb5-4d6f-89da-e69c5c745c72︠
# define a finite field
F = GF(7)
F
list(F)  # the elements of F
︡3d52e3cd-dd80-4d3d-b348-f2b67b107e66︡{"stdout":"Finite Field of size 7\n"}︡{"stdout":"[0, 1, 2, 3, 4, 5, 6]\n"}︡
︠de06eca8-2452-482c-88a3-cde44378c234︠
# define a matrix and vector over F
m = matrix(F, 3,3, [2,3,5,  7,-4,0,  2,-5,1]); m
v = vector(F, [10,5,2]); v

# notice how 7 == 0 below, since we are working in F.
︡00dccadb-76df-423b-af30-8a3e8d12e7f6︡{"stdout":"[2 3 5]\n[0 3 0]\n[2 2 1]\n"}︡{"stdout":"(3, 5, 2)\n"}︡
︠9ae6eec1-b140-4cba-8328-ab0d7329abf2︠
# solve system
x = m.solve_right(v); x
︡e2bf04fc-d523-4a5d-b4b2-dbf009e94fcf︡{"stdout":"(0, 4, 1)\n"}︡
︠bc2c37d4-7af0-44dd-99e7-15f87467a75d︠
m*x
︡538a2463-da29-458f-a26d-2f335258dca0︡{"stdout":"(3, 5, 2)\n"}︡
︠ad3a2612-8d00-4f7f-a3c8-3a252c7c53bd︠

︠c6410422-0e9b-4529-ab46-a674662ff441︠

︠fa7d05bb-3d21-4ad0-94c4-5fc908f6be8a︠

︠f6caa865-5713-4261-9a60-708f9308d9a5︠

︠f102c3cb-dd01-4421-b9b1-e7eb7819b8c1i︠

%md
## Remarks about asymptotically fast algorithms

- All the problems I showed you above are trivial and you could do them by hand.

- One of the *key things* that distinguishes Sage from certain other famous (or not) programs is that it implements many "asymptotically fast" algorithms for exact linear algebra, i.e., these algorithms work even if the matrices are a bit bigger.   (Tell Alan Steel's store about him getting money from Knuth for proving--with Magma in the 90s--that asymptotically fast algorithms are practical, which Knuth said in his book they aren't.)

- Some examples to get a sense of speed and capabilities.
︡56d2d2e6-7f23-4a76-be16-83138f17ed6c︡{"html":"<h2>Remarks about asymptotically fast algorithms</h2>\n\n<ul>\n<li><p>All the problems I showed you above are trivial and you could do them by hand.</p></li>\n<li><p>One of the <em>key things</em> that distinguishes Sage from certain other famous (or not) programs is that it implements many &#8220;asymptotically fast&#8221; algorithms for exact linear algebra, i.e., these algorithms work even if the matrices are a bit bigger.   (Tell Alan Steel&#8217;s store about him getting money from Knuth for proving&#8211;with Magma in the 90s&#8211;that asymptotically fast algorithms are practical, which Knuth said in his book they aren&#8217;t.)</p></li>\n<li><p>Some examples to get a sense of speed and capabilities.</p></li>\n</ul>\n"}︡
︠1b951cc9-b256-4296-bfe4-169cc6625582︠
m = random_matrix(ZZ, 100)
m[0]  # 0th row of our 100x100 matrix
︡51c1a2dd-a510-45eb-98a7-91d446f97561︡{"stdout":"(4, 0, -2, -3, -2, 0, -3, 0, -6, -1, -1, 0, -1, -1, 1, 7, 1, -1, 1, -1, -1, -1, 2, -2, 0, 1, 0, 0, -1, -1, 1, -1, -10, -1, -1, 0, 0, -1, 6, -1, 1, 1, -16, 0, 2, 0, 0, -1, -6, 3, -6, 33, 0, -2, -1, -1, 10, 1, -1, -7, 1, -3, 5, -1, -1, 58, -1, -71, 1, -53, 1, 1, 3, -1, -1, 0, 1, -2, 1, 2, -3, 7, -1, 1, 1, 0, 2, -2, 0, -3, 0, -2, 0, 0, 4, 26, -1, -1, 7, 3)\n"}︡
︠3770bf13-9b77-4b89-8fe7-01ad612ea372︠
# LIE!!!
%timeit m.det()
︡33e535b8-298b-4c22-98e9-ec445e2276cb︡{"stdout":"625 loops, best of 3: 208 ns per loop"}︡{"stdout":"\n"}︡
︠a2fb006b-79bb-41e3-9542-f7bab7a94644i︠
%md
Note, the above 208ns is a <font style="color:red">very misleading</font>.  The reason is because m.det() *caches* the result of the computation.

And the timeit command takes the *best* of 3 -- the first time is long, and the others are short.

You can use m._clear_cache() to delete everything from this cache.
︡44ea89af-265d-4201-9fd3-7a3aab23ca8d︡{"html":"<p>Note, the above 208ns is a <font style=\"color:red\">very misleading</font>.  The reason is because m.det() <em>caches</em> the result of the computation.</p>\n\n<p>And the timeit command takes the <em>best</em> of 3 &#8211; the first time is long, and the others are short.</p>\n\n<p>You can use m._clear_cache() to delete everything from this cache.</p>\n"}︡
︠30b56a34-da95-4112-828a-86764af42cc8︠
# very fast
%time m.det()
︡df899c52-7955-4896-a684-7b2ce89844e1︡{"stdout":"74996333186140588881854742915191977323767239214383201903285454060453805335370455462205920330290664701404280019444746165755070966366903724775165742367645118916871457433207223665448874535011757119353\n"}︡{"stdout":"CPU time: 0.00 s, Wall time: 0.00 s\n"}︡
︠c8c61250-df26-4610-b04b-da515152e7c1︠
%timeit m._clear_cache(); m.det()
︡7916cba0-ad99-4e6d-a882-d0dfc02b2727︡{"stdout":"5 loops, best of 3: 98.8 ms per loop"}︡{"stdout":"\n"}︡
︠5cac86de-198b-404a-9e7a-e5a1e86037d7︠
m = random_matrix(ZZ, 200)
%time m.det()
︡6403f4b4-74fc-43a4-9442-0692e21bcd25︡{"stdout":"-64669184758437239663183673979917197112110496549640403795057967741844317344472132082700872154668833160552494368323839338066085287883221575176676490342951367404623495306652944781582441536472093846800309570810483796344473084572291617332841990161013300998240186468559391490470919565641814961196573721530953737756400690804642916690448036268023345060055365765180543024624602123866399730144748758038656931789371038406200969185401458605233665580015630409753748368355891777932"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 1.21 s, Wall time: 0.00 s\n"}︡
︠6bd8f5f5-c5a3-41be-8268-73ec9766b502︠
# PARI -- an open source "competitor" -- which doesn't implement asymptotically
# fast algorithms... takes 61 seconds on what takes Sage only 1.2 seconds:

m = random_matrix(ZZ,200)
g = gp(m)
%time g.matdet()
︡5e6e2cb9-c5fb-417c-b1e3-066869bd0f1e︡{"stdout":"1357530467855922726709496391137311380106285712921476404836307055849207310366155945166554636489205942666528416132448125060258601567536595933206389102356831496940558209458472865791640885835334008763428391976538629203400298403143090777476405202412471551875554063642153254752782878314112368151570679985904413807054172485226416618885286102646606927790316841955688887985475485206359074580613990832424721952806508087455473552339101813854427408897685905551523414618216712"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 61.81 s, Wall time: 0.00 s\n"}︡
︠5cacbcd1-509c-426b-ac1b-54d8ee897c7b︠


︠b1893d6f-6574-4cbe-a719-c37e775c0de6︠
m = random_matrix(ZZ, 300)
%time m.det()
︡31f30780-04ee-47a4-9d35-c025fa8252c9︡{"stdout":"-36656715590627309259273556481881789462901939923531360793867281610385107201681220482880222393761888024820796864311562604558417184724840961390842317156721562411764807649790447353028762036659749422497603071523179929464858478336910202053252562638678128526896500157785165054293794181261236340877929324049832895881162922644941697319222838224274528581864774816760098633846426568893761513261653040173779579974072207726365822070522566752960386653985032850957285364543777278122604573855524765351327787341793324699648149366240468175888574163954601787067935414108698721339178390706013060867742054317774668049577948380584476918673603456117521789370051146973348953237116581299139570448159964895572091946444810118180145708719947061161201369437878805232850725058812193721000"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 3.52 s, Wall time: 1.92 s\n"}︡
︠2e21ee93-b239-462c-b56c-cb7b378c9938︠
m = random_matrix(ZZ, 500)
%time m.det()
︡bcf733b2-2323-45ef-b9c5-11111fe6bc65︡{"stdout":"12442360668329469660078158320118667036408109067962987155074726391159369956330460011397510600663743892624530066631727299141612723274352535821486024866163234053469830711025696128415033460237135908267845146693074023405349790769021484784194671422887102445370291335805190655367275184519999450128960165572934471412446626832697894033740387369678755045928642175227580300043086879436471316224778819929671380467381606152998211136833097690730349914937184414186148324955122834801874791589888307054800007460737982155600669834631210491028908141827656523708467911088546922883721041524674853051531816381907932449960970203449362577404845466991894817579358240011326836487715208730581135230860384488233354492775464641828333164273639255547108440997296590993717148580810165823597455623706977942098232034960048210261946050762652935291961058431100420188836200886861196728371371076428203974517706621600923880080219548988610530310795317198211641713457844735210238211026036643526821095710920500370726105311655027482970805116737435660276343075818368528876465054179845903876241370576302891445329820788156943540094440331060702629060678834604653121924216155375468394446501965578450667745873889785376613139249757817777872934395865632613644395944358911428119460648332258313353247678056548319242662104437155000132427330537310690673197041754064805633256756997746908460825564263356736291833236832957627046"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 10.63 s, Wall time: 3.56 s\n"}︡
︠860dcd60-bd39-461c-9c48-0a585eac2220i︠
%md
Depending on time, say something about how m.det is so frickin' fast -- it uses a whole bunch of surprising tricks.

  - **Strassen**: matrix multiplication done by decomposition matrix into blocks and doing 7 multiplies instead of 8

  - **Multimodular**: working modulo prime powers, and using the Chinese Remainder theorem.

  - **Cramer's Rule**: Solving a *random* linear system and looking at the denominator of the resulting vector, then fixing it.

︡357fa399-420d-4384-a9ff-5a54f261a98b︡{"html":"<p>Depending on time, say something about how m.det is so frickin&#8217; fast &#8211; it uses a whole bunch of surprising tricks.</p>\n\n<ul>\n<li><p><strong>Strassen</strong>: matrix multiplication done by decomposition matrix into blocks and doing 7 multiplies instead of 8</p></li>\n<li><p><strong>Multimodular</strong>: working modulo prime powers, and using the Chinese Remainder theorem.</p></li>\n<li><p><strong>Cramer&#8217;s Rule</strong>: Solving a <em>random</em> linear system and looking at the denominator of the resulting vector, then fixing it.</p></li>\n</ul>\n"}︡
︠ca63f76c-fd81-4c41-bbae-7a81c28251f4︠

︠eb4049fe-6fdd-4e31-9c39-9d99d1a8f859︠



︠e7c6e4bf-bb3f-45f5-85be-4bd03630a4e8︠

︠21ced3ae-ee45-4a0b-b2f6-4613ee02c74e︠
︡b77705bc-5d4f-4e54-aeb1-ca47f03b4fde︡
︠857b7905-db9c-4ad9-a30b-76886f5030a8︠










︠7af91bd3-1d59-4cbf-bcd4-c066b0c31904i︠
%md

# Math 480b -- Sage Course
## Linear Algebra, part 2

## May 19, 2014

Screencast: <http://youtu.be/B40SL4JtqPo>

**Plan**

- Questions

- Homework:
   - hw7, etc., collected this morning, and re-destributed for grading
   - hw8 assigned (should find it in your project).  This is the last **homework assignment**.

- Topic: Exact linear algebra, part 2
   - vector spaces
   - linear algebra over finite fields and coding theory
   - remarks about asymptotically fast algorithms


- Wednesday and Friday: Graph theory, Group Theory



︡e88c69ae-42c5-4117-95c1-2b5861de3187︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>Linear Algebra, part 2</h2>\n\n<h2>May 19, 2014</h2>\n\n<p>Screencast: <a href=\"http://youtu.be/B40SL4JtqPo\">http://youtu.be/B40SL4JtqPo</a></p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions</p></li>\n<li><p>Homework:</p>\n\n<ul>\n<li>hw7, etc., collected this morning, and re-destributed for grading</li>\n<li>hw8 assigned (should find it in your project).  This is the last <strong>homework assignment</strong>.</li>\n</ul></li>\n<li><p>Topic: Exact linear algebra, part 2</p>\n\n<ul>\n<li>vector spaces</li>\n<li>linear algebra over finite fields and coding theory</li>\n<li>remarks about asymptotically fast algorithms</li>\n</ul></li>\n<li><p>Wednesday and Friday: Graph theory, Group Theory</p></li>\n</ul>\n"}︡
︠0c8268db-f140-4184-b697-a5d5850a991ci︠

%md
## Vector spaces
︡c41bedee-062e-48c9-bb10-218bf99eacc4︡{"html":"<h2>Vector spaces</h2>\n"}︡
︠f624e484-7f60-4ad1-8fb8-b40210d708a4︠
RR^5
︡a0a7c651-5592-4806-812f-8030ffe3144c︡{"stdout":"Vector space of dimension 5 over Real Field with 53 bits of precision\n"}︡
︠2e87ab54-457a-45d9-b60c-b5b7ba47fb3c︠
# The vector space of all 3-tuples of rational numbers (i.e., vectors in 3-space with tail at the origin)
V = QQ^3
V
︡cf28b303-56a7-428d-bc59-5474981c39e3︡{"stdout":"Vector space of dimension 3 over Rational Field\n"}︡
︠a223190e-2a3c-42d5-bb4d-510e3edc410e︠
span(QQ, [[1,2,3], [4,5,6]])
︡2dff4a8f-1f72-4b20-aee0-376eaae1a17c︡{"stdout":"Vector space of degree 3 and dimension 2 over Rational Field\nBasis matrix:\n[ 1  0 -1]\n[ 0  1  2]\n"}︡
︠c8baadc3-141e-467c-ac93-c4641405af2a︠
# These arise natural as spans, kernels (=nullspaces), etc.

m = matrix(QQ, 2,3, [2,3,5,  7,-4,0]); m
︡4b367227-18b6-4dd3-819e-6c6c9e9f62eb︡{"stdout":"[ 2  3  5]\n[ 7 -4  0]\n"}︡
︠a7e6c467-c74a-459b-a92a-2bfb2d855c21i︠
%md
kernel = nullspace
︡25f90012-dc20-442d-9ae4-957e065dd98a︡{"html":"<p>kernel = nullspace</p>\n"}︡
︠ac55fad2-1fb6-48d0-a974-1b3c24198ecf︠
# Compute the vector space of vector x such that m*x = 0
V = m.right_kernel(); V
︡07bb5657-dc4d-4313-9591-29661e14d0c0︡{"stdout":"Vector space of degree 3 and dimension 1 over Rational Field\nBasis matrix:\n[     1    7/4 -29/20]\n"}︡
︠92cb9eb2-870c-40ee-9e27-355cd6198238︠
m.kernel?
︡b1faacfc-6846-41ad-a70a-ec839fab8d45︡{"stdout":"   File: /usr/local/sage/sage-6.2.rc0/src/sage/matrix/matrix2.pyx\n   Docstring:\n      Returns the left kernel of this matrix, as a vector space or free\n   module. This is the set of vectors \"x\" such that \"x*self = 0\".\n\n   Note: For the right kernel, use \"right_kernel()\".  The method\n     \"kernel()\" is exactly equal to \"left_kernel()\".\n\n   INPUT:\n\n   * \"algorithm\" - default: 'default' - a keyword that selects the\n     algorithm employed.  Allowable values are:\n\n     * 'default' - allows the algorithm to be chosen automatically\n\n     * 'generic' - naive algorithm usable for matrices over any field\n\n     * 'pari' - PARI library code for matrices over number fields or\n       the integers\n\n     * 'padic' - padic algorithm from IML library for matrices over\n       the rationals and integers\n\n     * 'pluq' - PLUQ matrix factorization for matrices mod 2\n\n   * \"basis\" - default: 'echelon' - a keyword that describes the\n     format of the basis used to construct the left kernel. Allowable\n     values are:\n\n     * 'echelon': the basis matrix is in echelon form\n\n     * 'pivot' : each basis vector is computed from the reduced row-\n       echelon form of \"self\" by placing a single one in a non-pivot\n       column and zeros in the remaining non-pivot columns. Only\n       available for matrices over fields.\n\n     * 'LLL': an LLL-reduced basis.  Only available for matrices over\n       the integers.\n\n   OUTPUT:\n\n   A vector space or free module whose degree equals the number of\n   rows in \"self\" and contains all the vectors \"x\" such that \"x*self =\n   0\".\n\n   If \"self\" has 0 rows, the kernel has dimension 0, while if \"self\"\n   has 0 columns the kernel is the entire ambient vector space.\n\n   The result is cached.  Requesting the left kernel a second time,\n   but with a different basis format will return the cached result\n   with the format from the first computation.\n\n   Note: For much more detailed documentation of the various options see\n     \"right_kernel()\", since this method just computes the right\n     kernel of the transpose of \"self\".\n\n   EXAMPLES:\n\n   Over the rationals with a basis matrix in echelon form.\n\n      sage: A = matrix(QQ, [[1, 2, 4, -7, 4],\n      ...                   [1, 1, 0, 2, -1],\n      ...                   [1, 0, 3, -3, 1],\n      ...                   [0, -1, -1, 3, -2],\n      ...                   [0, 0, -1, 2, -1]])\n      sage: A.left_kernel()\n      Vector space of degree 5 and dimension 2 over Rational Field\n      Basis matrix:\n      [ 1  0 -1  2 -1]\n      [ 0  1 -1  1 -4]\n\n   Over a finite field, with a basis matrix in \"pivot\" format.\n\n      sage: A = matrix(FiniteField(7), [[5, 0, 5, 2, 4],\n      ...                               [1, 3, 2, 3, 6],\n      ...                               [1, 1, 6, 5, 3],\n      ...                               [2, 5, 6, 0, 0]])\n      sage: A.kernel(basis='pivot')\n      Vector space of degree 4 and dimension 2 over Finite Field of size 7\n      User basis matrix:\n      [5 2 1 0]\n      [6 3 0 1]\n\n   The left kernel of a zero matrix is the entire ambient vector space\n   whose degree equals the number of rows of \"self\" (i.e. everything).\n\n      sage: A = MatrixSpace(QQ, 3, 4)(0)\n      sage: A.kernel()\n      Vector space of degree 3 and dimension 3 over Rational Field\n      Basis matrix:\n      [1 0 0]\n      [0 1 0]\n      [0 0 1]\n\n   We test matrices with no rows or columns.\n\n      sage: A = matrix(QQ, 2, 0)\n      sage: A.left_kernel()\n      Vector space of degree 2 and dimension 2 over Rational Field\n      Basis matrix:\n      [1 0]\n      [0 1]\n      sage: A = matrix(QQ, 0, 2)\n      sage: A.left_kernel()\n      Vector space of degree 0 and dimension 0 over Rational Field\n      Basis matrix:\n      []\n\n   The results are cached. Note that requesting a new format for the\n   basis is ignored and the cached copy is returned. Work with a copy\n   if you need a new left kernel, or perhaps investigate the\n   \"right_kernel_matrix()\" method on the transpose, which does not\n   cache its results and is more flexible.\n\n      sage: A = matrix(QQ, [[1,1],[2,2]])\n      sage: K1 = A.left_kernel()\n      sage: K1\n      Vector space of degree 2 and dimension 1 over Rational Field\n      Basis matrix:\n      [   1 -1/2]\n      sage: K2 = A.left_kernel()\n      sage: K1 is K2\n      True\n      sage: K3 = A.left_kernel(basis='pivot')\n      sage: K3\n      Vector space of degree 2 and dimension 1 over Rational Field\n      Basis matrix:\n      [   1 -1/2]\n      sage: B = copy(A)\n      sage: K3 = B.left_kernel(basis='pivot')\n      sage: K3\n      Vector space of degree 2 and dimension 1 over Rational Field\n      User basis matrix:\n      [-2  1]\n      sage: K3 is K1\n      False\n      sage: K3 == K1\n      True\n"}︡{"stdout":"\n"}︡
︠5bede5c5-68e4-4997-ba12-a609b603f09b︠
type(V)
︡c564e708-a2bb-47b9-8cad-015e0e68f8b6︡{"stdout":"<class 'sage.modules.free_module.FreeModule_submodule_field_with_category'>\n"}︡
︠1d09a006-7c43-49f0-aa67-dbf74dcc13ea︠
V
︡972d6f0f-de84-4030-832f-8b265fcb145f︡{"stdout":"Vector space of degree 3 and dimension 1 over Rational Field\nBasis matrix:\n[     1    7/4 -29/20]\n"}︡
︠1675b5fb-d52a-4d4f-90f2-0e5982390399︠
V.dimension()
︡d8c4dde9-9976-45a8-b914-b14b14ac49c6︡{"stdout":"1\n"}︡
︠ce0470cf-f0b0-4a17-9de1-5268f0654d4b︠
V.basis()
︡f56eb25c-703c-421e-b91b-442a5b94c3c4︡{"stdout":"[\n(1, 7/4, -29/20)\n]\n"}︡
︠2f424850-a0b5-4114-9494-f696b48151d1︠
# compute another 1-dimensional vector space
m = matrix(QQ, 2,3, [1,2,3,4,5,6]); m
W = m.right_kernel(); W
︡930d6eaa-d272-4847-ac48-78f635d56481︡{"stdout":"[1 2 3]\n[4 5 6]\n"}︡{"stdout":"Vector space of degree 3 and dimension 1 over Rational Field\nBasis matrix:\n[ 1 -2  1]\n"}︡
︠020172eb-5521-4f7c-a04e-5947a803b2ab︠
V.intersection(W)
︡d6259bfe-c656-4650-8abd-4af57d4854c0︡{"stdout":"Vector space of degree 3 and dimension 0 over Rational Field\nBasis matrix:\n[]\n"}︡
︠4977da54-6d51-4c0f-b80e-1efe73f2eba1︠
V + W
︡88046a63-12d0-4934-a940-1c388301bf44︡{"stdout":"Vector space of degree 3 and dimension 2 over Rational Field\nBasis matrix:\n[     1      0 -23/75]\n[     0      1 -49/75]\n"}︡
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
︡8b60f8ce-197a-445b-a66e-ebb6906501c1︡{"stdout":"Finite Field of size 7\n"}︡{"stdout":"[0, 1, 2, 3, 4, 5, 6]\n"}︡
︠df586c7c-9197-438a-b707-a5c6bd195830︠
a = F(2); a
︡11120605-e28f-4eeb-b047-81a706f903d8︡{"stdout":"2\n"}︡
︠ff460007-d488-42eb-a091-d1ec13c0d0f0︠
parent(a)
︡347e694c-78f8-4df5-940a-c1a7f7daac1b︡{"stdout":"Finite Field of size 7\n"}︡
︠b42c6389-a4b8-4205-971a-24ca3057e424︠
F(2) / F(4)
︡f8559d6b-7b03-4f4f-9ceb-acf65c74d4df︡{"stdout":"4\n"}︡
︠27294eb5-f948-4c4b-8890-217753d03b02︠
1/F(4)
︡33c39f0c-69e5-4882-93d4-6ba7b2dab9b7︡{"stdout":"2\n"}︡
︠f2802ae3-e08f-4ed6-93a3-42e48aed9821︠
k = GF(9,'a')
︡da59ad3c-7948-4809-ac47-6098ef186471︡
︠28c5d90b-ec18-4281-accb-880d8ed391a1︠
k
︡6fcb93f1-6932-4bdd-8a5b-0ec56ca03cc7︡{"stdout":"Finite Field in a of size 3^2\n"}︡
︠7b3f6e5b-1b62-4867-8630-aa36b8d813cd︠
list(k)
︡47df79c5-7f49-4e3f-93a1-597f199e43a9︡{"stdout":"[0, a, a + 1, 2*a + 1, 2, 2*a, 2*a + 2, a + 2, 1]\n"}︡
︠de06eca8-2452-482c-88a3-cde44378c234︠
# define a matrix and vector over F
m = matrix(F, 3,3, [2,3,5,  7,-4,0,  2,-5,1]); m
v = vector(F, [10,5,2]); v

# notice how 7 == 0 below, since we are working in F.
︡a0b55591-52f3-4788-b4ed-7a6aab66934e︡{"stdout":"[2 3 5]\n[0 3 0]\n[2 2 1]\n"}︡{"stdout":"(3, 5, 2)\n"}︡
︠9ae6eec1-b140-4cba-8328-ab0d7329abf2︠
# solve system
x = m.solve_right(v); x
︡90a4c701-cd50-48ca-bef6-5fec54ce58b1︡{"stdout":"(0, 4, 1)\n"}︡
︠bc2c37d4-7af0-44dd-99e7-15f87467a75d︠
m*x
︡538a2463-da29-458f-a26d-2f335258dca0︡{"stdout":"(3, 5, 2)\n"}︡
︠f6c649a1-7290-444f-9c4c-8b8d9c5dd84a︠
random_matrix(F,10)^10
︡aaa4db86-caf2-4b86-aa2c-6534c4feac53︡{"stdout":"[2 3 6 5 0 0 5 2 3 0]\n[3 3 5 0 2 5 6 5 2 6]\n[2 6 4 1 3 4 6 3 3 6]\n[4 5 0 3 1 2 6 2 5 0]\n[3 2 1 5 0 6 5 4 2 5]\n[3 6 2 3 4 3 1 4 1 1]\n[2 1 4 1 4 5 4 4 2 2]\n[0 0 2 1 0 5 2 1 1 0]\n[1 0 4 0 0 5 4 1 1 6]\n[2 2 3 5 0 0 3 6 3 3]\n"}︡
︠4ca7c239-7fe5-4d0e-bf82-227a3f464131︠
random_matrix(ZZ,10)^10
︡14f84c4f-beb6-4314-b14a-14f90397ca4c︡{"stdout":"[  -605161146634   2456513699588 -52246013770460 -10091601259800  12973421399331  19736861221697 138060495509084  29585601997262   -668397487583   2139291053030]\n[ -1520858893783   2057111692869  -8812279501938   -885185221038   1916708657898   1513671501362   6533081571264  -4498315915416  -2424858594341    487474019239]\n[ -1396017369048  -3714889261973    728352017995   1123735909851  -1694611297223  -3586115805981  28013232476975   1307228946129   4835411660398    476924714336]\n[  1391378038256    502433228198   6301602661032  -2047894000389    291668149567   5393545151046  13637149619489  -2209126278188  -5749348867114  -1508406581700]\n[  1222040503189    728715159250   6515090381548  -2608468784840    640923026976   7636787261897    556449069276  -2030358154988  -5550054117171  -1857838412226]\n[ -5731125783528  -1263719924450 -19112354155374   1399566430385   1223204628979  -3925906481106  -4988676049549  -1726553157428   9465802255512   2384475335074]\n[  -108908388353   2166614137445  -3272265937592    947730079891    361607323206  -3418760946501   -193902683535  -4551532012396  -2588304610198    757590907305]\n[  -332284099700    715344035861  -6386957212058   3660450539330   -686586065250  -9933464685587 -25636410186597   3322175782880   5975122163476   2275969813947]\n[ -1793065271475  -1293119804780  -4041786720494    378274105343   -158480996782  -1705221909098  18407122389313  -1803532888340   2052443228482    581642666650]\n[  -390174372366    245583392270  -6602928423304   5274867078283  -1593719237520 -14644117625936 -23721711387145   3631840570305   7882541584633   3043356709760]\n"}︡
︠ee683f94-d6a7-453b-94c3-d979030d8065i︠
%md
In fact, Sage has extensive coding theory functionality.  (See <http://www.sagemath.org/doc/reference/coding/sage/coding/code_constructions.html> and <http://www.sagemath.org/doc/reference/coding/index.html>)

- A **code** is a subspace of a finite dimensional vector space.
- One encodes messages as elements of this subspace.
- When a message is *corrupted* (say one bit flipped) it becomes something *not* in the subspace.
- Decoding involves finding the closest vector in the subspace to what you get.
︡d30ac430-57d8-499a-b6bd-a2fa313116e6︡{"html":"<p>In fact, Sage has extensive coding theory functionality.  (See <a href=\"http://www.sagemath.org/doc/reference/coding/sage/coding/code_constructions.html\">http://www.sagemath.org/doc/reference/coding/sage/coding/code_constructions.html</a> and <a href=\"http://www.sagemath.org/doc/reference/coding/index.html\">http://www.sagemath.org/doc/reference/coding/index.html</a>)</p>\n\n<ul>\n<li>A <strong>code</strong> is a subspace of a finite dimensional vector space.</li>\n<li>One encodes messages as elements of this subspace. </li>\n<li>When a message is <em>corrupted</em> (say one bit flipped) it becomes something <em>not</em> in the subspace.</li>\n<li>Decoding involves finding the closest vector in the subspace to what you get.</li>\n</ul>\n"}︡
︠c0431a0b-d76c-4656-b1ee-35cd8dd4eda1︠
codes.
︠192eb19e-bc58-49ca-aefa-e01130a0765c︠
C = codes.HammingCode(3,GF(2)); C
︡af8320bd-9bc3-4781-8cda-28d1460a6a65︡{"stdout":"Linear code of length 7, dimension 4 over Finite Field of size 2\n"}︡
︠eb4722d1-a0c7-49de-8f34-f06dc3c134b3︠
C.basis()
︡e4a5ccec-ab0e-4d05-a056-2d3da07f2d87︡{"stdout":"[(1, 0, 0, 0, 0, 1, 1), (0, 1, 0, 0, 1, 0, 1), (0, 0, 1, 0, 1, 1, 0), (0, 0, 0, 1, 1, 1, 1)]\n"}︡
︠af705279-f809-4825-9966-934966d0571a︠
span(C.basis())
︡a5e5a911-c53d-4158-bfff-b05c2d2550ab︡{"stdout":"Vector space of degree 7 and dimension 4 over Finite Field of size 2\nBasis matrix:\n[1 0 0 0 0 1 1]\n[0 1 0 0 1 0 1]\n[0 0 1 0 1 1 0]\n[0 0 0 1 1 1 1]\n"}︡

︠c6410422-0e9b-4529-ab46-a674662ff441︠
len(C)
︡8f33df14-4f07-41eb-b80c-8af86acc0282︡{"stdout":"16\n"}︡
︠19c684b4-59c8-4e9d-b2b2-437dcb9c4b56︠
for v in C:
    print v
︡eb774bb1-8fc7-423c-b592-a2a2077a14ba︡{"stdout":"(0, 0, 0, 0, 0, 0, 0)"}︡{"stdout":"\n(1, 0, 0, 0, 0, 1, 1)\n(0, 1, 0, 0, 1, 0, 1)\n(1, 1, 0, 0, 1, 1, 0)\n(0, 0, 1, 0, 1, 1, 0)\n(1, 0, 1, 0, 1, 0, 1)\n(0, 1, 1, 0, 0, 1, 1)\n(1, 1, 1, 0, 0, 0, 0)\n(0, 0, 0, 1, 1, 1, 1)\n(1, 0, 0, 1, 1, 0, 0)\n(0, 1, 0, 1, 0, 1, 0)\n(1, 1, 0, 1, 0, 0, 1)\n(0, 0, 1, 1, 0, 0, 1)\n(1, 0, 1, 1, 0, 1, 0)\n(0, 1, 1, 1, 1, 0, 0)\n(1, 1, 1, 1, 1, 1, 1)\n"}︡
︠cb870f8c-8941-427b-99c4-2b107c7d71ae︠
# a corrupted message
corrupted_message = [0, 1, 1, 0, 0, 0, 0]
# check this out:
C.decode(corrupted_message)

︡0a31137d-845b-460a-be38-08aecb314624︡{"stdout":"(1, 1, 1, 0, 0, 0, 0)\n"}︡
︠584be4ff-4a1c-44bc-aa71-72deec8bf599︠

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
︡bfb96064-b7c6-46bc-9c30-4c5826c2c141︡{"stdout":"(-2, -1, 0, 0, -2, -4, 2, -2, -1, -1, -3, 1, -1, 0, 0, 3, 0, -1, -98, 6, -1, -1, 1, 0, -4, 2, -8, 6, 2, -1, -86, -4, 8, 0, -3, -2, 1, 4, 1, -1, -1, 0, 0, -2, 1, 1, 1, -1, -1, -2, 1, -7, 1, 1, -4, -6, 0, 1, 0, 2, -9, -4, 1, -2, -1, -1, 0, -2, -1, -6, 1, -5, 1, 1, 0, 0, 0, -1, -5, 0, 3, 0, -2, -1, -14, -2, 0, -1, 1, -1, 4, -1, 0, -2, 0, 1, -1, -2, 2, -1)\n"}︡
︠5d21ce4f-6a0e-43ea-8ddc-da4a644fba03︠

︠439a7cd4-424c-4865-9cb8-3d2d041b8a63︠
matrix_plot(m)
︡8c29a797-4a49-4491-b427-1154eff8ad52︡{"once":false,"file":{"show":true,"uuid":"14633b66-a005-4594-98a7-6c28b0609002","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/3250/tmp_ciP2gw.png"}}︡
︠3770bf13-9b77-4b89-8fe7-01ad612ea372︠
# LIE!!!
%timeit m.det()
︡3d677027-7139-4846-ab7f-7179fd7d6a50︡{"stdout":"625 loops, best of 3: 208 ns per loop\n"}︡
︠a2fb006b-79bb-41e3-9542-f7bab7a94644i︠
%md
Note, the above 208ns is a <font style="color:red">very misleading</font>.  The reason is because m.det() *caches* the result of the computation.

And the timeit command takes the *best* of 3 -- the first time is long, and the others are short.

You can use m._clear_cache() to delete everything from this cache.
︡44ea89af-265d-4201-9fd3-7a3aab23ca8d︡{"html":"<p>Note, the above 208ns is a <font style=\"color:red\">very misleading</font>.  The reason is because m.det() <em>caches</em> the result of the computation.</p>\n\n<p>And the timeit command takes the <em>best</em> of 3 &#8211; the first time is long, and the others are short.</p>\n\n<p>You can use m._clear_cache() to delete everything from this cache.</p>\n"}︡
︠88c1b41f-6b1b-46c5-b72c-646ea30b8f77︠
m._clear_cache()
︡2cdebd2e-4c08-4941-9ab8-78640454eca7︡
︠30b56a34-da95-4112-828a-86764af42cc8︠
# very fast
t = walltime()
s = cputime()
%time m.det()
print walltime(t)   # == walltime() - t
print cputime(s)    # == cputime() - s
︡b35db61b-90aa-406b-8798-868b83263648︡{"stdout":"19273378847246561136798939841246743706113269253095433516380247143875116254260627819776125922605943209074084684455334990841414838714196200782807182967459629589393838322724588770200935009855338887861294091463\n"}︡{"stdout":"CPU time: 0.04 s, Wall time: 0.04 s\n"}︡{"stdout":"0.0398569107056\n"}︡{"stdout":"0.039854\n"}︡
︠c8c61250-df26-4610-b04b-da515152e7c1︠
%timeit m._clear_cache(); m.det()
︡316cedde-afc9-43fd-a3d7-78f697ed12d5︡{"stdout":"25 loops, best of 3: 38.3 ms per loop"}︡{"stdout":"\n"}︡
︠5cac86de-198b-404a-9e7a-e5a1e86037d7︠
m = random_matrix(ZZ, 200)
%time m.det()
︡220df24a-a041-4404-9026-be770eb8648f︡{"stdout":"34409452707058764532281895081392722038607831095049875590084200625616863276933258189920063206358652438786704424251961352633208883941049653260529532296765217238206850662874062617783845038631069161732895040133222818444845559636470590106264296413569767120010492693332980646256916819167053269775718635940360714673704907992884255944239014661842307422805943699872662941321660917652672594121339691038262154984518432484420267619628664251000450121820864242172827904416"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 0.46 s, Wall time: 0.46 s\n"}︡
︠6c433383-ef34-450a-b18c-75438fc5a958︠
m = random_matrix(ZZ, 400)
%time m.det()
︡b7175be7-94ae-41c2-85e6-f7b6c2d5acae︡{"stdout":"33978039611953461802770091172586314418588275283933717806787808414699991512935762623288734320689078899294820820162149776237236642866994116670324518571966025066879190361035672066552368352889774697755090233088925105351670258086109841220435782429872284620686357324135592673367196811624655791732759298738323321202704924738538656392991884658411355473342343925222302725697634258203283608881552197806013587880481867813455367757292901161088894913066856832218913071248589112488962989520046037704983976971703126845812078402820640329252291633877804210781909270196255673264411803174340154328157745909464299436619988320676272798603661644560332944460806444744084424900968668376142979957519123476497218299801511815040996555134923450697618400805038490591971424392207083486948924612119806836558059560957335623348357428122506945093308310503441081807151939542729417335360691962159301415450523922420583106200571071391390101635142650493274234102412913647093213860679944413724754639477041003925981096976812179397274419568072001131018672333623447715088024299726866111442"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 2.27 s, Wall time: 2.26 s\n"}︡
︠c08e9224-fb91-430c-b360-3bb3fd8661c6︠
m = random_matrix(ZZ, 800)
%time m.det()
︡04deb4ac-4b1c-4fb5-9cac-85112c8b9283︡{"stdout":"-4822801924860893342113540293598058645144777146420138754552300296290888160481251691860360918204041578165777457121884867837265917642108370335041275989091948053908996943586868892751423149356325461897285030863122823733092286403276949495545300797957988281763138956550940700846461223963644521130949334685815475673146670473657173995275316490262534368848049680573854818964148897037576930688127080822085324934980825705107852034462533616985691281401729750272001617345703641780782519893387507182864117071262567016154242305971677814358559493805158787875796005558884338863525358832707367011645279623695310907205447692284024703175712135239541840135967944836295793919498233934458340789567506560847858847632869928229063354542950467622789247755365010538455951486494261515008759017927826673864179439798179856931778024770641466927440492609312206347639876364570512401223399439826333320368392869904897460368822131810856635350300372557983004748278293568226678304938216201670214817405962528688927033308936108793504589110257955809820541417993650537609174480335551177170028463453441196809023247454510178661107708337076465691975417613717011929739129504814704160232176969757393934746971100562313445750984295724405326419096632252593836838174922045725476712942451683426744148884399658459771420193256744101544825444749557322975986388280580802172244063490196089506958442156892897969751759846002475306826111346719822984520724638865355766558583163854598165921913344878669628978025094420112856515064231462459627875349298503746492007572446783098294428178012608772329218841702914289839976290879629390462860831444646089025362837153357290286585972645560626265156669895459634574896851629699223119176450955649273817670973965350704318115247742001543393228833051033630542074536192723484376114076651137930683129568021536304975547621852418784259621536254877018108354583408083795541923894989730656013438300016038569748266273675033802857126901909584970474125983759448482430605725870471852705270178753998476850288830431128150452812048916398949940901827208934536079973501051838709782158347141332076420202438496549353542834815680388920512997413521630176555503101041972717114195285561414595021674274067717977342762386254426819838528878702424280324934204266231853837952198430251414554585024426739896645329184395566071630844551041802030157160375157649550029058213099953759678616"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 14.23 s, Wall time: 14.19 s\n"}︡
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










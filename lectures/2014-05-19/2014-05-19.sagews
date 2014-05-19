
︠7af91bd3-1d59-4cbf-bcd4-c066b0c31904i︠
%md

# Math 480b -- Sage Course
## Linear Algebra, part 2

## May 19, 2014

Screencast: REMIND ME.  And watch to see if it crashes.

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



︡9889f4b1-fae2-4a2c-8b31-127d825cfa6c︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>Linear Algebra, part 2</h2>\n\n<h2>May 19, 2014</h2>\n\n<p>Screencast: REMIND ME.  And watch to see if it crashes. </p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions</p></li>\n<li><p>Homework:</p>\n\n<ul>\n<li>hw7, etc., collected this morning, and re-destributed for grading</li>\n<li>hw8 assigned (should find it in your project).  This is the last <strong>homework assignment</strong>.</li>\n</ul></li>\n<li><p>Topic: Exact linear algebra, part 2</p>\n\n<ul>\n<li>vector spaces</li>\n<li>linear algebra over finite fields and coding theory</li>\n<li>remarks about asymptotically fast algorithms</li>\n</ul></li>\n<li><p>Wednesday and Friday: Graph theory, Group Theory</p></li>\n</ul>\n"}︡
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
︠ee683f94-d6a7-453b-94c3-d979030d8065i︠
%md
In fact, Sage has extensive coding theory functionality.  (See <http://www.sagemath.org/doc/reference/coding/sage/coding/code_constructions.html> and <http://www.sagemath.org/doc/reference/coding/index.html>)

- A **code** is a subspace of a finite dimensional vector space.
- One encodes messages as elements of this subspace.
- When a message is *corrupted* (say one bit flipped) it becomes something *not* in the subspace.
- Decoding involves finding the closest vector in the subspace to what you get.
︡d30ac430-57d8-499a-b6bd-a2fa313116e6︡{"html":"<p>In fact, Sage has extensive coding theory functionality.  (See <a href=\"http://www.sagemath.org/doc/reference/coding/sage/coding/code_constructions.html\">http://www.sagemath.org/doc/reference/coding/sage/coding/code_constructions.html</a> and <a href=\"http://www.sagemath.org/doc/reference/coding/index.html\">http://www.sagemath.org/doc/reference/coding/index.html</a>)</p>\n\n<ul>\n<li>A <strong>code</strong> is a subspace of a finite dimensional vector space.</li>\n<li>One encodes messages as elements of this subspace. </li>\n<li>When a message is <em>corrupted</em> (say one bit flipped) it becomes something <em>not</em> in the subspace.</li>\n<li>Decoding involves finding the closest vector in the subspace to what you get.</li>\n</ul>\n"}︡
︠192eb19e-bc58-49ca-aefa-e01130a0765c︠
C = codes.HammingCode(3,GF(2)); C
︡67101c5a-4a40-416d-8cfc-cd1866c2394d︡{"stdout":"Linear code of length 7, dimension 4 over Finite Field of size 2\n"}︡
︠eb4722d1-a0c7-49de-8f34-f06dc3c134b3︠
C.basis()
︡1743d139-364d-4712-98b2-c24c89a22719︡{"stdout":"[(1, 0, 0, 0, 0, 1, 1), (0, 1, 0, 0, 1, 0, 1), (0, 0, 1, 0, 1, 1, 0), (0, 0, 0, 1, 1, 1, 1)]\n"}︡
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
corrupted_message = [1, 1, 0, 0, 0, 1, 1]
# check this out:
C.decode(corrupted_message)
︡039e8e96-9b39-48e4-900e-7562603e85c9︡{"stdout":"(1, 0, 0, 0, 0, 1, 1)\n"}︡

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










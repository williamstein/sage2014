︠4caf0409-cc70-4c8a-8375-aff178b15c44i︠
%md

# Math 480b -- Sage Course
## Today: Groups

### May 23, 2014

Screencast: <http://youtu.be/iiWPsS2Q87c>

**Plan**

- Questions

- Homework: everything due Monday by 6am!!

- Presentations:  update about final schedule

- Groups

︡72e9f7e5-955d-40b4-a93f-d1e6df597a83︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>Today: Groups</h2>\n\n<h3>May 23, 2014</h3>\n\n<p>Screencast: <a href=\"http://youtu.be/iiWPsS2Q87c\">http://youtu.be/iiWPsS2Q87c</a></p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions</p></li>\n<li><p>Homework: everything due Monday by 6am!!</p></li>\n<li><p>Presentations:  update about final schedule</p></li>\n<li><p>Groups</p></li>\n</ul>\n"}︡
︠19560d05-981f-4aed-8507-dbdfd9d49810︠

# (aside) John Palmieri's story about SNF of adjacency matrix of a graph....

︠44955000-405d-49c3-b3f2-7be4a48719f1i︠
%md
## Groups in Sage: introduction

- Reference Manual: <http://www.sagemath.org/doc/reference/groups/>
︡3c991cfb-4caf-4f13-8eb3-2a4303a7fd97︡{"html":"<h2>Groups in Sage: introduction</h2>\n\n<ul>\n<li>Reference Manual: <a href=\"http://www.sagemath.org/doc/reference/groups/\">http://www.sagemath.org/doc/reference/groups/</a></li>\n</ul>\n"}︡
︠911f4c46-31c4-4a1a-be03-9b2ce49900cf︠
G = groups.permutation.Dihedral(4); G
︡8dfdc3ed-9560-4adc-884e-242415706fa0︡{"stdout":"Dihedral group of order 8 as a permutation group\n"}︡
︠a5b20dd4-65fb-491a-8f2a-e1c454d42b61︠
list(G)
︡c6bcd019-a3f2-4f1b-8911-98851f453fac︡{"stdout":"[(), (2,4), (1,2)(3,4), (1,2,3,4), (1,3), (1,3)(2,4), (1,4,3,2), (1,4)(2,3)]\n"}︡
︠f2ad697d-8569-467e-8b7e-93b4fe2d56f9︠
v = G.gens(); v
︡a62ee21d-2c3e-4794-9e11-3cc03f5faf98︡{"stdout":"[(1,2,3,4), (1,4)(2,3)]\n"}︡
︠e987fcdb-9f7f-4e99-8789-a5985af17e72︠
a = v[0]; b = v[1]
︡c6453a8b-ca4b-4f1f-ac1c-9c8767cd1ba6︡
︠6825de31-cffd-4c38-829c-9f9f9a6a3958︠
a*b
︡9bc0a2c1-1b6f-4c6e-83ca-f620c21270b4︡{"stdout":"(1,3)\n"}︡
︠3e35d4d8-2b0b-406f-b62d-2628ce187735︠
len(dir(G))
︡99a7f8a0-0822-4e53-92eb-e4a27258b66a︡{"stdout":"349\n"}︡
︠1bd91205-882b-4840-9edd-b2ced4616acf︠

︠988e31c6-7501-4b6f-a75a-e94025c104be︠

︠b72fbe9d-dd61-413b-83f9-67dcfe595fd7i︠
%md
## Disjoint Cycle Notation

- **Fact:** All finite groups can be viewed as a set of permutations of the integers $\{1,\ldots, n\}$.

- **Disjoint cycle notation** is the standard notation for describing such a permutation.

The notation $(a_1,a_2,...,a_k)$ means: the permutation
$$a_1 \mapsto a_2, \, a_2 \mapsto a_3, \ldots, a_{k-1} \mapsto a_k, \, a_k\mapsto a_1$$

︡ab6043e7-4c83-4baa-a7c3-d88bfb860b10︡{"html":"<h2>Disjoint Cycle Notation</h2>\n\n<ul>\n<li><p><strong>Fact:</strong> All finite groups can be viewed as a set of permutations of the integers $\\{1,\\ldots, n\\}$.</p></li>\n<li><p><strong>Disjoint cycle notation</strong> is the standard notation for describing such a permutation.</p></li>\n</ul>\n\n<p>The notation $(a_1,a_2,...,a_k)$ means: the permutation\n$$a_1 \\mapsto a_2, \\, a_2 \\mapsto a_3, \\ldots, a_{k-1} \\mapsto a_k, \\, a_k\\mapsto a_1$$</p>\n"}︡
︠e85e2737-cd48-455f-a173-bc838e6cb0bf︠
Exercise:  what does
   (2,3,1,4)
do?
    1 |--> 4
    2 |--> 3
    3 |--> 1
    4 |--> 2

︠ac9e9902-ee40-4e3d-aead-cbea75ff90b2i︠
%md
**Disjoint** cycle notation: combine multiple cycles as above, e.g.,

     (2,3,1,4)(5,7,6)

means the permutation that maps 2,3,1,4 as above, and does this to 5,6,7:

    5 |--> 7
    6 |--> 5
    7 |--> 6
︡0fb5c34b-e854-4c2b-b476-e1605f39ec2a︡{"html":"<p><strong>Disjoint</strong> cycle notation: combine multiple cycles as above, e.g.,</p>\n\n<pre><code> (2,3,1,4)(5,7,6)\n</code></pre>\n\n<p>means the permutation that maps 2,3,1,4 as above, and does this to 5,6,7:</p>\n\n<pre><code>5 |--&gt; 7\n6 |--&gt; 5\n7 |--&gt; 6\n</code></pre>\n"}︡
︠19540f8b-94b8-4789-b608-ca80867cbf07︠
S = SymmetricGroup(7)
a = S([(2,3,1,4), (5,7,6)])
b = S((1,2,5,7))
︡0d39c74c-b5ef-4aaa-b7b2-8078587065e9︡
︠2d801fe7-40ad-4657-9e2d-fdf7f06d011b︠
a*b
︡61417954-c778-413b-8bf9-901dbf32cfdc︡{"stdout":"(1,4,5)(2,3)(6,7)\n"}︡
︠b500333a-d403-4662-84fc-fca9b0aab18b︠
b*a
︡0d66b23a-2bab-4fef-97c2-e6c3a5338f31︡{"stdout":"(1,3)(2,7,4)(5,6)\n"}︡
︠9557fb98-9483-481a-a19c-f9524b81c85d︠
"first do b then do a".
1 |-> 3
2 |-> 7
3 |-> 1
4 |-> 2
5 |-> 6
6 |-> 5
7 |-> 4

(1,3)(2,7,4)(5,6)
︠2a52df87-b17e-407e-aa23-5fb1989f7ca4︠

︠28eb9b50-40dc-4c70-af35-600463594940i︠
%md
## The Symmetric Group

The group of all permutations of the integers $\{1,2,\ldots,n\}$ is called **the symmetric group $S_n$**.
︡e670920c-eed6-4fd4-92c8-4e1d76196e71︡{"html":"<h2>The Symmetric Group</h2>\n\n<p>The group of all permutations of the integers $\\{1,2,\\ldots,n\\}$ is called <strong>the symmetric group $S_n$</strong>.</p>\n"}︡
︠fd6b465f-c887-4707-9d44-e8c46828158a︠
︠f211e55c-cccf-403f-a499-a0b545f01c45︠
S = SymmetricGroup(4); S
︡4fee068a-ffe0-4398-8e67-d7d946631dd2︡{"stdout":"Symmetric group of order 4! as a permutation group\n"}︡
︠fd266919-5755-40fa-ac28-a979e260a43b︠
S.cardinality()
︡26da612d-981f-4c8e-bc59-2a110564e7ee︡{"stdout":"24\n"}︡
︠4dd91d6e-4cd0-4654-83f4-7a3161127271︠
factorial(4)
︡731e041d-3ca9-43f7-80b9-5bf3084a96d9︡{"stdout":"24\n"}︡
︠f25d1851-8b66-4b5d-8e5e-e0deb16150fd︠
list(S)  # exercise: find our cycle (2,3,1,4) below...
︡4301d053-4f09-463e-9afd-75378a5ae10d︡{"stdout":"[(), (3,4), (2,3), (2,3,4), (2,4,3), (2,4), (1,2), (1,2)(3,4), (1,2,3), (1,2,3,4), (1,2,4,3), (1,2,4), (1,3,2), (1,3,4,2), (1,3), (1,3,4), (1,3)(2,4), (1,3,2,4), (1,4,3,2), (1,4,2), (1,4,3), (1,4), (1,4,2,3), (1,4)(2,3)]\n"}︡
︠49590a47-f728-4ba5-91f8-c10bbeafc896︠
S.gens()
︡276ab817-4e6b-4b9e-ad2c-0f332620f685︡{"stdout":"[(1,2,3,4), (1,2)]\n"}︡
︠d9c8ff9c-7cff-4068-bb9b-828bd9d41ac2︠
# how to make an element:
a = S([(1,2),(3,4)]); a
︡5e88d798-9af6-411d-8d64-cddbb80b59bc︡{"stdout":"(1,2)(3,4)\n"}︡
︠9e5ef4d0-282a-442a-8053-3b170a0fe696︠
a(1)
︡137f0249-2a1e-4f9f-bc25-0f57d8cd842f︡{"stdout":"2\n"}︡
︠8a0533ce-6e69-45dd-801e-fafc82a0c6e4︠
a(3)
︡64a2cdaf-5263-49ed-973a-6dbfd2026f5d︡{"stdout":"4\n"}︡
︠0bdfc694-c46d-4ed7-bb67-96fb1d149144︠
b = S([2,3,1,4]); b
︡981777f3-b6cb-42b4-b649-00446d2d49d0︡{"stdout":"(1,2,3)\n"}︡
︠3956b48d-cd97-4736-8e96-2971847e2e37︠
# exercise: does this mean "do b then a" or does it mean "do a then b"?
a * b
︡2229e6d2-2b37-4f57-b3f9-7ea68955802d︡{"stdout":"(1,3,4)\n"}︡
︠e03d899c-7603-4ec8-9df2-df9d3cc1df4a︠

︠081d0b96-323c-40f6-9cc3-0991b0a16193︠

︠ed4b2264-cd38-41be-adf9-937dec72dca7︠

︠f801f8a6-5504-40a8-a6a4-3447d16cfc6bi︠
%md
## Subgroups

A **subgroup** $G$ of $S_n$ is a subset such that:

   - if $a,b\in G$ then $a b \in G$.
   - for each $a\in G$ there is $b\in G$ such that $ab = ()$, where $()$ means the "identity permutation", which leaves everything fixed.

<br>

Given any set of elements of $S_n$, the set of everything you can get by multiplying those elements together is a subgroup, called the subgroup generated by them.
︡78165d16-86bb-4343-8cda-4b283edea3a4︡{"html":"<h2>Subgroups</h2>\n\n<p>A <strong>subgroup</strong> $G$ of $S_n$ is a subset such that:</p>\n\n<ul>\n<li>if $a,b\\in G$ then $a b \\in G$.</li>\n<li>for each $a\\in G$ there is $b\\in G$ such that $ab = ()$, where $()$ means the &#8220;identity permutation&#8221;, which leaves everything fixed.</li>\n</ul>\n\n<p><br></p>\n\n<p>Given any set of elements of $S_n$, the set of everything you can get by multiplying those elements together is a subgroup, called the subgroup generated by them.</p>\n"}︡
︠d9585f07-fa04-41f5-bc93-7c9a3f8518e8︠
a = S([(1,2),(3,4)]); a
b = S([2,3,1,4]); b
︡7e4dfe59-2cdf-4cdb-9c31-007e25e334a2︡{"stdout":"(1,2)(3,4)\n"}︡{"stdout":"(1,2,3)\n"}︡
︠62f579cb-77e5-4091-969c-33734a3cf935︠
G = S.subgroup([a,b]); G
︡561642af-07c7-4f26-95ab-a1312f93246b︡{"stdout":"Subgroup of (Symmetric group of order 4! as a permutation group) generated by [(1,2)(3,4), (1,2,3)]\n"}︡
︠7a10e66d-2e84-4d68-abac-f460c71d3662︠
S.cardinality()
︡342d3752-611d-41fb-b284-27f1bcc2e11a︡{"stdout":"24\n"}︡
︠e33c0465-7094-47d0-ab8b-2c8f46f4816b︠
G.cardinality()
︡483bb99f-331e-4b80-b97f-07e77b4fb20b︡{"stdout":"12\n"}︡
︠b61fdc69-d013-4e4a-9101-80ea1250cfa3︠
list(G)   # this is called "The alternating group A_4".  Groups often have names.   One of the most
          # important theorems of the 20th century was a complete classification of all finite groups!!
︡62971960-4c62-46f4-8605-1852a9e73286︡{"stdout":"[(), (2,3,4), (2,4,3), (1,2)(3,4), (1,2,3), (1,2,4), (1,3,2), (1,3,4), (1,3)(2,4), (1,4,2), (1,4,3), (1,4)(2,3)]\n"}︡
︠c1ba9b9a-533f-4628-a463-2c1f298d60d6︠

︠14ef0abb-b198-48ee-8b64-9eeb96592e6fi︠
%md
## Where do groups come from?  Graphs...
On Wednesday we saw how subgroups arise naturally as the symmetries (=automorphism groups) of graphs.

︡7b6bb1b8-bd37-4181-826b-7f994eb709c7︡{"html":"<h2>Where do groups come from?  Graphs&#8230;</h2>\n\n<p>On Wednesday we saw how subgroups arise naturally as the symmetries (=automorphism groups) of graphs.</p>\n"}︡
︠c405a5fb-3188-4c3b-a926-a1817a136e87︠
g = graphs.WheelGraph(6)
g.plot()
︡9cbbbcee-3af4-4d14-8da8-f2ec20e002e9︡{"once":false,"file":{"show":true,"uuid":"e6124dc7-34c0-4dd9-8b06-3dfd590a2954","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/30381/tmp_a_UZga.png"}}︡
︠fe3eb037-d343-4df1-94bc-a4d97dd911f8︠
G = g.automorphism_group(); G
︡ef7c8e2a-137c-4e19-b527-fa0e8cff4763︡{"stdout":"Permutation Group with generators [(2,5)(3,4), (1,2,3,4,5)]\n"}︡
︠e58c57cd-c5f1-4562-ba38-f75c2cd7aa27︠
H = groups.permutation.Dihedral(5); H
︡54895a30-28bb-4192-916d-00361522e8bd︡{"stdout":"Dihedral group of order 10 as a permutation group\n"}︡
︠1462f7fe-a63a-4750-9fd6-62c75f22274e︠
G.is_isomorphic(H)
︡d8279bd6-9118-4720-a26d-27bd82fbddcf︡{"stdout":"True\n"}︡
︠4a7acb4d-72b2-49fe-b58d-dbe33b20139c︠
G.cardinality()
︡b763bdc3-7437-46df-b5c5-a8f00b318d16︡{"stdout":"10\n"}︡
︠e0811a9d-8322-40fa-af20-db91f9b0cce1︠
list(G)
︡cf88e497-344c-4c0e-b68d-3efd2ab7cd62︡{"stdout":"[(), (2,5)(3,4), (1,2)(3,5), (1,2,3,4,5), (1,3)(4,5), (1,3,5,2,4), (1,4)(2,3), (1,4,2,5,3), (1,5,4,3,2), (1,5)(2,4)]\n"}︡
︠9079dc24-f274-4922-a2ea-c7a5bb85dd5a︠


︠4c651204-3e16-4b82-a330-6bfa90af1c62i︠
%md
## Where do groups come from?  Games...
︡73c0953d-ed23-462b-bbd7-e8517560acb3︡{"html":"<h2>Where do groups come from?  Games&#8230;</h2>\n"}︡
︠c6ae9039-56ee-45da-a9b6-0ed90b3dec7a︠

︠3ce7d65d-30e5-4f9f-af0a-a7dc286e284f︠
G = groups.permutation.RubiksCube(); G
︡cf4ec18c-c357-4669-bb03-39737d1f8afd︡{"stdout":"The Rubik's cube group with generators R,L,F,B,U,D in SymmetricGroup(48).\n"}︡
︠464aa21e-ba8f-409f-b129-5769d1afab78︠
G.cardinality()
︡6b0825f5-245b-49fa-8cfa-630dfa724760︡{"stdout":"43252003274489856000\n"}︡
︠bd4c42ef-c903-44b4-aa7c-adbc8484ade3︠
43252003274489856000.0` / factorial(48)
︡83a888e8-651f-434f-8381-a633568e2ad9︡{"stdout":"3.4841547738970719308e-42\n"}︡
︠7968f20c-7b3e-44ea-857b-6dc72c4fdeff︠
show(factor(G.cardinality()))
︡10a07b5c-6d3c-4f2c-8e45-6e31c30d573f︡{"tex":{"tex":"2^{27} \\cdot 3^{14} \\cdot 5^{3} \\cdot 7^{2} \\cdot 11","display":true}}︡
︠c5ba9a64-2635-4174-870b-1404865891b9︠
G.gens()
︡50ab1530-c965-4082-95bc-e844889a3472︡{"stdout":"[(1,14,48,27)(2,12,47,29)(3,9,46,32)(33,35,40,38)(34,37,39,36), (14,22,30,38)(15,23,31,39)(16,24,32,40)(41,43,48,46)(42,45,47,44), (6,25,43,16)(7,28,42,13)(8,30,41,11)(17,19,24,22)(18,21,23,20), (1,17,41,40)(4,20,44,37)(6,22,46,35)(9,11,16,14)(10,13,15,12), (3,38,43,19)(5,36,45,21)(8,33,48,24)(25,27,32,30)(26,29,31,28), (1,3,8,6)(2,5,7,4)(9,33,25,17)(10,34,26,18)(11,35,27,19)]\n"}︡
︠f91d3566-16d2-40d5-8b1b-88ef91729ccf︠
# explain why moves of the cube defines a subgroup of S_{48}....
︠9de9c6a6-cac0-4b5e-b231-4e2e7f94c4adi︠
md("**Google Rubik's Cube**")
html.iframe("https://www.google.com/logos/2014/rubiks/rubiks.html")
︡304d8754-3480-4189-98e7-1892d70e8cb9︡{"html":"<p><strong>Google Rubik&#8217;s Cube</strong></p>\n"}︡{"html":"<iframe height=\"400\" width=\"800\" src=\"https://www.google.com/logos/2014/rubiks/rubiks.html\"></iframe>"}︡
︠03a8d41c-b4f4-4769-a45a-6411c9e3593c︠

︠f71c3769-f69c-4b75-a259-e6019cc5a1abi︠
%md
## Where do groups come from? matrices over finite fields ...

- recall finite fields, e.g., $\mathbf{F}_5={0,1,2,3,4}$.
︡4e801d0c-0057-463a-ae76-604008a21a24︡{"html":"<h2>Where do groups come from? matrices over finite fields &#8230;</h2>\n\n<ul>\n<li>recall finite fields, e.g., $\\mathbf{F}_5={0,1,2,3,4}$.</li>\n</ul>\n"}︡
︠f382c299-3a13-4655-b2ae-09c493194647︠

︠958a13b4-9a86-48fa-89fe-80e65b742727︠
F5 = GF(5)
F5
︡05560c8d-f89e-417e-ab48-d2ba88bbfe6d︡{"stdout":"Finite Field of size 5\n"}︡
︠f5a2b63c-800c-4925-b9cb-078ce9c510d0︠
list(F5)
︡f3e0245a-e40e-4787-97d0-3161a187d938︡{"stdout":"[0, 1, 2, 3, 4]\n"}︡
︠53d8489d-18e3-460b-9876-1072a4d51a31︠
a = F5(4); b = F5(2)
print 'a     =', a
print 'b     =', b
print "a + b =", a+b
print "a * b =", a*b
︡4bd15a1e-85e7-4216-a749-85d0276a1b5a︡{"stdout":"a     = 4\n"}︡{"stdout":"b     = 2\n"}︡{"stdout":"a + b = 1\n"}︡{"stdout":"a * b = 3\n"}︡
︠10b16af0-6dfb-4f2f-a498-ea801ce67b99i︠
%md
The set of invertible $2\times 2$ matrices with entries in a specific finite field... is a group.
︡26ab5f56-753f-4190-beee-91064a9401de︡{"html":"<p>The set of invertible $2\\times 2$ matrices with entries in a specific finite field&#8230; is a group.</p>\n"}︡
︠37b5a283-0f84-4011-8500-43b007753128︠
G = GL(2, F5); G
︡21f90e6b-2d4f-4a8f-8299-37f8414cc91a︡{"stdout":"General Linear Group of degree 2 over Finite Field of size 5\n"}︡
︠3903d457-59e9-4a19-8067-9ce8c32bffa5︠
G.cardinality()
︡c0aa4097-421f-4e36-a667-f842463180b8︡{"stdout":"480\n"}︡
︠ae066a58-654d-460d-9569-fdf0d05d0775︠
show(G.gens())
︡993e766f-4ea4-456d-8856-ce11215fdce8︡{"tex":{"tex":"\\left(\\left(\\begin{array}{rr}\n2 & 0 \\\\\n0 & 1\n\\end{array}\\right), \\left(\\begin{array}{rr}\n4 & 1 \\\\\n4 & 0\n\\end{array}\\right)\\right)","display":true}}︡
︠db585f13-aa4d-4c20-bc37-bcf47027faadi︠
%md
### You can get other groups:

  - changing $2$ to any $n\geq 1$.

  - considering only matrices with determinant 1

  - Considering only upper triangular invertible matrices.

and many other things.

This leads to a major area of mathematics called **representation theory**.
︡b253a765-463a-4db7-b238-ec66f9aedafe︡{"html":"<h3>You can get other groups:</h3>\n\n<ul>\n<li><p>changing $2$ to any $n\\geq 1$.</p></li>\n<li><p>considering only matrices with determinant 1</p></li>\n<li><p>Considering only upper triangular invertible matrices.</p></li>\n</ul>\n\n<p>and many other things.</p>\n\n<p>This leads to a major area of mathematics called <strong>representation theory</strong>.</p>\n"}︡
︠5b1590dc-fd0f-4270-8c3f-8895423c397e︠

︠5a16f29e-3d20-4a76-9ac1-4adf687b329d︠

︠8f3660c8-a77a-4f57-8f39-95573ad59629i︠
%md
## Where do groups come from? a million other surprising places...

 - <http://www.sagemath.org/doc/reference/groups/sage/groups/perm_gps/permgroup_named.html>

There are also infinite groups... e.g., invertible $2\times 2$ matrices with real number entries.

︡4d50894b-2c77-4565-a020-585bb1057923︡{"html":"<h2>Where do groups come from? a million other surprising places&#8230;</h2>\n\n<ul>\n<li><a href=\"http://www.sagemath.org/doc/reference/groups/sage/groups/perm_gps/permgroup_named.html\">http://www.sagemath.org/doc/reference/groups/sage/groups/perm_gps/permgroup_named.html</a></li>\n</ul>\n\n<p>There are also infinite groups&#8230; e.g., invertible $2\\times 2$ matrices with real number entries.</p>\n"}︡
︠7dcf8da0-d2ff-4fb9-ad61-480dd32e33fd︠

︠de8a85d4-77aa-4bf3-b412-c6bed4d16fb9︠










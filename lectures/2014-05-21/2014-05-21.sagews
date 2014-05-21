︠7af91bd3-1d59-4cbf-bcd4-c066b0c31904i︠
%md

# Math 480b -- Sage Course
## Today: Graph Theory

### May 21, 2014

Screencast: <http://youtu.be/4a1QZJ8aKUM>

**Plan**

- Questions

- Homework:
   - all grading of hw6 should have been returned

- Presentations:  update about final schedule

- Topic: **Graph Theory**



︡1b4f5dfb-ccfe-4b97-b701-d7e199f450a9︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>Today: Graph Theory</h2>\n\n<h3>May 21, 2014</h3>\n\n<p>Screencast: <a href=\"http://youtu.be/4a1QZJ8aKUM\">http://youtu.be/4a1QZJ8aKUM</a></p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions</p></li>\n<li><p>Homework:</p>\n\n<ul>\n<li>all grading of hw6 should have been returned</li>\n</ul></li>\n<li><p>Presentations:  update about final schedule</p></li>\n<li><p>Topic: <strong>Graph Theory</strong></p></li>\n</ul>\n"}︡
︠8488df7e-2bcd-41ed-9e93-4d78a85144adi︠

%md
## Graph Theory

- Vertices and edges: "Networks"

- Incredibly important in computer science, social sciences, etc.

- Also big in pure math research -- part of combinatorics.  Very popular REU (=research experience for undergraduates) topic.



︡dabc0be5-4be9-47ea-8f99-490fdb45dbae︡{"html":"<h2>Graph Theory</h2>\n\n<ul>\n<li><p>Vertices and edges: &#8220;Networks&#8221;</p></li>\n<li><p>Incredibly important in computer science, social sciences, etc.</p></li>\n<li><p>Also big in pure math research &#8211; part of combinatorics.  Very popular REU (=research experience for undergraduates) topic.</p></li>\n</ul>\n"}︡
︠e7d9738f-26ae-4214-969c-efefff99890fi︠
%md
## A quick basic demo
(so you can easily do that homework problem)
︡eebdf97c-973d-4d93-9d96-4e4c645cb214︡{"html":"<h2>A quick basic demo</h2>\n\n<p>(so you can easily do that homework problem)</p>\n"}︡
︠7961905c-d8c1-4f8a-b461-ba79a33f5931︠
g = graphs.BarbellGraph(4, 4)
g
︡7eb3c235-718e-418b-b6b5-e44b648ef1d5︡{"stdout":"Barbell graph: Graph on 12 vertices\n"}︡
︠3ddcc2f0-c803-4559-8ff6-66217a483d65︠
type(g)
︡0777eaa4-8fc3-4bdd-bf8f-0c9e7669ddf6︡{"stdout":"<class 'sage.graphs.graph.Graph'>\n"}︡
︠06f02ebd-f917-47ee-bbc2-60c60f987dc5︠
(0,9)(1,10)(2,11)(3,8)(4,7)(5,6)
︠a519e1c1-989d-49ed-8477-5d9bbd7350a2︠
(0,9)(1,10)(2,11)(3,8)(4,7)(5,6)
︠6b5025b4-8b7b-4b53-b360-ec30b1b0d5c7︠
plot(g) #+ plot(sin, (-5,5))
︡c19bbe13-2e0f-4e27-9706-7de10c7876b8︡{"once":false,"file":{"show":true,"uuid":"d75d63b1-fbde-4289-a9a2-fd413a412f1f","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/20148/tmp_OjJ3iW.png"}}︡
︠714d388a-ca98-433b-8058-bb671051e10c︠
v = v = g.to_dictionary(); v
︡2a766cd0-3458-4ccb-b1fc-3a6f4bb23877︡{"stdout":"{0: [1, 2, 3], 1: [0, 2, 3], 2: [0, 1, 3], 3: [0, 1, 2, 4], 4: [3, 5], 5: [4, 6], 6: [5, 7], 7: [6, 8], 8: [7, 9, 10, 11], 9: [8, 10, 11], 10: [8, 9, 11], 11: [8, 9, 10]}\n"}︡
︠c865d3bf-eea2-4df8-afd1-de4e53ecb152︠
type(v)
︡ab2c871a-d2d7-472c-b830-9f9b1f075a47︡{"stdout":"<type 'dict'>\n"}︡
︠e6b6796e-4593-4172-844e-f0cccc9c3ab7︠
Graph(v)
︡af047b7e-4eee-4204-84f1-ffa7d8fc4826︡{"stdout":"Graph on 12 vertices\n"}︡
︠942f74f8-b72e-4a23-ac3f-a686c9890d2b︠
type(v)
︡ab2c871a-d2d7-472c-b830-9f9b1f075a47︡{"stdout":"<type 'dict'>\n"}︡
︠0208cbbb-efb0-4ae8-a31f-afd1842a9725︠
Graph(v)
︡af047b7e-4eee-4204-84f1-ffa7d8fc4826︡{"stdout":"Graph on 12 vertices\n"}︡
︠3d94f6c9-2691-4828-92f3-49968fc97223︠
# graphs have a few methods...
len(dir(g))
︡0ee26b0b-5e96-445f-9211-3df3735fed85︡{"stdout":"377\n"}︡
︠4362eacc-00f0-4a23-95d8-d6f494e81dfci︠
%md A **clique** is a maximally completed subgraph.  Here's a function to find them all...
︡61920f26-dc33-4399-ac1b-688f920bee9d︡{"html":"<p>A <strong>clique</strong> is a maximally completed subgraph.  Here&#8217;s a function to find them all&#8230;</p>\n"}︡
︠88b7ded2-1413-48c0-b211-913e2c4f2be2︠
g.cliques_maximal()
︡78594516-1f51-4f42-b09f-d6bae15ac42c︡{"stdout":"[[0, 1, 2, 3], [3, 4], [4, 5], [5, 6], [6, 7], [7, 8], [8, 9, 10, 11]]\n"}︡
︠df424430-39dc-47ee-9c01-14de35a509a6︠
(0,9)(1,10)(2,11)(3,8)(4,7)(5,6)
︠571813b1-a740-4c6d-9983-4e7e11abd40d︠
P = g.coloring(); P
︡6af0621c-1708-47a2-927a-79338764d6a3︡{"stdout":"[[2, 10], [3, 11], [0, 4, 6, 8], [1, 5, 7, 9]]\n"}︡
︠5d006e61-0476-412e-9b4f-a0e7739ad8ea︠
(0,9)(1,10)(2,11)(3,8)(4,7)(5,6)
︠cf5e68a0-ebd1-4313-a5b9-806111218d73︠
g.plot(partition=P)
︡db098503-8717-4d8d-baa8-5388e79539e5︡{"once":false,"file":{"show":true,"uuid":"45aaf2b0-4873-4b0d-89e9-37ed143390b0","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/20148/tmp_Zqo7gK.png"}}︡
︠5919ee2d-8c7e-4d6b-aead-94bb40927780︠
g.adjacency_matrix()
︡d08c9888-fe35-41de-802e-54925a0889b6︡{"stdout":"[0 1 1 1 0 0 0 0 0 0 0 0]\n[1 0 1 1 0 0 0 0 0 0 0 0]\n[1 1 0 1 0 0 0 0 0 0 0 0]\n[1 1 1 0 1 0 0 0 0 0 0 0]\n[0 0 0 1 0 1 0 0 0 0 0 0]\n[0 0 0 0 1 0 1 0 0 0 0 0]\n[0 0 0 0 0 1 0 1 0 0 0 0]\n[0 0 0 0 0 0 1 0 1 0 0 0]\n[0 0 0 0 0 0 0 1 0 1 1 1]\n[0 0 0 0 0 0 0 0 1 0 1 1]\n[0 0 0 0 0 0 0 0 1 1 0 1]\n[0 0 0 0 0 0 0 0 1 1 1 0]\n"}︡
︠8e7e48da-24d9-4f57-86d8-f590cd9abad1︠
0  1   2   3   4   5   6
3  2   5   1   4   6   0

3  2   5   1   4   6   0

# disjoint cycle notation
(0,3,1,2,5,6)


︠05134048-150e-48f4-ab37-9764f480bcc2︠
G = g.automorphism_group(); G
︡c3e04f62-9f46-4571-9480-dc6f02390176︡{"stdout":"Permutation Group with generators [(10,11), (9,10), (1,2), (0,1), (0,9)(1,10)(2,11)(3,8)(4,7)(5,6)]\n"}︡
︠5f979ddc-cccf-435a-94c4-0f56c9cfc82d︠
G.cardinality()
︡38313df4-c9e2-4072-85bc-9bed8d98655e︡{"stdout":"72"}︡{"stdout":"\n"}︡
︠f57a6929-f985-4b85-b5fe-961496437599︠
list(G)
︡1d7967c4-6616-4a9a-b66a-f1e44bbab4cd︡{"stdout":"[(), (10,11), (9,10), (9,10,11), (9,11,10), (9,11), (1,2), (1,2)(10,11), (1,2)(9,10), (1,2)(9,10,11), (1,2)(9,11,10), (1,2)(9,11), (0,1), (0,1)(10,11), (0,1)(9,10), (0,1)(9,10,11), (0,1)(9,11,10), (0,1)(9,11), (0,1,2), (0,1,2)(10,11), (0,1,2)(9,10), (0,1,2)(9,10,11), (0,1,2)(9,11,10), (0,1,2)(9,11), (0,2,1), (0,2,1)(10,11), (0,2,1)(9,10), (0,2,1)(9,10,11), (0,2,1)(9,11,10), (0,2,1)(9,11), (0,2), (0,2)(10,11), (0,2)(9,10), (0,2)(9,10,11), (0,2)(9,11,10), (0,2)(9,11), (0,9)(1,10)(2,11)(3,8)(4,7)(5,6), (0,9)(1,10,2,11)(3,8)(4,7)(5,6), (0,9,1,10)(2,11)(3,8)(4,7)(5,6), (0,9,1,10,2,11)(3,8)(4,7)(5,6), (0,9,2,11,1,10)(3,8)(4,7)(5,6), (0,9,2,11)(1,10)(3,8)(4,7)(5,6), (0,9)(1,11,2,10)(3,8)(4,7)(5,6), (0,9)(1,11)(2,10)(3,8)(4,7)(5,6), (0,9,1,11,2,10)(3,8)(4,7)(5,6), (0,9,1,11)(2,10)(3,8)(4,7)(5,6), (0,9,2,10)(1,11)(3,8)(4,7)(5,6), (0,9,2,10,1,11)(3,8)(4,7)(5,6), (0,10,1,9)(2,11)(3,8)(4,7)(5,6), (0,10,2,11,1,9)(3,8)(4,7)(5,6), (0,10)(1,9)(2,11)(3,8)(4,7)(5,6), (0,10,2,11)(1,9)(3,8)(4,7)(5,6), (0,10)(1,9,2,11)(3,8)(4,7)(5,6), (0,10,1,9,2,11)(3,8)(4,7)(5,6), (0,10,1,11,2,9)(3,8)(4,7)(5,6), (0,10,2,9)(1,11)(3,8)(4,7)(5,6), (0,10)(1,11,2,9)(3,8)(4,7)(5,6), (0,10,2,9,1,11)(3,8)(4,7)(5,6), (0,10)(1,11)(2,9)(3,8)(4,7)(5,6), (0,10,1,11)(2,9)(3,8)(4,7)(5,6), (0,11,2,10,1,9)(3,8)(4,7)(5,6), (0,11,1,9)(2,10)(3,8)(4,7)(5,6), (0,11,2,10)(1,9)(3,8)(4,7)(5,6), (0,11)(1,9)(2,10)(3,8)(4,7)(5,6), (0,11,1,9,2,10)(3,8)(4,7)(5,6), (0,11)(1,9,2,10)(3,8)(4,7)(5,6), (0,11,2,9)(1,10)(3,8)(4,7)(5,6), (0,11,1,10,2,9)(3,8)(4,7)(5,6), (0,11,2,9,1,10)(3,8)(4,7)(5,6), (0,11)(1,10,2,9)(3,8)(4,7)(5,6), (0,11,1,10)(2,9)(3,8)(4,7)(5,6), (0,11)(1,10)(2,9)(3,8)(4,7)(5,6)]"}︡{"stdout":"\n"}︡
︠4e5a36a2-65a1-4962-b5ab-9e767e3a80a9︠
plot(g.disjoint_union(g))
︡357f7909-1b08-4bb7-aa21-965f08103435︡{"once":false,"file":{"show":true,"uuid":"c61c0e2b-de2c-4113-b32c-0ec355d19cd5","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/20148/tmp_fvWRZb.png"}}︡
︠6eb8cd33-3231-40ce-918a-d1668ec1c7ae︠
g.plot3d()
︡152a00d7-c540-4de0-a1bb-a3b07515a2e6︡{"html":"<div id=c2a46d87-07d9-4653-a72a-cd1d5b801cef style='border:1px solid grey'></div>"}︡{"obj":"{\"foreground\": null, \"camera_distance\": 2.014936179692128, \"height\": null, \"width\": null, \"renderer\": null, \"background\": null}","javascript":{"coffeescript":false,"code":"$('#c2a46d87-07d9-4653-a72a-cd1d5b801cef').salvus_threejs(obj)"},"once":false}︡
︠ae8cfdf6-c3ac-4178-8419-739cff817ee6︠

︠3761624d-d00f-46a7-a89a-2f3a2f19215c︠

︠99334d4d-74e4-4cdd-9fe0-0a18a4ee18a1i︠
%md
## Historical Interlude

- Robert Miller and Emily Kirkman
- Nathann Cohen


Started with the "graph survey": <http://wiki.sagemath.org/graph_survey>

**Conclusion:**

  - overall NetworkX looks more or less best, of all software they could evaluate back then.
  - pleasant fact: NetworkX is an open source Python library :-)
  - NetworkX is from Los Alamos, and targets applications (not pure math)

Included NetworkX in Sage, built our own graph data types, added functionality, etc., to make it more useful for pure math as well.  Tons of work over time... with many other contributors.

See the overview of functionality at <http://www.sagemath.org/doc/reference/graphs/>



︡e8729e6b-5fca-4e07-9427-ae99429d5835︡{"html":"<h2>Historical Interlude</h2>\n\n<ul>\n<li>Robert Miller and Emily Kirkman</li>\n<li>Nathann Cohen</li>\n</ul>\n\n<p>Started with the &#8220;graph survey\": <a href=\"http://wiki.sagemath.org/graph_survey\">http://wiki.sagemath.org/graph_survey</a></p>\n\n<p><strong>Conclusion:</strong></p>\n\n<ul>\n<li>overall NetworkX looks more or less best, of all software they could evaluate back then.</li>\n<li>pleasant fact: NetworkX is an open source Python library :-)</li>\n<li>NetworkX is from Los Alamos, and targets applications (not pure math)</li>\n</ul>\n\n<p>Included NetworkX in Sage, built our own graph data types, added functionality, etc., to make it more useful for pure math as well.  Tons of work over time&#8230; with many other contributors.</p>\n\n<p>See the overview of functionality at <a href=\"http://www.sagemath.org/doc/reference/graphs/\">http://www.sagemath.org/doc/reference/graphs/</a></p>\n"}︡
︠95655556-496c-44f9-96a4-18d653d4f8be︠

︠3ac90c11-c9bf-49b3-9989-ba8950322f44︠

︠7c5ae8f4-e355-4b68-b765-bae8027fcec8︠

︠325a5c4c-6da3-41c4-86c9-2db604182f8b︠

︠97736e6b-4918-4abf-b717-50bb8abf6194︠

︠9e00d2b5-a85c-4ac2-88ce-7e4b2b5c4932i︠
%md
## The Graph Catalog

(mainly Emily Kirkman)
︡35a94968-f5e1-4824-9f1c-b90cb0d6550c︡{"html":"<h2>The Graph Catalog</h2>\n\n<p>(mainly Emily Kirkman)</p>\n"}︡
︠9aaddd4d-839b-43c5-8265-694bd4dcbf5f︠
plot(graphs.ShrikhandeGraph())
︡5d1b6670-04da-47c6-8e56-7cfa6ad62380︡{"once":false,"file":{"show":true,"uuid":"35e62a62-a757-4654-bb9f-11bbdc8bc5df","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/20148/tmp_8ukmJf.png"}}︡
︠ce5cf4b5-0cd6-4831-89c9-e80cef27f1a7︠
dir(graphs)
︡71ed3ff1-3837-4a12-938f-01d247dcfcaf︡{"stdout":"['Balaban10Cage', 'Balaban11Cage', 'BalancedTree', 'BarbellGraph', 'BidiakisCube', 'BiggsSmithGraph', 'BishopGraph', 'BlanusaFirstSnarkGraph', 'BlanusaSecondSnarkGraph', 'BrinkmannGraph', 'BrouwerHaemersGraph', 'BubbleSortGraph', 'BuckyBall', 'BullGraph', 'ButterflyGraph', 'CameronGraph', 'ChessboardGraphGenerator', 'ChvatalGraph', 'CirculantGraph', 'CircularLadderGraph', 'ClawGraph', 'ClebschGraph', 'CompleteBipartiteGraph', 'CompleteGraph', 'CompleteMultipartiteGraph', 'CoxeterGraph', 'CubeGraph', 'CycleGraph', 'DegreeSequence', 'DegreeSequenceBipartite', 'DegreeSequenceConfigurationModel', 'DegreeSequenceExpected', 'DegreeSequenceTree', 'DesarguesGraph', 'DiamondGraph', 'DodecahedralGraph', 'DorogovtsevGoltsevMendesGraph', 'DoubleStarSnark', 'DurerGraph', 'DyckGraph', 'EllinghamHorton54Graph', 'EllinghamHorton78Graph', 'EmptyGraph', 'ErreraGraph', 'FibonacciTree', 'FlowerSnark', 'FoldedCubeGraph', 'FolkmanGraph', 'FosterGraph', 'FranklinGraph', 'FriendshipGraph', 'FruchtGraph', 'FuzzyBallGraph', 'GeneralizedPetersenGraph', 'GoldnerHararyGraph', 'GrayGraph', 'Grid2dGraph', 'GridGraph', 'GrotzschGraph', 'HallJankoGraph', 'HanoiTowerGraph', 'HararyGraph', 'HarriesGraph', 'HarriesWongGraph', 'HeawoodGraph', 'HerschelGraph', 'HexahedralGraph', 'HigmanSimsGraph', 'HoffmanGraph', 'HoffmanSingletonGraph', 'HoltGraph', 'HortonGraph', 'HouseGraph', 'HouseXGraph', 'HyperStarGraph', 'IcosahedralGraph', 'IntervalGraph', 'JohnsonGraph', 'KingGraph', 'KittellGraph', 'KneserGraph', 'KnightGraph', 'KrackhardtKiteGraph', 'LCFGraph', 'LadderGraph', 'LjubljanaGraph', 'LollipopGraph', 'M22Graph', 'MarkstroemGraph', 'McGeeGraph', 'McLaughlinGraph', 'MeredithGraph', 'MoebiusKantorGraph', 'MoserSpindle', 'MycielskiGraph', 'MycielskiStep', 'NKStarGraph', 'NStarGraph', 'NauruGraph', 'OctahedralGraph', 'OddGraph', 'PaleyGraph', 'PappusGraph', 'PathGraph', 'PermutationGraph', 'PetersenGraph', 'PoussinGraph', 'QueenGraph', 'RandomBarabasiAlbert', 'RandomBipartite', 'RandomBoundedToleranceGraph', 'RandomGNM', 'RandomGNP', 'RandomHolmeKim', 'RandomInterval', 'RandomIntervalGraph', 'RandomLobster', 'RandomNewmanWattsStrogatz', 'RandomRegular', 'RandomShell', 'RandomToleranceGraph', 'RandomTree', 'RandomTreePowerlaw', 'RingedTree', 'RobertsonGraph', 'RookGraph', 'SchlaefliGraph', 'ShrikhandeGraph', 'SimsGewirtzGraph', 'SousselierGraph', 'StarGraph', 'SylvesterGraph', 'SymplecticGraph', 'SzekeresSnarkGraph', 'TetrahedralGraph', 'ThomsenGraph', 'TietzeGraph', 'ToleranceGraph', 'Toroidal6RegularGrid2dGraph', 'ToroidalGrid2dGraph', 'Tutte12Cage', 'TutteCoxeterGraph', 'TutteGraph', 'WagnerGraph', 'WatkinsSnarkGraph', 'WellsGraph', 'WheelGraph', 'WienerArayaGraph', 'WorldMap', '__call__', '__doc__', '__module__', 'cospectral_graphs', 'fullerenes', 'fusenes', 'line_graph_forbidden_subgraphs', 'nauty_geng', 'petersen_family', 'sage', 'trees']\n"}︡
︠5abc60c9-c720-4d73-b79b-67513230ab36︠
# peer grading graph :-)
g = graphs.RandomRegular(3,40,seed=8)
plot(g)
︡2ccc4a18-d18a-440c-92b5-faebcfa41341︡{"once":false,"file":{"show":true,"uuid":"3132156c-29e7-4a63-a4e8-ae3731e45f27","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/20148/tmp_nBTLdt.png"}}︡
︠c73e8558-8dcf-4b33-82cd-b6557b2d446c︠
g.is_planar()
︡10f0ccd7-2334-49cd-96c1-6339c84781b4︡{"stdout":"False\n"}︡
︠3f1aafb4-82a4-4d20-a303-5aef202c16b7︠
# I tried this and it "took forever", illustrating how combinatorial algorithm often have
# exponential complexity...
g.genus()
︡c4777f31-2ac8-4742-b969-adc227bd6781︡{"stderr":"Error in lines 3-3\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/usr/local/sage/sage-6.2.rc0/local/lib/python2.7/site-packages/sage/graphs/generic_graph.py\", line 4052, in genus\n    g += genus.simple_connected_graph_genus(H, set_embedding = True, check = False, minimal = True)\n  File \"genus.pyx\", line 743, in sage.graphs.genus.simple_connected_graph_genus (sage/graphs/genus.c:4508)\n  File \"genus.pyx\", line 570, in sage.graphs.genus.simple_connected_genus_backtracker.genus (sage/graphs/genus.c:3242)\n  File \"c_lib.pyx\", line 73, in sage.ext.c_lib.sig_raise_exception (sage/ext/c_lib.c:872)\nKeyboardInterrupt\n"}︡
︠e0a79fdd-c9e3-4be1-9146-c9014f42b8f5︠

︠70fc83f8-3a30-4bc4-8f2d-d8993a665600︠

︠64402087-e44c-4041-9630-84c0d3e4c97ai︠
%md
## The Graph Database
(mainly Jason Grout and Emily Kirkman)

See <http://www.sagemath.org/doc/reference/graphs/sage/graphs/graph_database.html>
︡5ad3e7a4-e87b-41a9-bfa8-87c5b02ae499︡{"html":"<h2>The Graph Database</h2>\n\n<p>(mainly Jason Grout and Emily Kirkman)</p>\n\n<p>See <a href=\"http://www.sagemath.org/doc/reference/graphs/sage/graphs/graph_database.html\">http://www.sagemath.org/doc/reference/graphs/sage/graphs/graph_database.html</a></p>\n"}︡
︠b13255e8-7bf1-4841-a2f7-a02c05b7ba9d︠
Q = GraphQuery(display_cols=['graph6','num_vertices','degree_sequence'],
               num_edges=['<=',6],
               min_degree=2)
Q.number_of()
︡f050197f-9760-4bb2-be87-77f9c031615b︡{"stdout":"9\n"}︡
︠969d0054-be4a-4181-9961-f63de5a003f2︠
Q.show()
︡d76a97dd-8dd1-4c5d-a813-effd7ac1ed85︡{"stdout":"Graph6               Num Vertices         Degree Sequence     \n------------------------------------------------------------\nBw                   3                    [2, 2, 2]           \nC]                   4                    [2, 2, 2, 2]        \nC^                   4                    [2, 2, 3, 3]        \nDFw                  5                    [2, 2, 2, 3, 3]     \nDK{                  5                    [2, 2, 2, 2, 4]     \nDLo                  5                    [2, 2, 2, 2, 2]     \nDbk                  5                    [2, 2, 2, 3, 3]     \nEIe_                 6                    [2, 2, 2, 2, 2, 2]  \nEJaG                 6                    [2, 2, 2, 2, 2, 2]  \n"}︡
︠25f27202-d107-402a-b042-1c29dd883a8a︠
g = Graph('EJaG'); plot(g)
︡90fbcc5a-4c44-4349-9a4f-a41ebef7e582︡{"once":false,"file":{"show":true,"uuid":"fe75ee70-7676-4fe3-9d8f-cd839658b844","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/20148/tmp_KQYvb9.png"}}︡
︠2992f0a3-d626-4a3b-b28b-9c2993b0ea48︠
plot(g, figsize=2)
︡0b86ba8d-110d-4135-9324-988820bd365e︡{"once":false,"file":{"show":true,"uuid":"74e58709-1682-4df3-87d7-41d5b1fc3be3","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/20148/tmp_cPoRkH.png"}}︡
︠a3de9bcb-b23f-447d-8284-cf9fc8cfa5a8︠
Q = GraphQuery(display_cols=['graph6','num_vertices','degree_sequence'],num_edges=['<=',5],min_degree=2)
Q.number_of()
︡375f8927-40c9-48e9-a7ee-d47833262e5f︡{"stdout":"4\n"}︡
︠a877f9c6-8430-411c-8453-89cec9cebc8d︠
Q.show()
︡5305003f-7447-4223-9330-f542b0df3c5c︡{"stdout":"Graph6               Num Vertices         Degree Sequence     \n------------------------------------------------------------\nBw                   3                    [2, 2, 2]           \nC]                   4                    [2, 2, 2, 2]        \nC^                   4                    [2, 2, 3, 3]        \nDLo                  5                    [2, 2, 2, 2, 2]     \n"}︡
︠49e59899-f170-44f7-a1aa-9189ea2aee62︠
g = Graph('C^'); plot(g, figsize=2)
︡e0bd738f-7655-4b76-8eaa-34619673c5e6︡{"once":false,"file":{"show":true,"uuid":"dd510c24-fdde-475f-98f6-f4576f7ed4fd","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/20148/tmp_fGjAZa.png"}}︡
︠ed237bbb-9cd1-4d6f-a701-111a8b57611b︠
Q = GraphQuery(display_cols=['graph6','num_vertices','aut_grp_size'], num_vertices=4, aut_grp_size=4)
Q.show()
︡07dcbb38-f551-493e-82fd-d362261f451e︡{"stdout":"Graph6               Num Vertices         Aut Grp Size        \n------------------------------------------------------------\nC@                   4                    4                   \nC^                   4                    4                   \n"}︡
︠9a70217b-2cbe-459a-8c51-8a569401b207︠
Graph('C@').plot()
︡fdd9eebc-43f1-4626-8fd2-fb3c1f9fa0ab︡{"once":false,"file":{"show":true,"uuid":"ae9cdc93-465b-4cdf-a62a-25dc9c493a5d","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/20148/tmp_zolCxb.png"}}︡
︠8d55aedb-76ff-4315-ac83-f0c799906750︠
Graph('C^').plot()
︡f75c0d54-3d0b-4ceb-98ec-3550b2b0d375︡{"once":false,"file":{"show":true,"uuid":"e64c8f5c-2d67-4d9e-bc24-f23f845fbaad","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/20148/tmp_tgvu5j.png"}}︡
︠55d0ee23-6571-4e72-9fe4-496fe7db10c7︠
for k in [1..9]:
    print k, GraphQuery(display_cols=['num_vertices'], num_vertices=k).number_of()
︡6cc26c28-0cba-4228-884a-175c84d77cda︡{"stdout":"1 1\n2 2\n3 4\n4 11\n5 34\n6 156\n7 1044\n8 0\n9 0\n"}︡
︠682eb94f-4f36-43ac-b4dc-2abb1f2a97a9︠

︠0926285b-2b24-4a73-9d69-ef703de70b98︠

︠6d7e96f1-83cf-46bf-bf79-e42eb0df5e5ai︠
%md
## Automorphisms, Subgraphs, Isomorphism
(Robert Miller)

Nauty and NICE.

Nauty: <http://pallini.di.uniroma1.it/>

The license is open source by GPL-incompatible: "nauty is copyright (1984-2014) Brendan McKay. All rights reserved. Traces is copyright (2008-2014) Adolfo Piperno. All rights reserved. Permission is hereby given for use and/or distribution with the exception of sale for profit or application with **nontrivial military significance**."

So no Nauty in Sage (or any other GPL'd software).

Hence: Robert Miller (spent years) writing "NICE", which is a Cython implementation from scratch of a similar algorithm.
︡f61eb3ac-e601-4aa0-b952-fce675771eb9︡{"html":"<h2>Automorphisms, Subgraphs, Isomorphism</h2>\n\n<p>(Robert Miller)</p>\n\n<p>Nauty and NICE.</p>\n\n<p>Nauty: <a href=\"http://pallini.di.uniroma1.it/\">http://pallini.di.uniroma1.it/</a></p>\n\n<p>The license is open source by GPL-incompatible: &#8220;nauty is copyright (1984-2014) Brendan McKay. All rights reserved. Traces is copyright (2008-2014) Adolfo Piperno. All rights reserved. Permission is hereby given for use and/or distribution with the exception of sale for profit or application with <strong>nontrivial military significance</strong>.&#8221;</p>\n\n<p>So no Nauty in Sage (or any other GPL&#8217;d software).</p>\n\n<p>Hence: Robert Miller (spent years) writing &#8220;NICE&#8221;, which is a Cython implementation from scratch of a similar algorithm.</p>\n"}︡
︠7e70b4a3-02eb-42f3-bef7-6452c2f5f7b3︠
set_random_seed(2)
g = graphs.RandomBoundedToleranceGraph(8)
︡a4b06306-65be-4033-971c-ed479e2204ea︡
︠1bd3a04a-7bc6-45aa-bf0f-a6cdb7d6eb9f︠
g.plot()
︡70683e59-35e7-4eb1-9595-3167f9f6d181︡{"once":false,"file":{"show":true,"uuid":"5288a76e-7fb5-48f8-9c01-5c6486cf4f6f","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/20148/tmp_K6KMvb.png"}}︡
︠4a00cfd2-9904-4180-a03a-0b17d7c589d2︠
S = g.automorphism_group(); S
︡2c229f40-1ce7-4b78-8860-cb2844beb075︡{"stdout":"Permutation Group with generators [(6,7), (4,5), (2,4)]\n"}︡
︠ab405f35-831b-4463-bfbe-34d087f183a2︠
S.cardinality()
︡01cee823-b2bf-43c3-bcd5-9ed75d260281︡{"stdout":"12\n"}︡
︠359e4dd3-b4ad-413c-8f53-44eb0c63e8a2︠
g.is_planar()
︡1ff4b9f6-f371-4418-9f77-b4ff96087363︡{"stdout":"False\n"}︡
︠7264ffba-fc3a-4281-8844-1ec069f65942︠

︠0024876f-8992-4215-80e1-d0a5f86d097fi︠
%md
## Enumerating Graphs

For example, a tree is a connected graph with no cycles.
︡9ba157fc-e58b-41ef-acf0-badda5a8a78a︡{"html":"<h2>Enumerating Graphs</h2>\n\n<p>For example, a tree is a connected graph with no cycles.</p>\n"}︡
︠a9bd1380-aab1-4d30-a10b-63f055acfef3︠
from sage.graphs.trees import TreeIterator
v = [plot(t) for t in TreeIterator(8)]
len(v)
graphics_array(v, 6,4)
︡3d472075-fdd7-4013-962a-62d715b3eb1c︡{"stdout":"23\n"}︡{"once":false,"file":{"show":true,"uuid":"9736a202-43c8-4dc9-87cc-32a55049362d","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/20148/tmp__cg_dY.png"}}︡
︠32bd96b4-8bff-41f0-96a3-abcca9a39bd6︠

︠2de94800-2831-40f8-b2fd-443331ec8312︠
%time
# How many trees with 17 vertices?  Let's enumerate them *all*...
count = 0
for t in TreeIterator(17):
   count += 1
print count
︡328c17fb-08fd-4962-88e6-c60f486ec485︡{"stdout":"48629\n"}︡{"stdout":"CPU time: 1.95 s, Wall time: 1.95 s\n"}︡
︠d60023fa-afef-43bb-b806-fc37f94f508c︠

︠b764fe2e-cb24-46c6-a1c0-5edb9e6690e5︠

︡5dc3e9e2-31d8-401d-9f8a-e3334b10657a︡
︠f9d7f4e2-0dfb-4f21-a1af-62b1d2bee238︠


︠ded1c2aa-1cd8-4667-bce1-41c7b7812d56︠

︠8c16e997-a2c6-49b0-8105-97d59ea18939︠













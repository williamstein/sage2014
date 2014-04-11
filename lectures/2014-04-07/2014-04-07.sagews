︠7a43cfb5-767c-4c43-ae73-e1eccb8f1a0dii︠
%md

# Math 480b -- Sage Course

## April 7, 2014

Screencast: <http://youtu.be/iWWHpafc4Lc>

**Plan**

- Questions?
- Homework 1 grading
- Python
   - data types: string, integer, list, tuple, dict
   - list comprehensions
   - functions
   - Python variables are references
   - putting code in files/modules and loading them

- NEXT: classes

︡d5ad5a7d-b686-474a-aa13-5fef6303e0b1︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>April 7, 2014</h2>\n\n<p>Screencast: REMEMBER TO START IT!!!! &lt;&gt;</p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li>Questions?</li>\n<li>Homework 1 grading</li>\n<li><p>Python</p>\n\n<ul>\n<li>data types: string, integer, list, tuple, dict</li>\n<li>list comprehensions</li>\n<li>functions</li>\n<li>Python variables are references</li>\n<li>putting code in files/modules and loading them</li>\n</ul></li>\n<li><p>NEXT: classes</p></li>\n</ul>\n"}︡
︠62c45189-9a96-470b-b3c2-af068153f543︠
2+3
︡95da632b-0452-4021-ba33-66be8749d8a2︡{"stdout":"5\n"}︡
︠86981535-21a2-402d-a3b9-3355c93df29d︠
graphs.RandomBipartite(5,5,0.5)
︡0df217f6-3d65-42c6-9214-93273278d164︡{"stdout":"Random bipartite graph of size 5+5 with edge probability 0.500000000000000: Graph on 10 vertices"}︡{"stdout":"\n"}︡
︠f2f3f33e-3f82-41e0-abfd-4dd17392df74︠
g = graphs.RandomRegular(4, 39, 1)
︡7d75c0be-737a-4aff-9006-340cb3aee381︡
︠0f558c7a-ab20-430b-9473-339f70d0898b︠
︠3d5a9503-b0fe-4a5b-b4bc-44a38d9da5c7︠
g.plot()
︡67187a5b-41e6-418b-85a3-da9f59b17e2e︡{"once":false,"file":{"show":true,"uuid":"f16ea36e-4996-4a8b-a0ed-e5e44205bc62","filename":"/projects/edf7b34d-8ef9-49ad-b83f-8fa4cde53380/.sage/temp/compute18a/11276/tmp_wEPeH4.png"}}︡
︠557e5c25-a7d2-4675-8296-6feea5a56af1︠
g = graphs.RandomRegular(3, 39)
︡f4b5f694-26c8-4f58-b2cd-89f4883d8a7a︡
︠5830319a-fb6d-4982-8fdf-3c7dd0999548︠
g
︡4e2db548-b21a-4324-b0de-1e2649504bc8︡{"stdout":"False\n"}︡
︠5ed8b44f-6431-49ac-90be-6dda746f83f7︠
2+3
︡9842dfb0-8d1f-4aed-a102-5fb195aa9e8f︡{"stdout":"5\n"}︡
︠55617e3d-e932-4eb1-95af-5c3060da6c6ci︠
%md
## Python - Data types -- str, int and long, float, list, tuple, dict, etc.
︡874b6dc8-8e78-4959-bbc2-1f607ddae63b︡{"html":"<h2>Python - Data types &#8211; str, int and long, float, list, tuple, dict, etc.</h2>\n"}︡
︠2a72581b-c29f-4b8d-b609-9f384df64766︠
s = "this is a string"
s
︡a7bef620-1aa6-49cd-9be3-eaca47780404︡{"stdout":"'this is a string'\n"}︡
︠e00deec3-c585-4865-b42f-a1f89d941d2a︠
s.capitalize
︡87141fcd-f1ae-430f-9fca-79173848fc45︡{"stdout":"<built-in method capitalize of str object at 0xa5088f0>\n"}︡
︠afb1445a-6954-4b0b-a6c5-f22007c884b8︠
s.capitalize()
︡87d6bcc9-6823-412e-8513-bd27c71518be︡{"stdout":"'This is a string'\n"}︡
︠fcd1fad5-02cd-4f0d-83db-259ef0230513︠
s[4] = 'x'
︡10997ad6-73b9-40cd-8eb2-ae8658fb01d7︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/edf7b34d-8ef9-49ad-b83f-8fa4cde53380/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nTypeError: 'str' object does not support item assignment\n"}︡
︠7491e68c-e109-4699-9230-d8326cd92d15︠
t = s[:4] + 'x' + s[5:]
t
︡892194ee-e1df-418e-b1fb-f263406c272e︡{"stdout":"'thisxis a string'\n"}︡
︠c02a5e2e-e37d-42d9-89f2-6ed4d15e5f0d︠
s
︡0d312032-1723-4804-be62-f6765f2e9314︡{"stdout":"'this is a string'\n"}︡
︠7d74cf90-1312-4e7b-8d62-20d6e623e7fa︠
id(s)
︡cc156d7e-da80-4312-a4b9-991b1101c2ea︡{"stdout":"173050096\n"}︡
︠f0350238-5a85-4639-9a0c-e1f11e8dbca9︠
id(t)
︡577a9a3b-efdb-4439-af12-83a04448e9e6︡{"stdout":"176298224\n"}︡
︠1ef1319e-ac26-4496-ba3e-9e8283d648cb︠
s.replace(' ', 'x')
︡f0818865-24b3-4ebf-ad13-1cbefa6fb849︡{"stdout":"'thisxisxaxstring'\n"}︡
︠06664d04-b9f8-4b3d-8ff6-382a48853c4d︠
'ng foo bar ngng'.strip('ng')
︡526a6a69-abe4-4d37-9545-345c584932dd︡{"stdout":"' foo bar '\n"}︡
︠581ed49f-a8f4-4708-8def-8a521ce81a44︠
'ng foo bar ngngnnnn'.strip('gn')
︡83f43d8c-7224-4ee2-b150-558b13b4fd1f︡{"stdout":"' foo bar '\n"}︡
︠3983d884-0684-4561-a699-751380992815︠
u'lkjdfjdn '
︡22449594-32ee-4bee-b19f-c35967de8e8c︡{"stdout":"u'lkjdfjdn '\n"}︡
︠bff04a5c-5f95-478b-ad4f-1f0dd01376aa︠
int
︡ece8b83e-a4d4-4d8f-97d9-a9f816725eb2︡{"stdout":"<type 'int'>\n"}︡
︠b3ead74e-8285-4d67-9541-d8e39cafed4f︠
a = int(938402340238402); b = int(982302384092)
type(a), type(b)
︡35073c30-060f-44ea-8437-364a24bce27f︡{"stdout":"(<type 'int'>, <type 'int'>)\n"}︡
︠4b0be033-e1e4-40d4-9311-0b70c530a64a︠
c = a*b
type(c)
︡f88331b1-4009-4a22-bd93-a063119fee7b︡{"stdout":"<type 'long'>\n"}︡
︠3eb4efe7-d1f0-4287-a7ec-2a68f403117a︠
c
︡8145c292-45b7-42bd-9f6d-65e51c788024︡{"stdout":"921794856053694428252300984L\n"}︡
︠15f9353d-32d8-4132-bcdc-48c52f096eb4︠
a/b
︡b29dccec-8682-4de6-a525-5ed3405b85ca︡{"stdout":"955\n"}︡
︠8cca0705-dd5a-45dc-95a5-5963d632429d︠
c_sage = Integer(c)
type(c_sage)
︡0e16e6df-d0c7-4f24-ac84-94949018b2ac︡{"stdout":"<type 'sage.rings.integer.Integer'>\n"}︡
︠68c4ec66-9be5-455c-803a-5fe804dd24da︠
c_sage.prime_factors()
︡2a6907d4-22b0-46fb-b7f8-bbbdaff63105︡{"stdout":"[2, 13, 61, 1049, 1901, 16063, 164767, 2117743]"}︡{"stdout":"\n"}︡
︠d80783e2-26cf-4435-920f-45b7edfa6fd8︠
n_int = int(1)
n_long = long(1)
n_sage = 1
n_pari = pari(1)
n_gap = gap(1)
n_singular = singular(1)
n_octave = octave(1)
n_r = r(1)
︡65b112f6-3b86-4dbc-9bf5-63ff4a3436a8︡
︠bb29c3ca-42c4-4e6a-8355-3f7932fba42d︠
n_int, n_long, n_sage, n_pari, n_gap, n_singular, n_octave, n_r
︡bf206e95-9e77-496c-b3e9-86e6f02181d3︡{"stdout":"(1, 1L, 1, 1, 1, 1,  1, [1] 1)\n"}︡
︠119dc2c6-921c-4163-be0f-200c08ed6698i︠
%md

- dictionaries
- list
︡4b2e74d0-ace7-4a57-bf9e-b9006d28df3e︡{"html":"<ul>\n<li>dictionaries</li>\n<li>list</li>\n</ul>\n"}︡
︠82d3c429-c2b3-492f-a6dc-03c374a03c61︠
d = {'this':3/5,   (2/5):[1,2,3],  'another_key':17}
︡5d75b476-d1d9-4c4e-8628-baf90a1cb59a︡
︠39d70403-c4eb-4860-a532-b5946571bbd4︠
type(d)
︡d19faf46-e156-4401-aae8-3501eec611cc︡{"stdout":"<type 'dict'>\n"}︡
︠2dc34a88-4eeb-4095-896c-597c1a8710d5︠
d['this']
︡cecb2771-fd27-4a20-b29b-9a88e7351e77︡{"stdout":"3/5\n"}︡
︠c882ca41-2e96-419c-8e67-e37f3bae5a23︠
d[2/5]
︡e39dcc57-e47f-402a-8d95-72e6bc66d264︡{"stdout":"[1, 2, 3]\n"}︡
︠5067057b-9beb-4437-9d0f-bb5b51b374e7︠
d['this'] = x^3 + sin(x)
d
︡3c206ef1-3066-45cf-bfa4-92bd29cc6926︡{"stdout":"{'this': x^3 + sin(x), 'another_key': 17, 2/5: [1, 2, 3]}\n"}︡
︠cf7d504f-abcf-4ba7-bd54-b3ca361fc000︠
for z in d:
    print z
︡0e18937b-954c-4822-a007-1146b026d8a8︡{"stdout":"this\nanother_key\n2/5\n"}︡
︠31ed6bd4-a710-49a2-947c-95620dc7cc20︠
d['this'](x=pi)
︡6fbaed86-2951-4eb3-8306-b2c4630dd81b︡{"stdout":"pi^3"}︡{"stdout":"\n"}︡
︠61eba545-81ad-4538-869b-76ad10a70ac6︠
v = [1,2,3,4,5]
w = dict([(n,True) for n in v])
w
︡acbe584c-b0dd-4689-9850-10692db42eb3︡{"stdout":"{1: True, 2: True, 3: True, 4: True, 5: True}\n"}︡
︠99392308-dc99-4a82-9654-7b809053854a︠
5 in v
︡77ca74bb-4931-44fe-bc43-ee736b0ae0d7︡{"stdout":"True\n"}︡
︠cb9e9820-d219-4c67-8edd-c5415285225f︠
5 in w
︡86e7efd4-82e2-4a49-8736-99fa3fe250d8︡{"stdout":"True\n"}︡
︠97828660-5f95-471f-9cdf-25d859a9f834︠
v = [1, 2, [3,4], {'a':5, 'the':2}]
type(v)
︡08951c40-9416-4052-9333-12ff4c6139b4︡{"stdout":"<type 'list'>\n"}︡
︠42df97be-0d62-4820-8d86-d9f7fb6a0ae5︠
v[4]
︡34934f20-9c43-4403-ae26-9fbec567f44d︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/edf7b34d-8ef9-49ad-b83f-8fa4cde53380/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nIndexError: list index out of range\n"}︡
︠c7f82259-f824-4d9b-a125-34732436efb6︠
v[2]
︡8008611d-2709-43f4-8240-80bb9a80be12︡{"stdout":"[3, 4]\n"}︡
︠22148ea2-6916-4d03-b181-e255ffd0090e︠
v[-1]
︡953f5c76-ffc6-436e-bdb9-5b13efeadaa3︡{"stdout":"{'a': 5, 'the': 2}\n"}︡
︠daba4b12-3a97-45a9-b945-e8510849786a︠
v[1:3]
︡7c1f3dee-e442-4986-944b-98c3be9bfa8f︡{"stdout":"[2, [3, 4]]\n"}︡
︠a557ed0e-31c4-41a4-80fe-d4c876686224︠
v
︡f31e0b72-65fb-4c98-9709-bf7f88260856︡{"stdout":"[1, 2, [3, 4], {'a': 5, 'the': 2}]\n"}︡
︠b888986e-d4dc-43ba-ad8b-5a5da58cd631︠
v[1] = 'two'
v
︡7d9a2c7c-32e3-49e3-8697-e271ad8d36ba︡{"stdout":"[1, 'two', [3, 4], {'a': 5, 'the': 2}]\n"}︡
︠c1d65144-8248-4567-99ee-ad8016af7d7e︠
v = [1, 2, [3,4], {'a':5, 'the':2}]
v
︡b6438481-346a-4248-8c91-44bd6ebd6ce8︡{"stdout":"[1, 2, [3, 4], {'a': 5, 'the': 2}]\n"}︡
︠05134698-c48d-4461-bae3-215487eefbc5︠
v2 = copy(v)
︡f8552868-b715-4e2c-b84b-74e355a0ced0︡
︠95ab2f94-eb8d-47c0-9f64-bf68df510703︠
v2[2][0] = 389
v2
︡875c7614-e984-418f-a0ac-96dd1e752ad9︡{"stdout":"[1, 2, [389, 4], {'a': 5, 'the': 2}]\n"}︡
︠2e2874ed-69bf-4742-bc7d-99ea4de31d58︠
v
︡b16fda14-973a-43f7-92d3-900b8b8ff3a0︡{"stdout":"[1, 2, [389, 4], {'a': 5, 'the': 2}]\n"}︡
︠3403e610-0fb0-47ab-b865-05a9da67edf9︠
v is v2
︡7860270f-21d8-4ec5-a8bf-8634bbfb982d︡{"stdout":"False\n"}︡
︠93c45c2a-71be-4827-995f-a4953b5f6db3︠
import copy
v2 = copy.deepcopy(v)
︡9761078e-0036-4baa-89cc-f17e49cea4dc︡
︠fd575675-f1aa-4843-9fe5-eec91f706153︠
v2[2][0] = 9830048284
v2
︡f2645188-1364-4081-aa9a-a9a9cfe9de96︡{"stdout":"[1, 2, [9830048284, 4], {'a': 5, 'the': 2}]\n"}︡
︠01fbd6d2-236d-44be-a0a0-c82b6784f7e2︠
v
︡1c400877-94cd-406c-8d47-4ccb54e3987e︡{"stdout":"[1, 2, [389, 4], {'a': 5, 'the': 2}]\n"}︡
︠8a231db9-5592-4ddd-98a1-ba0bc018f27b︠








︠0760fd33-658d-493c-88cd-250114bea116i︠
%md
## Python - Functions (again)
︡601acb4d-8251-4e23-9f13-18f8fad12f20︡{"html":"<h2>Python - Functions (again)</h2>\n"}︡
︠19a8606d-dada-4b87-995d-cf7e3172640c︠

︠c402afd7-33d4-4cda-9002-98a9537106cf︠

︠a4167923-2101-4fc5-8465-9f22795b867a︠

︠d72f6fa1-449a-4d25-bd36-5c6bc4858b63︠

︠92c520ba-13cd-4525-b567-b198ccc2b4c9︠

︠d085e312-fe02-4412-8bbb-b451eaa1d594i︠

%md
## Python - Variables are *references* !

There is a **major** difference between how the math-oriented programming languages (Matlab, Pari, Maple, etc.) work, and how most modern mainstream programming languages, such as Python, work.

︡aebcd9b7-cf2d-4ac8-a6f6-e9ea663366d7︡{"html":"<h2>Python - Variables are <em>references</em> !</h2>\n\n<p>There is a <strong>major</strong> difference between how the math-oriented programming languages (Matlab, Pari, Maple, etc.) work, and how most modern mainstream programming languages, such as Python, work.</p>\n"}︡
︠c8d27fd5-c08a-4585-b215-5e3b8f027173︠
octave = Octave()
︡9b197013-2f91-40d0-b8e0-91d7ad3bbe65︡
︠c8fba380-d194-4a41-956c-393a31f4dfb6︠
%octave
v = [3,4]; w = v; w(1)=2014
︡5869c620-6546-4831-b4b4-6ad6aa82f952︡{"stdout":"w =\n\n 2014 4\n\n"}︡
︠9c3ab193-6a7d-4a2f-9430-c3be4a0c9ff4︠
%octave
v
︡5712c9c5-b8eb-4d76-b217-c0942fa720b5︡{"stdout":"v =\n\n 3 4\n\n"}︡
︠b49560d6-fb82-4363-a43d-03cf2ec6d0c6︠
#python
v = [3,4]; w = v; w[0]=2014
w
︡f8e4ffcf-f6d9-451e-9822-041304ad409e︡{"stdout":"[2014, 4]\n"}︡
︠125f9bbe-dbfb-4a02-8d0f-c364eb70774a︠
v
︡b0ce9e2f-5bfb-4c5f-9df0-79bebcfb0293︡{"stdout":"[2014, 4]\n"}︡
︠c0e7b325-db16-4492-bfab-fe2c36a1c0bb︠
id(w)
id(v)
︡198d7145-0138-414c-a1ad-2d33834cc347︡{"stdout":"181256776\n"}︡{"stdout":"181256776\n"}︡
︠4f971f19-d2f9-4031-8bb4-b00431c5b9ae︠
w is v  # same object in memory
︡cbe5c877-e0fa-4ae2-99d8-0b1aba7f9c1c︡{"stdout":"True\n"}︡
︠013ba6b0-9d32-4220-9e99-ff5ea10d885f︠
w == v
︡49556393-885d-4352-99f6-c5c366159554︡{"stdout":"True\n"}︡
︠053d9e81-ae59-4437-a0ff-314e10627d93︠
v2 = copy(v)
v2
︡32dd220c-4fac-4363-9e54-73683115db90︡{"stdout":"[2014, 4]\n"}︡
︠479582e4-2419-4991-a268-2ccd81354965︠
v is v2
︡d13a5635-f55f-42f4-9ced-9929e9403004︡{"stdout":"False\n"}︡
︠003f5267-8130-49ea-b519-5094f5201984︠
v == v2
︡46fa3bac-c96b-4cce-ba6f-bb287500365c︡{"stdout":"True\n"}︡
︠12718f9f-ebd0-40eb-a6a1-3b5ec869d8b0︠

︠fa0bccd6-04c8-4d4b-895e-d1b4ab34e23fi︠

%md
## Putting code in files/modules and loading it

**WARNING:** The Sage preparser!

- import
- reload
- %load
︡acf381f7-6483-4abc-a40f-36f4c531e7c9︡{"html":"<h2>Putting code in files/modules and loading it</h2>\n\n<p><strong>WARNING:</strong> The Sage preparser!</p>\n\n<ul>\n<li>import</li>\n<li>reload</li>\n<li>%load</li>\n</ul>\n"}︡
︠44727bca-3e79-4f07-8b09-c134dc51a8b9︠
%default_mode python
︡bff4fede-f5f9-44e1-868b-bfd73840817b︡
︠b321b637-d503-4cb0-b720-52f3c0c28774︠
2/3
︡839c224e-8f3d-42ea-a8f8-3ae22550dd31︡{"stdout":"0\n"}︡
︠ee2e43dd-bbb1-41e3-84c5-6e0652609c95︠
3^8
︡bbc29bba-2ddd-4906-b797-db3e69d86c45︡{"stdout":"11\n"}︡
︠d5c5a7ba-1658-4bcf-b8bb-003528341deb︠
%default_mode sage
︡3d83d509-8c76-44a2-8508-979bc4579e76︡
︠404785a5-5698-4f3b-bc0b-8a49e357ecb5︠
2/3
︡5633dfde-ddaf-4438-9742-233aca1994f2︡{"stdout":"2/3\n"}︡
︠d559fe91-ac3f-4b8d-ac72-c173a46d187d︠
%python
2/3
︡81ec1888-66b7-41b2-8321-a8da1b5b6462︡{"stdout":"0\n"}︡
︠005a0a16-eb09-490b-ae43-6314cdd83309︠











︠4c59cc1b-400f-474c-84dc-84f19260e193i︠
%md

# Math 480b -- Sage Course

## April 4, 2014

Screencast: <http://youtu.be/T7aXPTQx3hI>

**Plan**

- Questions?
- Python
   - control structures: if/then/else
   - looping: while, for, range
   - data types: string, integer, list, tuple, dict
   - functions
   - Python variables are references
   - putting code in files/modules and loading them
- Homework 2

︡f3c751a3-bac5-4c18-9b56-dee3f1ccc54b︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>April 4, 2014</h2>\n\n<p>Screencast: <a href=\"http://youtu.be/T7aXPTQx3hI\">http://youtu.be/T7aXPTQx3hI</a></p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li>Questions?</li>\n<li>Python\n<ul>\n<li>control structures: if/then/else</li>\n<li>looping: while, for, range</li>\n<li>data types: string, integer, list, tuple, dict</li>\n<li>functions</li>\n<li>Python variables are references</li>\n<li>putting code in files/modules and loading them</li>\n</ul></li>\n<li>Homework 2</li>\n</ul>\n"}︡
︠948a5429-8324-4411-8880-dc21e7eae0f0︠
R.<x> = QQ[]
R
︡f0f38318-fe73-4fbc-ad20-60c42c43b4af︡{"stdout":"Univariate Polynomial Ring in x over Rational Field\n"}︡
︠9baff60b-1eaf-4e23-b9d0-bbede9613d8f︠
S.<y> = PolynomialRing(RR)
S
︡82cf1a27-ba12-422c-bc95-eb4bada35363︡{"stdout":"Univariate Polynomial Ring in y over Real Field with 53 bits of precision\n"}︡
︠d9dc5958-6ada-4770-b1cd-20dc356de2bf︠
3/5*y + y^5
︡bd9c17e8-bfb1-4fcb-87ef-1b757a81de3c︡{"stdout":"y^5 + 0.600000000000000*y\n"}︡
︠65192829-3835-411d-8ca0-5ce306ad0741︠
f = (x^3 - 1)*(x-6/7)^2*(x-5)
f
︡279e059a-8fab-4c74-b6fc-41fa31fb2419︡{"stdout":"x^6 - 47/7*x^5 + 456/49*x^4 - 229/49*x^3 + 47/7*x^2 - 456/49*x + 180/49\n"}︡
︠9ef00f0f-99ff-4984-8b15-3a65cb7c3b8c︠
v = f.roots()
type(v)
︡50b662bd-cf7b-4fac-908a-9432e8d69d12︡{"stdout":"<type 'list'>\n"}︡
︠893663ca-ffba-4a43-9477-6bf944d3d95d︠
v[0]
︡48ee55f7-d54e-47b9-801a-e7bdc6e336bd︡{"stdout":"(5, 1)\n"}︡
︠324640bb-4010-4596-b2bd-d50273631778︠
v[0][0]
︡fc29c4aa-568c-4378-b15b-8515492a07d1︡{"stdout":"5\n"}︡
︠8953a75b-d419-4297-af6f-5f25e64f4eef︠
v
︡eef45f92-4870-4054-a071-1ed4cd8d82f5︡{"stdout":"[(5, 1), (1, 1), (6/7, 2)]\n"}︡
︠2ee7e6e5-40f0-44e0-ab40-6203d6f948dd︠
for r in v:
 print "hi there"
 print r[0]

print "Hmm. I wonder what r is?"
print r
︡f2a415f7-83cc-4ac7-bcdf-80b22422416b︡{"stdout":"hi there\n5\nhi there\n1\nhi there\n6/7\n"}︡{"stdout":"Hmm. I wonder what r is?\n"}︡{"stdout":"(6/7, 2)\n"}︡
︠f863a2bd-12a8-46c5-9f1e-14805f684c8c︠
5/4
︡2e2b5995-8c82-4e5d-b08d-220114c86c0d︡{"stdout":"5/4\n"}︡
︠c241e283-649b-47f8-9215-40020f83ad58︠
5//4
︡b826b46f-d63d-49d2-901c-9608abcff6f7︡{"stdout":"1\n"}︡
︠e97872a6-7706-47ee-97b7-467d8d63b5e9︠
f
︡1d161bc1-ffe5-45ca-84af-9f328ce6d67e︡{"stdout":"x^6 - 47/7*x^5 + 456/49*x^4 - 229/49*x^3 + 47/7*x^2 - 456/49*x + 180/49\n"}︡
︠2b2b8b6d-27a2-4880-8b6d-48d522bf55c0︠
CC
︡2604851b-6f41-45fd-adab-fdc6031a8088︡{"stdout":"Complex Field with 53 bits of precision\n"}︡
︠f353538e-667e-41c2-9b46-93d10a7d3be3︠
ComplexField(200)
︡db7d02bd-8e33-4c3c-84c1-e0775bb27826︡{"stdout":"Complex Field with 200 bits of precision\n"}︡
︠f3f0a30c-16c4-450b-8b73-145d16379ca9︠
f.roots(ring=CC)
︡7a2b7d88-a985-4603-9224-09d552793a3e︡{"stdout":"[(1.00000000000000, 1), (5.00000000000000, 1), (-0.500000000000000 - 0.866025403784439*I, 1), (-0.500000000000000 + 0.866025403784439*I, 1), (0.857142857142856 - 1.70882477893134e-8*I, 1), (0.857142857142856 + 1.70882477893134e-8*I, 1)]\n"}︡
︠62bab813-306c-4720-9a31-d55b57805346︠
 a = 5
 b = 7
 a+b
 3

︡4339263c-c261-4576-8542-f8dfd3ef4e88︡
︠d3eb75b8-c274-4ce0-8286-f286d99bad2b︠
b
︡c0ee5a52-9a55-4b42-ba6c-b0b5d7b6da06︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/edf7b34d-8ef9-49ad-b83f-8fa4cde53380/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nNameError: name 'b' is not defined\n"}︡
︠2c3a0435-b49f-46a8-8099-af4ef76f4e1b︠
def f(n,m):
    return n+m
︡3122bd15-e7ab-4507-bac6-cddc85d9fbe4︡
︠ccdd4011-3a26-4393-849b-1fe9002f1bcd︠
f(2,5)
︡3486887b-3b86-4e9d-9698-f6358b46615a︡{"stdout":"10\n"}︡
︠78b6e804-9f07-4cfb-9879-5f3f48837dc0︠

︠69e172f8-ba55-439c-975a-42165862b852i︠
%md
## Python - Control Structures: if/then/else

︡5a2db317-1255-4e5d-b269-7d1324eb8dd0︡{"html":"<h2>Python - Control Structures: if/then/else</h2>\n"}︡
︠4dce845b-e327-4f0b-9919-39d2f4b6a8fa︠
# come up with examples here
︡ff286872-0b8d-4d38-afb8-96b83072570a︡
︠82b7a4ac-5d14-48e8-a0eb-92bc5a0f2b0f︠
if "":

if "false":

︠2d46cf6b-fc79-41b4-9f6a-ca0d00a00f67︠
if 2 == 1+10:
    print "good"

elif 3 == 1+2:
    print "yes"
else:
    print "very bad"
︡a4240e61-2751-480f-a913-97955d2c0453︡{"stdout":"very bad\n"}︡
︠3df20482-184f-445b-9a59-5e925bfe5ebf︠
# like "?:"

a = "good" if 2==1+1 else "bad"
a
︡50d4d854-4c1e-499d-a842-6adbcb04f5cc︡{"stdout":"'good'\n"}︡
︠68ed8fab-a292-4ae8-9a10-905d8446b4a7︠
a = "good" if 2==5+1 else "bad"
a
︡b1876f98-6a3f-44c8-a9e0-3f57c296a10d︡{"stdout":"'bad'\n"}︡
︠1bd86f99-aa81-4a30-94a6-f41736608836︠

︠42b219c6-08f1-4f9e-a2cd-85beb2aaa6bci︠
%md
## Python - Looping -- while, for, range
︡a276a750-24b7-4417-9403-1a8ef8f51582︡{"html":"<h2>Python - Looping &#8211; while, for, range</h2>\n"}︡
︠b0b39fca-abb3-4736-a07d-f73cf5357b89︠
range(5)
︡b7d736bf-6320-4911-a3a6-470cfc3c9505︡{"stdout":"[0, 1, 2, 3, 4]\n"}︡
︠d3060aeb-a47c-4a91-8963-a5ee46b206ef︠
for n in range(5):
    print n
︡f6f4c155-4bec-44ea-ae1d-1f642fb5ce7a︡{"stdout":"0\n1\n2\n3\n4\n"}︡
︠7b9c2bb2-a267-4ebf-aa32-68f901e002d1︠
for n in range(10^8):   # scary
    print n
    if n > 5:
        break
︠8396e12e-17a7-48c0-a190-887e841d5481︠
for n in xrange(10^8):   # good
    print n
    if n > 5:
        break
︡5bb376ce-663d-474e-b9c9-548adf53daff︡{"stdout":"0\n1\n2\n3\n4\n5\n6\n"}︡
︠87468863-4b00-4318-b0f2-66e5a7c63dc3︠
v = ['william', 'simon', pi, e, sin(x)]
v
︡f140dc12-b9ba-4850-8ec1-6e82904d64f1︡{"stdout":"['william', 'simon', pi, e, sin(x)]\n"}︡
︠87f66059-d0f6-4738-92f2-34846e2908ff︠
for z in v:
    print 2*z, z + z
︡5eeccb85-3853-409f-bb4d-938207f9276d︡{"stdout":"williamwilliam williamwilliam\nsimonsimon simonsimon\n2*pi 2*pi\n2*e 2*e\n2*sin(x) 2*sin(x)\n"}︡
︠6348d8a4-4535-4bde-820b-a0980d755955︠
a = "simon"; b = "william"
a + b
b + a
︡09ca75c7-92ab-4a36-af2d-7b9a9228c096︡{"stdout":"'simonwilliam'\n"}︡{"stdout":"'williamsimon'\n"}︡
︠6981c640-31fc-48eb-961d-113ddcf24fba︠
a*b   # this should be concat; sigh...
︡c54c3924-8925-49a3-9cee-eb735f6e7080︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/edf7b34d-8ef9-49ad-b83f-8fa4cde53380/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nTypeError: can't multiply sequence by non-int of type 'str'\n"}︡
︠d6286ff8-0a29-4424-a6c9-142dba01052d︠
a = 10
while a > 3:
    print a^5
    a = a - 2
︡28aa9a4d-f282-4866-b8c0-a9b7da77fbd5︡{"stdout":"100000\n32768\n7776\n1024\n"}︡
︠fa3f9bcc-d55a-4925-9aac-8b7e12dd4055︠

︠c717849a-303a-4493-8fa4-34179dff4b50︠

︠278f0318-b448-44b8-b219-063fff64febei︠
%md
## Python - Data types -- str, int and long, float, list, tuple, dict, etc.
︡874b6dc8-8e78-4959-bbc2-1f607ddae63b︡{"html":"<h2>Python - Data types &#8211; str, int and long, float, list, tuple, dict, etc.</h2>\n"}︡
︠7d74cf90-1312-4e7b-8d62-20d6e623e7fa︠

︠f0350238-5a85-4639-9a0c-e1f11e8dbca9︠

︠daba4b12-3a97-45a9-b945-e8510849786a︠

︠0760fd33-658d-493c-88cd-250114bea116i︠
%md
## Python - Functions (again)
︡601acb4d-8251-4e23-9f13-18f8fad12f20︡{"html":"<h2>Python - Functions (again)</h2>\n"}︡
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
︡c1889ec1-6b89-4e1f-8e0c-92a2adba3ea5︡{"stdout":"[2014, 4]\n"}︡
︠125f9bbe-dbfb-4a02-8d0f-c364eb70774a︠
v
︡dba88fef-5414-465d-90bd-99d49286629d︡{"stdout":"[2014, 4]\n"}︡
︠479582e4-2419-4991-a268-2ccd81354965︠

︠003f5267-8130-49ea-b519-5094f5201984︠

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










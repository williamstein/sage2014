︠c61aaac9-f970-4bd1-96f0-d91a5438f58ai︠
%md

# Math 480b -- Sage Course

## April 11, 2014

Screencast: <http://youtu.be/ErzCuqsYq1E>

**Plan**

- Questions?

- SageMathCloud status update

- Reminder
   - homework due at 6pm tonight
   - grading due at 6pm tonight

- Python
   - functions; tuple (un-)packing
   - putting code in files/modules and loading them
   - classes: creating your own data types
︡2a2c7e1e-8e10-4e70-9848-204a22962a6a︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>April 11, 2014</h2>\n\n<p>Screencast: <a href=\"http://youtu.be/ErzCuqsYq1E\">http://youtu.be/ErzCuqsYq1E</a></p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions?</p></li>\n<li><p>SageMathCloud status update</p></li>\n<li><p>Reminder</p>\n\n<ul>\n<li>homework due at 6pm tonight</li>\n<li>grading due at 6pm tonight</li>\n</ul></li>\n<li><p>Python</p>\n\n<ul>\n<li>functions; tuple (un-)packing</li>\n<li>putting code in files/modules and loading them</li>\n<li>classes: creating your own data types</li>\n</ul></li>\n</ul>\n"}︡
︠dd431991-4b89-4cb0-8486-e3b1604c8485︠
import os
os.listdir('.')
︡21fb7d0c-70ed-4c8e-84d4-9e78961321e5︡{"stdout":"['..2014-04-11.sagews.sage-chat.sage-backup', '2014-04-11.sagews', '.2014-04-11.sagews.sage-chat']\n"}︡
︠e83c260f-82f0-436e-9c31-2f372d748384︠
os.listdir('..')
︡808b6afa-31ef-44e9-83b7-6cd8524cd196︡{"stdout":"['2014-04-09', '2014-04-04', '2014-03-31', '2014-04-07', 'videos.md', '.videos.md.sage-chat', '2014-04-02', '2014-04-11']\n"}︡
︠4f761af1-6068-4bb8-a88c-5cc9f564c7c6︠
import shutil
︡0b4f538a-c30a-4619-9ed3-f18b4779558c︡
︠9fb7882f-3e14-4d50-8b32-4bfe069642f1︠
shutil.[tab key]
︠081ee6eb-98ad-4bb7-990c-4398f8b528cf︠
os.unlink  # remove a file
︠9aad8409-3547-43db-a20e-68cf79aee3fa︠
help(shutil)
︠196f1605-79ad-4b48-a388-19f3863f3575︠
os.makedirs('foobar')
︡5f80b949-a1e5-4fdc-b87b-273c84ebf71b︡
︠12c66d76-d6b0-4592-9de4-6d11f63f25da︠
os.listdir('.')
︡28bbd69c-4145-4ad2-befc-043d767eb2a1︡{"stdout":"['..2014-04-11.sagews.sage-chat.sage-backup', '2014-04-11.sagews', 'foobar', '.2014-04-11.sagews.sage-chat']\n"}︡
︠e91e0703-5632-40e5-89b9-cf8ce0a7ee4e︠
os.makedirs('foobar')
︡6a3a272b-2bef-4dfb-8aa3-831aaf83414a︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/usr/local/sage/sage-6.2/local/lib/python/os.py\", line 157, in makedirs\n    mkdir(name, mode)\nOSError: [Errno 17] File exists: 'foobar'\n"}︡
︠1bd9eeb8-3b50-48ba-8598-b76ffb901289︠
try:
    os.makedirs('foobar')
except:
    print "skipping it"
︡b4b43831-f408-4ee5-a129-af832deeb17c︡{"stdout":"skipping it\n"}︡
︠8291432b-d840-4965-8f06-7c8d18200ce2︠

︠694cef05-4a30-4b6b-baad-3776a2008d6ei︠
%md
## SageMathCloud -- status update

 - Yesterday I made a major backend rewrite live; it was months in the works.
 - SMC is faster and **much more** robust now.
 - Fixed issue that resulting in some projects being temporarily lost yesterday as a result of the migration.
 - I set all the projects for students in this course to never timeout.
︡88180576-8d3e-499a-890c-132d3fa41f04︡{"html":"<h2>SageMathCloud &#8211; status update</h2>\n\n<ul>\n<li>Yesterday I made a major backend rewrite live; it was months in the works.</li>\n<li>SMC is faster and <strong>much more</strong> robust now.</li>\n<li>Fixed issue that resulting in some projects being temporarily lost yesterday as a result of the migration.</li>\n<li>I set all the projects for students in this course to never timeout.</li>\n</ul>\n"}︡
︠cf354e01-7bee-4cca-8107-219f71c78884︠

︠c019bb97-3ed1-4285-881a-79e6cc213cc2︠

︠67f61963-113b-4e91-aa10-bc2525012f29︠

︠63df3482-bece-4319-abb7-b78c61d2eaff︠

︠8c3fdb2b-579f-4037-99f4-6110ba1b0481︠

︠7393046f-8813-49bc-9369-d05180d4f15fi︠
%md
## Functions

- quick review of defining functions
- variable number of arguments or keywords
- returning multiple values and tuple (un-)packing
︡b3f2cdbb-3c2a-4273-a8d1-8c1a43535999︡{"html":"<h2>Functions</h2>\n\n<ul>\n<li>quick review of defining functions</li>\n<li>variable number of arguments or keywords</li>\n<li>returning multiple values and tuple (un-)packing</li>\n</ul>\n"}︡
︠b47c541a-0707-476f-90d7-777ce9f1cbc0︠
def foo(a, b=4):
    def g(c):
        return c*c
    if a:
        print "a is true"
    return g(a*b)
︡55361aea-a90d-4740-b9fc-7d406141391b︡
︠916b65b0-bbf9-4962-8702-7dc8e2a7018b︠
foo(5)
︡465a90ff-1011-49f3-a0e5-3cdeb4fa51d3︡{"stdout":"a is true\n400\n"}︡
︠a3a50f1a-ccfb-40cc-819d-130aaafb72ca︠
g(40)
︡db775950-7e25-4438-bf35-91434798098b︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nNameError: name 'g' is not defined\n"}︡
︠d11d1a02-24cb-4034-94ca-66c11198dae2︠
def multiplier(n):
    """This is a docstring"""
    def f(x):
        return x*n
    return f
︡eb3f549d-544d-42bf-9af9-e67fe7780fb8︡
︠e5c827f4-3041-434d-80de-69ec8f456be1︠
m = multiplier(17)
m
︡2cd0f447-4ca1-4f0b-b65e-3bc6477085c8︡{"stdout":"<function f at 0x85ae578>\n"}︡
︠01a54fce-24aa-472c-ba81-f3ee158ba9a2︠
m(3)
︡30571259-e1d1-41f6-857c-f87c7c1797e1︡{"stdout":"51\n"}︡
︠74c1cfc1-c661-48c2-9439-4cd3e776ac95︠
multiplier.func_doc
︡241dbfa4-30a3-4d48-b490-71432a0ecb9b︡{"stdout":"'This is a docstring'\n"}︡
︠1739789a-2628-496b-b7d5-843a6814b5cb︠
# variable number of arguments
︡b9b74e3d-6127-4b08-a74e-ce429629269d︡
︠6883bf46-f436-4b6e-8132-762853486127︠
prod(3,4,5)
︡a767e349-bcca-47fd-8fd4-06e117d2ccd8︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"misc_c.pyx\", line 131, in sage.misc.misc_c.prod (sage/misc/misc_c.c:1584)\n  File \"misc_c.pyx\", line 211, in sage.misc.misc_c.iterator_prod (sage/misc/misc_c.c:1987)\nTypeError: 'sage.rings.integer.Integer' object is not iterable\n"}︡
︠366c25ac-d294-4b38-9b2f-cc89fcbb1e06︠
def my_prod(a, b, *args, **kwds):
    print a, b, args, kwds
    return prod(args)
︡6989834c-6939-42e7-b7db-4a9112589219︡
︠6758d36c-e922-405c-ac6e-5fc99de03338︠
my_prod(3,4,5, 10, 18, xyz=56, abc='hi')
︡3c4647a7-3c0f-4171-8c00-5cfafa29340e︡{"stdout":"3 4 (5, 10, 18) {'xyz': 56, 'abc': 'hi'}\n900\n"}︡
︠a1fe2d12-c8e4-444e-bb93-65d9df655386︠
args = (7,5,6,8)
kwds = {'this':'that'}

my_prod(0, *args, **kwds)
︡f651af56-c4d7-4e5d-ada2-03896e1012d6︡{"stdout":"0 7 (5, 6, 8) {'this': 'that'}\n240\n"}︡
︠5ff12790-1e2f-4141-bc97-4d07e5376e66︠
# returning multiple values
# short answer: CAN'T
︠f9e61342-3cc6-49b0-ac50-f4ad0aaf8575︠
def powers(n):
    return n^2, n^3, n^4
︡6907e247-1ac7-45df-a304-84e141c6e51a︡
︠30ce3b65-24b6-40a3-8fb1-821b9a66c765︠
powers(5)
︡796e716d-5793-4edc-9ad6-b1c498fb1319︡{"stdout":"(25, 125, 625)\n"}︡
︠950f106c-798e-4745-8c2e-881dbfe5b83c︠
a, b, c = powers(5)
print  "a=%s, b=%s, c=%s"%(a,b,c)
︡3eac2aff-e131-4380-a5f5-9d8e1e4c4467︡{"stdout":"a=25, b=125, c=625\n"}︡
︠b986f612-317b-44d3-a289-c771da14f4ce︠
(a, b, c) = (25, 125, 625)
︡612d0e0b-6bb9-44e2-b1a5-40265b9d4bcf︡
︠722d25cb-fd7f-438b-9dc2-c8f25336cdb3︠
a,b,c
︡6434b547-14c6-435c-acef-a7ad8e847a91︡{"stdout":"(25, 125, 625)\n"}︡
︠c2a85cc8-91a7-4c13-a756-8d39aee3e2ee︠
x = powers(5)
x
︡c13f8f25-7841-4dd3-a344-bcee5593fd6f︡{"stdout":"(25, 125, 625)\n"}︡
︠d754312e-d9e9-4216-b1c0-5ab07fb38617︠
v = [powers(2), powers(3), powers(5), powers(7)]
v
︡d2312c19-cbe2-4eb4-8510-4938d4473e4b︡{"stdout":"[(4, 8, 16), (9, 27, 81), (25, 125, 625), (49, 343, 2401)]\n"}︡
︠6344e445-2f79-4d0a-b6f4-4506dab6d845︠
for a,b,c in v:
    print a+b+c
︡73d06bea-64b5-4271-8666-6a3edf13d8e0︡{"stdout":"28\n117\n775\n2793\n"}︡
︠0359d262-1dd5-483b-b5e1-7f0ba5b56f01︠
for a in v:
    print a
︡1d15ae5a-ffbd-43f7-94da-8416f30f1757︡{"stdout":"(4, 8, 16)\n(9, 27, 81)\n(25, 125, 625)\n(49, 343, 2401)\n"}︡
︠45efc33b-5644-44ce-93ae-b95d44c89f5f︠
for a,b in v:
    print a,b
︡c1ae8bb2-89da-4089-be16-8ec0ed87ebcb︡{"stderr":"Error in lines 1-2\nTraceback (most recent call last):\n  File \"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nValueError: too many values to unpack\n"}︡
︠c79b94bf-cabe-4bcd-8101-69f08d440c2a︠

︠91b73a27-9087-457d-bded-4dea8f7e3a6di︠
%md
## Putting code into files

- creating and running a .sage file  (note: %runfile on command line versus %load in worksheet)
- creating, importing, reloading a .py Python module
- installing python code from pypi: <pypi.python.org>
   - see <https://github.com/sagemath/cloud/wiki/FAQ#-question-i-found-an-awesome-python-package-at-httpspypipythonorgpypi-and-i-want-to-use-it>
︡daf25f35-fe53-459b-bfc4-21fe738a90c9︡{"html":"<h2>Putting code into files</h2>\n\n<ul>\n<li>creating and running a .sage file  (note: %runfile on command line versus %load in worksheet)</li>\n<li>creating, importing, reloading a .py Python module</li>\n<li>installing python code from pypi: <pypi.python.org> <br />\n<ul>\n<li>see <a href=\"https://github.com/sagemath/cloud/wiki/FAQ#-question-i-found-an-awesome-python-package-at-httpspypipythonorgpypi-and-i-want-to-use-it\">https://github.com/sagemath/cloud/wiki/FAQ#-question-i-found-an-awesome-python-package-at-httpspypipythonorgpypi-and-i-want-to-use-it</a></li>\n</ul></li>\n</ul>\n"}︡
︠c770096f-fe07-4112-acd3-8a1ab9e58795︠
%load test.sage
︡8136954a-2d2e-4009-9b9d-69e26c237232︡
︠687a8dec-327c-458e-966c-caf8c53d946c︠
my_prod(2,3,4)
︡81dc231c-1ec4-4436-bfe6-f8d56018c330︡{"stdout":"24\n"}︡
︠c929682f-b7e2-423b-ba69-c9d73db319b5︠
my_prod?
︡25cb600f-5d9d-47da-9310-744308ccaee3︡{"stdout":"   File: /projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/sage2014/lectures/2014-04-11/<string>\n   Docstring:\n      This is my_prod in another file...\n"}︡{"stdout":"\n"}︡
︠dae9d178-b702-4261-bd0b-fb1d5fa13e51︠
%load test.sage
︡c5e69069-36cf-4d6d-802b-ab7ae24081c5︡
︠0a19f203-1dad-4e6c-87da-f951163915b2︠
my_data
︡eb5d7973-f24d-4bee-b78a-9fb5242258af︡{"stdout":"[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]\n"}︡
︠f65b1f0c-9e16-47f2-9048-d552f9c9e23a︠
preparse('my_data = [n^2 for n in range(10)]')
︡70148807-aca7-4eb5-bb8a-0638767c74d0︡{"stdout":"'my_data = [n**Integer(2) for n in range(Integer(10))]'\n"}︡
︠3f26dd42-32b1-42ef-a3ec-bea6fa7c0554︠
sys.path.append('.')   # so we can import python code in cur dir
︡73becf91-f212-46ae-9e6a-30351fe78bbf︡
︠b0502e6c-c84a-4382-945c-b56b4babf749︠

︠156eae4b-e467-40e0-ae93-82a267cd23ac︠
import test2
︡6bf2c816-95ec-40c0-8122-801df508aa25︡
︠08aadfbd-5f6f-4c0a-a40c-bea101444950︠
test2.my_data
︡82a9cc53-93e0-4c2a-83cb-eedc1e6e11da︡{"stdout":"[2, 3, 0, 1, 6, 7, 4, 5, 10, 11]\n"}︡
︠c3e8dee5-00be-4a03-91b2-32cb3387fd8d︠
test2.my_prod(3,4,5)
︡0cc5972f-2d21-4e46-8b5c-6c266d66a91a︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"./test2.py\", line 5, in my_prod\n    This is my_prod in another file...\nNameError: global name 'prod' is not defined\n"}︡
︠aad6d20c-1093-4a2f-a6c8-9537f6b4754c︠
reload(test2)
︡1e13ccff-1be4-441c-9cb9-009fea412208︡{"stdout":"<module 'test2' from './test2.py'>\n"}︡
︠96e9058c-d3c8-4d5c-bfd2-82ba2788f3b9︠
test2.my_data
︡8cd6c166-93e5-4ad3-90e0-1c6df1ada585︡{"stdout":"[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]\n"}︡
︠19c56feb-c350-45a3-96c4-b4085d7505eb︠
test2.my_prod(3,4,5)

︡15983d38-e8f1-426b-9f0b-9f4573a33b98︡{"stdout":"60\n"}︡
︠88acf9f0-3d78-474b-9ef3-a20fde1ee57a︠

︠66695c75-a44f-4a11-aad0-d72a0f0932b5i︠
%md
## Python classes: creating your own data types
︡fbbe8aed-9a22-4f42-9bbd-5aa429a20824︡{"html":"<h2>Python classes: creating your own data types</h2>\n"}︡
︠2917c64b-9756-425f-91cc-6c72bc931180︠
class MyNumber:
    def __init__(self, value):
        self._value = value

    def __repr__(self):
        return "My number %s"%self._value

    def __add__(self, other):
        return MyNumber(self._value - other._value)
︡74c2da48-30ef-4117-b293-4cca0cc6f9e5︡
︠7558bc46-f333-4208-8bbb-5c0850c7bb94︠
a = MyNumber(45)
a
︡19411027-42c7-4cfb-a503-60ff368e035b︡{"stdout":"My number 45\n"}︡
︠5abd47cf-10f0-449f-8c0d-5efc556427e3︠
type(a)
︡0b0f8de4-e0fa-4fcf-bda1-42ea3d48bbe4︡{"stdout":"<type 'instance'>\n"}︡
︠4dba5e29-9ff1-4146-ad5f-18eeca9ec0d7︠
b = MyNumber(17)
︡8d9a5ef6-061d-401b-9c72-39ae093aeae7︡
︠2bd82a6a-e997-40d8-a2bd-68fdd21723fb︠
b
︡124fa87d-a5ca-4595-a75a-063cb4191529︡{"stdout":"My number 17\n"}︡
︠dc50ae93-f6fc-4233-ab72-a1fd9cb3ebbb︠
a + b
︡68edbcd8-5f6b-4e34-800a-18f11334c771︡{"stdout":"My number 28\n"}︡










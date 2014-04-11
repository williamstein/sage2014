︠c61aaac9-f970-4bd1-96f0-d91a5438f58ai︠
%md

# Math 480b -- Sage Course

## April 11, 2014

Screencast: REMEMBER!!!!!

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
︡24db9669-2a1d-4e1d-83c2-4953ef682e6e︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>April 11, 2014</h2>\n\n<p>Screencast: REMEMBER!!!!!</p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions?</p></li>\n<li><p>SageMathCloud status update</p></li>\n<li><p>Reminder</p>\n\n<ul>\n<li>homework due at 6pm tonight</li>\n<li>grading due at 6pm tonight</li>\n</ul></li>\n<li><p>Python</p>\n\n<ul>\n<li>functions; tuple (un-)packing</li>\n<li>putting code in files/modules and loading them</li>\n<li>classes: creating your own data types</li>\n</ul></li>\n</ul>\n"}︡
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

︠a3a50f1a-ccfb-40cc-819d-130aaafb72ca︠

︠e5c827f4-3041-434d-80de-69ec8f456be1︠

︠01a54fce-24aa-472c-ba81-f3ee158ba9a2︠

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

︠687a8dec-327c-458e-966c-caf8c53d946c︠

︠dae9d178-b702-4261-bd0b-fb1d5fa13e51︠

︠0a19f203-1dad-4e6c-87da-f951163915b2︠

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










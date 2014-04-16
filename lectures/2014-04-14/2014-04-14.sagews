︠c61aaac9-f970-4bd1-96f0-d91a5438f58ai︠
%md

# Math 480b -- Sage Course

## April 14, 2014

Screencast: <http://youtu.be/fualtE_GcuY>

**Plan**

- Questions?

- Homework discussion:
    - You'll find a folder grading/homework2 in your project.  Grade the *three* assignments.
    - You'll find a new assignment in homework3/
    - We've collected the homework you graded and are looking at it.

- Python
   - exception handling: try/except/finally
   - classes: creating your own data types
   - decorators

︡963082ab-5232-480f-b17f-27d93a7d6ddb︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>April 14, 2014</h2>\n\n<p>Screencast: <a href=\"http://youtu.be/fualtE_GcuY\">http://youtu.be/fualtE_GcuY</a></p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions?</p></li>\n<li><p>Homework discussion:</p>\n\n<ul>\n<li>You&#8217;ll find a folder grading/homework2 in your project.  Grade the <em>three</em> assignments.</li>\n<li>You&#8217;ll find a new assignment in homework3/</li>\n<li>We&#8217;ve collected the homework you graded and are looking at it.</li>\n</ul></li>\n<li><p>Python</p>\n\n<ul>\n<li>exception handling: try/except/finally</li>\n<li>classes: creating your own data types</li>\n<li>decorators</li>\n</ul></li>\n</ul>\n"}︡
︠4c422b59-aa2e-4e9d-b7db-028210f69128︠
points([(1,2), (3,4)])
︡edf16916-1e2a-4850-8e2e-67f726dedf46︡{"once":false,"file":{"show":true,"uuid":"061f7741-a015-481e-8857-a34ca7144fec","filename":"/projects/edf7b34d-8ef9-49ad-b83f-8fa4cde53380/.sage/temp/compute3dc1/4309/tmp_W_3hLv.png"}}︡
︠10c0193d-5d52-46cf-b43f-0e47d3390dee︠

︠e4a10906-f550-45dc-9ac7-979c9c9b33adi︠
%md
## Exception Handling

try/except/finally
︡c52ca1f5-1206-46c4-be75-c82e41642b25︡{"html":"<h2>Exception Handling</h2>\n\n<p>try/except/finally</p>\n"}︡
︠8a5a5cb9-3fe8-4430-9f18-5c4b5a20c620︠
try:
    a = 2 + 2
    b = 3/4
    c = 0
    d = a/c
    print "nothing bad happened"
except:   # naked exceptionn
    print "something bad happened"
finally:
    print "clean stuff up"


︡c3308010-ff5a-4e41-ab88-92af74812e08︡{"stdout":"something bad happened\nclean stuff up\n"}︡
︠dd431991-4b89-4cb0-8486-e3b1604c8485︠
a
b
c
d
︡a556131a-c039-4aa5-b43e-22473ac444b0︡{"stdout":"4\n"}︡{"stdout":"3/4\n"}︡{"stdout":"0\n"}︡{"stderr":"Error in lines 4-4\nTraceback (most recent call last):\n  File \"/projects/edf7b34d-8ef9-49ad-b83f-8fa4cde53380/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nNameError: name 'd' is not defined\n"}︡
︠57eb3afe-bcac-400e-84d6-0db8a1757b6d︠
1/0/0
︡08b8fac0-b1cf-405b-8c48-3197de183bc0︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/edf7b34d-8ef9-49ad-b83f-8fa4cde53380/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"element.pyx\", line 1811, in sage.structure.element.RingElement.__div__ (sage/structure/element.c:15184)\n  File \"integer.pyx\", line 1797, in sage.rings.integer.Integer._div_ (sage/rings/integer.c:13165)\n  File \"integer_ring.pyx\", line 430, in sage.rings.integer_ring.IntegerRing_class._div (sage/rings/integer_ring.c:5780)\nZeroDivisionError: Rational division by zero\n"}︡
︡08b8fac0-b1cf-405b-8c48-3197de183bc0︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/edf7b34d-8ef9-49ad-b83f-8fa4cde53380/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"element.pyx\", line 1811, in sage.structure.element.RingElement.__div__ (sage/structure/element.c:15184)\n  File \"integer.pyx\", line 1797, in sage.rings.integer.Integer._div_ (sage/rings/integer.c:13165)\n  File \"integer_ring.pyx\", line 430, in sage.rings.integer_ring.IntegerRing_class._div (sage/rings/integer_ring.c:5780)\nZeroDivisionError: Rational division by zero\n"}︡
︠454fe346-958f-4282-b913-ed755f69a2dd︠
prod = 5

prod([1,2,3])
︡0a4c68f7-9e04-4266-ac8a-fe11d5e2c428︡{"stderr":"Error in lines 2-2\nTraceback (most recent call last):\n  File \"/projects/edf7b34d-8ef9-49ad-b83f-8fa4cde53380/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nTypeError: 'sage.rings.integer.Integer' object is not callable\n"}︡
︠12adad53-8235-44c6-801e-7811d457a161︠
reset('prod')
prod([1,2,3])
︡8a01a872-9091-4d7d-b38b-ce138b1e988f︡{"stdout":"6\n"}︡
︠7960dd9a-1488-4b23-b04d-57e54f712547︠
reset('NameError')

NameError
︡a59250d6-313c-4df7-a109-fdbee39c184b︡{"stdout":"<type 'exceptions.NameError'>\n"}︡
︠b509b2aa-2b24-4588-9497-4e395efe3e6a︠

try:
    a = 2 + 2
    b = 3/4
    c = 0   + fubar
    d = a/c
    print "nothing bad happened"
except ZeroDivisionError, msg:
    print "somebody divided by 0: %s"%msg
except (ZeroDivisionError, NameError, ValueError), msg:
    print "somebody divided by 0 or ..."
    print "somebody used a variable that isn't defined"
    print "or something else..."
finally:
    print "clean stuff up"
︡06278d8b-a9dd-4c0e-817e-3fb9edf4b9dd︡{"stdout":"clean stuff up\n"}︡{"stderr":"Error in lines 1-14\nTraceback (most recent call last):\n  File \"/projects/edf7b34d-8ef9-49ad-b83f-8fa4cde53380/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 4, in <module>\nNameError: name 'fubar' is not defined\n"}︡
︠76f630a6-eb3c-46fc-a1c7-009bb4d4030a︠
ZeroDivisionError
︡d98b05e3-0b69-4a14-9574-7386e5149bde︡{"stdout":"<type 'exceptions.ZeroDivisionError'>\n"}︡
︠7876f6f8-afbf-45dd-810d-80683be9e30c︠
NameError
︡9ba3e115-148c-4087-9f4f-121174df0d1e︡{"stdout":"ZeroDivisionError('Rational division by zero',)\n"}︡
︠62854dbf-6d08-46cf-83eb-9126e68761a6i︠
%md
## Python classes
︡fcfa4675-f723-4e87-bb5f-cc1abd16345b︡{"html":"<h2>Python classes</h2>\n"}︡
︠1b0ed46e-fc47-4eae-a34c-9ddf4f721dda︠
class Hour:
    def __init__(self, hour, am):  # underscoreunderscore=dunder
        self.hour = Integer(hour)
        if self.hour <=0 or self.hour >= 13:
            raise ValueError("hour must be between 1 and 12")
        self.am = bool(am)
    def __repr__(self):
        return "%s%s"%(self.hour, "am" if self.am else "pm")
    def military(self):
        return (self.hour + (0 if self.am else 12))%24
    def __add__(self, right):
        n = self.military() + right.military()
        hour = n%12
        if hour == 0:
            hour += 12
        return Hour(hour, n%24 < 12)  # am/pm is RIGHT
︡fcbff2c3-cb91-4aaf-ae13-911d2c7151a9︡
︠4009e28f-3a23-4da7-8fcd-6971cd775bda︠
n = 78
︡04b48d62-b07d-4b6b-8783-b226b304f542︡
︠99bbd615-6ea4-4e06-9a5d-6f077eda881e︠
n.military() # BOOM
︠f670025f-4ee3-464a-b588-c54320c9c3cb︠
h = Hour(7, False)
h
︡e91eed29-1492-4c0c-ba82-f241c560a479︡{"stdout":"7pm\n"}︡
︠ccdc4880-f2d4-40df-a0be-affcf7473ca5︠
h.
︠9e116905-ee02-4717-9ff3-2b12c6963cb9︠
h.military()
︡3f49a2b7-16f0-4444-82f0-f9a554647027︡{"stdout":"19\n"}︡
︠88cc11f0-bb19-4d73-bdab-49f83a49905d︠
Hour(1,False) + Hour(3,False)
︡1e207bbd-9b7e-4ad8-822c-f8b13ff63ab2︡{"stdout":"4am\n"}︡
︠7ee26828-2c98-4412-9f58-e0a25017b574︠
h = Hour(1,False)
h
︡b20db130-808c-4859-b34a-c0e061605ebf︡{"stdout":"1pm\n"}︡
︠b29d86d4-c925-4d58-b8cc-684855d535a7︠
h + Hour(11,False)
︡dffbc82c-b024-4e43-827f-107e7c98f29e︡{"stdout":"12pm\n"}︡
︠ebe2c9cc-313a-4f2b-86e7-b3355529842a︠
h.hour
︡6f4b9af3-f87e-46a4-9a29-96ee30a0067d︡{"stdout":"1\n"}︡
︠00a34698-479b-4d78-a7c0-25c9f7c1b598︠
h.am
︡1862d7a0-7f50-478b-9ab6-afeb99fd66dd︡{"stdout":"False\n"}︡
︠3bb91e7f-1e90-4080-be70-ea1d6b28ecd1︠










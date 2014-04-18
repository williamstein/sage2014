︠ceeb9f8d-bc2c-432a-9039-42f44bed524ci︠
%md

# Math 480b -- Sage Course

## April 16, 2014

Screencast: <http://youtu.be/Z5lye6AIC5Y> (part 1) and <http://youtu.be/dp-ovN6J-_M> (part 2)

**Plan**

- Questions?

- Homework reminder: everything due by Friday at 6pm.  If you have permissions issues, restart your project server.

- Python classes: creating your own data types:
   - rational numbers
   - the field of all rational numbers

- Python decorators



︡8ce60ddf-6919-479c-894e-4a3ec4948334︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>April 16, 2014</h2>\n\n<p>Screencast: <a href=\"http://youtu.be/Z5lye6AIC5Y\">http://youtu.be/Z5lye6AIC5Y</a> (part 1) and <a href=\"http://youtu.be/dp-ovN6J-_M\">http://youtu.be/dp-ovN6J-_M</a> (part 2)</p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions?</p></li>\n<li><p>Homework reminder: everything due by Friday at 6pm.  If you have permissions issues, restart your project server.</p></li>\n<li><p>Python classes: creating your own data types:</p>\n\n<ul>\n<li>rational numbers</li>\n<li>the field of all rational numbers</li>\n</ul></li>\n<li><p>Python decorators</p></li>\n</ul>\n"}︡
︠476e1335-c9b7-4653-b0f3-de4218612ef1︠

︠c7195f96-ebf5-4f17-adae-80d4890b781b︠

︠98a44921-9568-4caf-bf66-1c873828c817︠

︠86d0b2f0-362f-4f7c-9776-b69b5e31d106i︠
%md
## Python class: a rational number
︡8de1266a-84cd-4b7f-bdf0-9a7f01f52a0c︡{"html":"<h2>Python class: a rational number</h2>\n"}︡
︠4f4017b9-b2db-4982-888a-10c2fa274401︠
class RationalNumber:
    def __init__(self, n, d):
        self.n = n
        self.d = d
︡5f5214f6-13ee-4cbc-863a-67034595cb22︡
︠eeed4641-8550-42ae-b003-db12ceeced22︠
t = RationalNumber(3, 2)
︡a903448a-2118-467e-a6fb-8771a7862d94︡
︠6444ac46-d5e4-4ea0-9509-6e4624f6c1ba︠
type(t)
︡0d2d9010-1b21-4ece-9f44-e789a6af21ea︡{"stdout":"<type 'instance'>\n"}︡
︠1ed27f41-d606-49a3-9616-ffa70bb8cb40︠
t
︡8fc61b56-ad8b-41e7-b8e7-abf52e8c9734︡{"stdout":"<__builtin__.RationalNumber instance at 0x782a908>\n"}︡
︠c86edb4d-2de5-4666-89aa-7ba6c2f3222c︠
t.n
︡8a68bd7f-581c-4793-9cef-7552fa16af68︡{"stdout":"3\n"}︡
︠5c84e23c-c4e5-4ecf-9325-f58fe7c6c218︠
t.d
︡467b4e70-8a7d-49fa-bd27-ebb4532221a1︡{"stdout":"2\n"}︡
︠7cfbae40-4bf6-4d09-8081-f76f899100b5︠
t
︡44664638-f925-4005-bb89-a2161c10b30e︡{"stdout":"<__builtin__.RationalNumber instance at 0x782a908>\n"}︡
︠f0a14d40-ed74-4690-be43-2538e72b2fa2︠
class RationalNumber:
    def __init__(self, n, d):
        self.n = n
        self.d = d
    def __repr__(self):
        return "%s/%s"%(self.n, self.d)
︡5ae3bf76-c40c-4448-9d16-21858f43aaf0︡
︠899113fb-d2ec-49df-8513-c97692547c13︠
t = RationalNumber(78,33484)
︡d5f386c3-63d7-4e57-b2f7-aad1e9dd4ca5︡
︠a880945e-5a18-4767-a06e-0c4a63d225a8︠
t
︡325d7bed-f795-4cff-a872-065ded700cd4︡{"stdout":"78/33484\n"}︡
︠28d54bb3-3d22-4d62-bc42-6e9c0df4756e︠
# swap
a,b  =  b,a
︠52d92a81-880a-4a49-a0d7-761b279e4b88︠
class RationalNumber:
    """
    EXAMPLES::

        sage: RationalNumber(78,-33484)
        -39/16742
    """
    def __init__(self, n, d):
        if d < 0:
            (n, d) = (-n, -d)
        g = gcd(n,d)
        self.n = n // g
        self.d = d // g
    def __repr__(self):
        return "%s/%s"%(self.n, self.d)

︡881fcc3f-14c6-44f7-876a-0be865804ad4︡
︠f8fb9da7-ed57-4b1a-afcc-7944287e62e5︠
RationalNumber(78,33484)
︡4e91ec30-cbbd-408c-b274-69f36f2f1dbd︡{"stdout":"39/16742\n"}︡
︠dbf1a52d-bce6-4cba-9002-dd3f92aa5e5f︠
RationalNumber(78,-33484)
︡9b4cf2f2-8e3c-4d0c-af59-fd782f52e815︡{"stdout":"-39/16742\n"}︡
︠4dd07738-fb38-4f1f-876d-5370c0861202︠
class RationalNumber:
    """
    EXAMPLES::

        sage: RationalNumber(78,-33484)
        -39/16742
    """
    def __init__(self, n, d):
        if d < 0:
            (n, d) = (-n, -d)
        g = gcd(n,d)
        self.n = n // g
        self.d = d // g
    def __repr__(self):
        return "%s/%s"%(self.n, self.d)
    def __add__(self, right):
        if not isinstance(right, RationalNumber):
            raise TypeError
        return RationalNumber(self.n*right.d + self.d*right.n, self.d*right.d)

︡3a2baaa4-1f1a-4a13-bd57-21130223b2b3︡
︠1f81fd8e-8263-425d-af36-b46ae6145f0f︠
s = RationalNumber(2,3)
t = RationalNumber(3,7)
print s, t
︡39d4a824-b311-4545-9f69-3ffe5fafaea6︡{"stdout":"2/3 3/7\n"}︡
︠56bf007b-5b3d-4b86-88b3-c105a198bec2︠
s+t
︡9fa14409-311e-4f99-a70a-e2dd584196cd︡{"stdout":"23/21\n"}︡
︠72f0c948-6451-4e0e-b9da-7b39c2a3ae24︠
s + 'funny thing'
︡ff82d35e-ee69-4e20-85ca-72ec30ae9735︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"\", line 18, in __add__\nTypeError\n"}︡
︠db1d3237-01d5-420a-99f8-2fd82e3eb452︠
class RationalNumber:
    """
    EXAMPLES::

        sage: RationalNumber(78,-33484)
        -39/16742
    """
    def __init__(self, n, d):
        if d < 0:
            (n, d) = (-n, -d)
        g = gcd(n,d)
        self.n = n // g
        self.d = d // g
    def __repr__(self):
        return "%s/%s"%(self.n, self.d)
    def __add__(self, right):
        if not isinstance(right, RationalNumber):
            raise TypeError
        return RationalNumber(self.n*right.d + self.d*right.n, self.d*right.d)
    def __mul__(self, right):
        if not isinstance(right, RationalNumber):
            raise TypeError
        return RationalNumber(self.n*right.n, self.d*right.d)
    def __neg__(self):
        return RationalNumber(-self.n, self.d)
    def __pow__(self, k):
        return RationalNumber(self.n^k, self.d^k)
    def __div__(self, right):
        if not isinstance(right, RationalNumber):
            raise TypeError
        return RationalNumber(self.n*right.d, self.d*right.n)
︡7ca3ece4-fc92-4284-8fae-fcc178351909︡
︠608e3166-421a-40a7-8d7e-6de51f98f801︠
s = RationalNumber(2,3)
t = RationalNumber(3,7)
s*t
︡0f980c2b-e025-4523-be9b-2ad9d66608bc︡{"stdout":"2/7\n"}︡
︠a049a327-2c16-46af-9752-493b7d32cfb5︠
-s/t
︡f125f55c-a203-4fe9-b251-2d2b71849bab︡{"stdout":"-14/9\n"}︡
︠d9896153-a667-4761-aac6-663cee08a748︠
((s+t)*(s*t)) + RationalNumber(3,-7)
︡1238a7d8-d496-4ba8-b682-750b6dc142e7︡{"stdout":"-17/147\n"}︡
︠d8ec639e-faf6-4cda-a421-040f7051ce8b︠

︠0a3c9772-6249-4a66-84ce-2024bc266563︠

︠e3fe4f29-1660-4833-bff9-7c80123b1cbd︠

︠36f5649b-5247-452d-a152-e6a4c54dbbf1i︠
%md
## Another Class: the field of rational numbers
︡c0953f3b-2bf9-4d59-be77-ffc9adff3a77︡{"html":"<h2>Another Class: the field of rational numbers</h2>\n"}︡
︠e22022fe-3575-484c-af1c-f52b185859df︠

︠79aa36e5-4801-45e1-87fa-61cc9127a24c︠

︠a988f3ae-7320-4bd4-b70c-62c9ec82828a︠

︠3e576787-5544-43cd-a9b2-78c4dd232e71︠

︠9229717b-2cf8-4309-a798-cbf7b1084fb6i︠
%md
## Python decorators

- example of making a verbose function
- illustration of a complex decorator: interact
︡4c88d5b3-8263-402b-9ff0-956619a8bcca︡{"html":"<h2>Python decorators</h2>\n\n<ul>\n<li>example of making a verbose function</li>\n<li>illustration of a complex decorator: interact</li>\n</ul>\n"}︡
︠722717d6-f571-43e4-98b8-50a1cce42735︠
︡d8910d91-f0e1-41bc-b6a7-c9dcad982a3b︡
︠7920ec0f-c63c-4158-abca-56d1849cf8f0︠
def noisy(f):
    def g(*args, **kwds):
        print args, kwds
        ans = f(*args, **kwds)
        print ans
        return ans
    return g
︡06f2e69e-9689-4dfa-8bdd-a80d7ef73058︡
︠139ca93e-d5a7-42b7-9466-9372a184d43f︠
def f(n,m):
    return n+m
f = noisy(f)
︡6b4ba2fc-a235-4cd6-8de9-9c90bef0e91d︡
︠8d68b259-f2cb-4ba2-a5f3-03ab8e1253c6︠
f(3,4)
︡448fe0c9-f06a-4634-b069-7f25e7f0fc35︡{"stdout":"(3, 4) {}\n7\n7\n"}︡
︠d46fadb9-e528-432d-8bf6-67587d9705dc︠
@noisy
def f(n,m):
    return n+m
︡2cd7f7a1-98ee-4f8c-8457-6c1314c0207e︡
︠11ab1f94-5815-4eef-b519-4ecff5a5beab︠
f(3,4)
︡34ead748-c845-456b-a14d-96664cee011e︡{"stdout":"(3, 4) {}\n7\n7\n"}︡
︠87f1a708-7f52-4d9b-bd52-2f0d5c0cf482︠

︠a5781f5f-092e-4842-a168-41d9d5df1cbfi︠
%md
## Some graphics for fun

- basics of Sage 2d graphics

︡13c2ef92-7d6e-454d-9da7-9a4b0fe41da9︡{"html":"<h2>Some graphics for fun</h2>\n\n<ul>\n<li>basics of Sage 2d graphics</li>\n</ul>\n"}︡
︠e16b3639-2f2b-4306-8bc7-a39877202fe4︠

︠8b7db034-0ece-48e3-8779-398782240e30︠

︠81722a32-c366-407d-b267-12724e152c99︠

︠570287d5-0c8e-4f3c-bc0a-79d0c299154f︠

︠40e0e3dd-6b53-4a04-ae65-e16b24d8c32c︠

︠21725eee-903b-4e1f-960c-06d1529f5ed1︠










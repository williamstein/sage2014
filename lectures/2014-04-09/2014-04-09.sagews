︠a3dbc567-090d-468a-90d7-8e7e420e4a86︠
TOTAL:13/20
︠0a143557-ca91-49ad-bc1d-814f8b0fa767i︠
%md

# Math 480b -- Sage Course

## April 9, 2014

Screencast: <http://youtu.be/ndoM3TJGSDY>

**Plan**

- Questions?

- Python
   - list comprehensions
   - functions
   - putting code in files/modules and loading them

- Friday: creating your own data types
︡80dbaf87-8196-4bdb-94ea-fbf00d06282c︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>April 9, 2014</h2>\n\n<p>Screencast: <a href=\"http://youtu.be/ndoM3TJGSDY\">http://youtu.be/ndoM3TJGSDY</a></p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions?</p></li>\n<li><p>Python</p>\n\n<ul>\n<li>list comprehensions</li>\n<li>functions</li>\n<li>putting code in files/modules and loading them</li>\n</ul></li>\n<li><p>Friday: creating your own data types</p></li>\n</ul>\n"}︡
︠bbddef24-cd7a-4f57-a31c-da02e8ebfe23i︠
%md
## Python: List Comprehensions

- simple examples -- turning a for loop to make a list into a comprehension
- more complicated examples
- map versus list comprehension
- the scope gotcha

︡3bab44f7-8a55-4df0-9128-3ab9821eff04︡{"html":"<h2>Python: List Comprehensions</h2>\n\n<ul>\n<li>simple examples &#8211; turning a for loop to make a list into a comprehension</li>\n<li>more complicated examples</li>\n<li>map versus list comprehension</li>\n<li>the scope gotcha</li>\n</ul>\n"}︡
︠a9af35b0-b003-4049-9d3e-79092975196e︠
v = []
for n in range(5):
    v.append((n*(n+1))/2)

v
︡7beef2bc-fefa-4cae-a931-af9b7172524b︡{"stdout":"[0, 1, 3, 6, 10]\n"}︡
︠1f22ed62-a992-4dbb-8b87-7ed94a595356︠
v = [n*(n+1)/2 for n in range(5)]
v
︡b69be23a-3172-4b20-b7d3-1bf3e61b83ac︡{"stdout":"[0, 1, 3, 6, 10]\n"}︡
︠c85acbb2-a2fc-41be-97c9-846c9498d4bf︠
v = []
for n in range(5):
    c = n*(n+1)/2
    if c % 2 == 0:
        v.append(c)
v
︡d7c28aab-9735-41d2-8430-f8cf0b56434f︡{"stdout":"[0, 6, 10]\n"}︡
︠9871af90-cda8-484b-9efb-2d676192be8d︠
v = [n*(n+1)/2 for n in range(5) if n*(n+1)/2 %2 == 0]
︡5a9c1a29-ecf4-4245-86ab-9b69978dddbc︡
︠c622b10e-5068-4365-ac56-877c6f5c7ca3︠
v
︡8506a10f-dc80-4329-b77d-48662dede72a︡{"stdout":"[0, 6, 10]\n"}︡
︠21201525-8523-49f9-bc69-5694ad42e7fa︠
v = []
for n in range(1,5):
    for m in range(5,9):
        v.append(n*m)
v
︡8d7f0a75-5537-48c9-8117-c3ae6c56cbd4︡{"stdout":"[5, 6, 7, 8, 10, 12, 14, 16, 15, 18, 21, 24, 20, 24, 28, 32]\n"}︡
︠7961d5d6-9e22-4c63-adef-1da64cde5f99︠
[n*m for n in range(1,5) for m in range(5,9)]

︡4a375bb0-5fa0-47b7-8821-ce77c6aba9b4︡{"stdout":"[5, 6, 7, 8, 10, 12, 14, 16, 15, 18, 21, 24, 20, 24, 28, 32]\n"}︡
︠616b598c-81f1-4305-a188-1bd3ad0c476c︠
x = 784
︡4a01945a-e61d-4f61-9ac4-daf661b0a6db︡
︠3a066e0d-a18c-46fc-8f73-7a4d4c31cf4c︠
[N(sin(x)) for x in range(1,10)]
︡2fd27b57-840a-4806-84f7-baaad707e979︡{"stdout":"[0.841470984807897, 0.909297426825682, 0.141120008059867, -0.756802495307928, -0.958924274663138, -0.279415498198926, 0.656986598718789, 0.989358246623382, 0.412118485241757]\n"}︡
︠f23c4c5c-81b7-4677-878e-c1bb16adadee︠
x
︡f436ec2b-40f7-431e-b1c7-f980f91fd71e︡{"stdout":"9\n"}︡
︠a050f59e-0859-4c37-b0be-47edacec4a2c︠
[sin(x*pi/3) for x in range(1,10)]
︡955dbca9-90c2-4ca8-a3b1-61c1f3b8b335︡{"stdout":"[1/2*sqrt(3), 1/2*sqrt(3), 0, -1/2*sqrt(3), -1/2*sqrt(3), 0, 1/2*sqrt(3), 1/2*sqrt(3), 0]\n"}︡
︠e6d1a142-0bbb-471a-82e8-b4ae12f54d5c︠
[math.sin(x*pi/3) for x in range(1,10)]

︡c9312f1b-143b-4151-a9c9-7749e80d4d2c︡{"stdout":"[0.8660254037844386, 0.8660254037844387, 1.2246467991473532e-16, -0.8660254037844384, -0.8660254037844386, -2.4492935982947064e-16, 0.8660254037844388, 0.8660254037844392, 3.6739403974420594e-16]\n"}︡
︠f68dd01b-271b-4e04-a042-52e45dd10697︠
[n*2 for n in [k^2 for k in range(4)]]
︡8a63b207-712a-4ddb-b177-c0b5b7ee8b88︡{"stdout":"[0, 2, 8, 18]\n"}︡
︠0b41ffc0-7fbb-4661-b781-f2e5ecd8c0c9︠
%time
v = []
for n in range(10^6):
    if n % 2 == 1:
        v.append(n*n)
︡e4bfffff-3b0b-4725-8666-c1823f42bcd2︡{"stdout":"CPU time: 4.60 s, Wall time: 4.60 s"}︡{"stdout":"\n"}︡
︠2286ebfd-26c5-4741-8ff0-e836921791f0︠
%time
v = [n*n for n in range(10^6) if n %2 == 1]
︡2e2d1c31-4a52-4b13-9daa-faa28602d8d4︡{"stdout":"CPU time: 3.06 s, Wall time: 3.05 s"}︡{"stdout":"\n"}︡
︠3325cb25-ba7e-492e-919a-fb96de3cfc8c︠
[1..5]
︡af1abe27-b732-400f-bd6e-459cb511cf62︡{"stdout":"[1, 2, 3, 4, 5]\n"}︡
︠fa2cdfa2-9f49-4169-9208-73c254f83c99︠

v = [n*n for n in [1..10^6] if n %2 == 1]
︠7c998b51-6ccf-481b-a032-e6d05f6fa2c3︠
[1,5,..,100]
︡4ba52b8d-8b7a-4cdb-aca8-518a5e46990f︡{"stdout":"[1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97]\n"}︡
︠128a293f-62f2-448d-ac96-ccdd56085846︠
show([1,5+pi,..100])
︡80c1a797-a40c-4e20-82b6-d91616273951︡{"tex":{"tex":"\\left[1, \\pi + 5, 2 \\, \\pi + 9, 3 \\, \\pi + 13, 4 \\, \\pi + 17, 5 \\, \\pi + 21, 6 \\, \\pi + 25, 7 \\, \\pi + 29, 8 \\, \\pi + 33, 9 \\, \\pi + 37, 10 \\, \\pi + 41, 11 \\, \\pi + 45, 12 \\, \\pi + 49, 13 \\, \\pi + 53\\right]","display":true}}︡
︠e61b8525-e208-4d90-93d6-418e4b15f913︠
%var x
s = expand((1+sqrt(2)*x+e^pi)^3); s
︡c1997bbe-2d2d-4c77-8ba4-e84691090d6b︡{"stdout":"2*sqrt(2)*x^3 + 6*x^2*e^pi + 6*sqrt(2)*x*e^pi + 3*sqrt(2)*x*e^(2*pi) + 6*x^2 + 3*sqrt(2)*x + 3*e^pi + e^(3*pi) + 3*e^(2*pi) + 1\n"}︡
︠56a99698-1045-4102-a140-2d76faf5bed7︠
show(s)
︡7cde4146-4826-4128-9363-c3bc679abb62︡{"tex":{"tex":"2 \\, \\sqrt{2} x^{3} + 6 \\, x^{2} e^{\\pi} + 6 \\, \\sqrt{2} x e^{\\pi} + 3 \\, \\sqrt{2} x e^{\\left(2 \\, \\pi\\right)} + 6 \\, x^{2} + 3 \\, \\sqrt{2} x + 3 \\, e^{\\pi} + e^{\\left(3 \\, \\pi\\right)} + 3 \\, e^{\\left(2 \\, \\pi\\right)} + 1","display":true}}︡
︠802eda87-2155-4358-afe5-22f6fe6a5788︠
latex(s)
︡ad96621d-da1f-4a78-9988-b528dfea161d︡{"stdout":"2 \\, \\sqrt{2} x^{3} + 6 \\, x^{2} e^{\\pi} + 6 \\, \\sqrt{2} x e^{\\pi} + 3 \\, \\sqrt{2} x e^{\\left(2 \\, \\pi\\right)} + 6 \\, x^{2} + 3 \\, \\sqrt{2} x + 3 \\, e^{\\pi} + e^{\\left(3 \\, \\pi\\right)} + 3 \\, e^{\\left(2 \\, \\pi\\right)} + 1\n"}︡
︠62189a84-b815-49b9-bb76-75d65e404d06︠
v = (k^3 for k in xrange(10^10))
︡659d7be7-39a8-4d91-8fc5-53781352fd7a︡
︠2a14a28f-675d-4dfa-ab2d-0c02306fdf38︠
v
︡d0af9030-40ef-4bb2-9ae3-3c277d5d5a3f︡{"stdout":"<generator object <genexpr> at 0x7472190>\n"}︡
︠687e18c7-2ca3-4b10-a4b8-0b8ba1c2b0c3︠
for n in v:
    print n+2
    if n >10:
        break
︡3612c4f5-5aba-4451-b4cf-92a90ab352c6︡{"stdout":"2\n3\n10\n29\n"}︡
︠bae51409-83d2-421a-9591-24cd618f24bd︠





︠ccf79395-a4df-4ceb-b63a-4884825751f9︠
map?
︡8ea1253a-aefe-4836-8797-2819e6fd9c86︡{"stdout":"Unable to read source filename (<built-in function map> is not a module, class, method, function, traceback, frame, or code object)   Docstring:\n   map(function, sequence[, sequence, ...]) -> list\n\nReturn a list of the results of applying the function to the items of\nthe argument sequence(s).  If more than one sequence is given, the\nfunction is called with an argument list consisting of the\ncorresponding item of each sequence, substituting None for missing\nvalues when not all sequences have the same length.  If the function\nis None, return a list of the items of the sequence (or a list of\ntuples if more than one sequence).\n"}︡{"stdout":"\n"}︡
︠ac35a601-8d30-493f-a205-91feb6786c44︠
v = range(10)
[n*(n+1)/2 for n in v]
︡ae309fdb-3655-4fff-9716-9d22e93a3a24︡{"stdout":"[0, 1, 3, 6, 10, 15, 21, 28, 36, 45]\n"}︡
︠5229552e-a5c7-4dbc-9a37-3af043613fa2︠
def f(n):
    return n*(n+1)/2
map(f, v)
︡44d41227-df5f-48f6-9f1a-1096bb85dbe6︡{"stdout":"[0, 1, 3, 6, 10, 15, 21, 28, 36, 45]\n"}︡
︠f9dd0de1-4312-4d5a-b180-fd455f49ed28︠
map(lambda n : n*(n+1)/2,  v)
︡f2bfbf7a-bd6d-403f-9afc-a4bf7503b7dc︡{"stdout":"[0, 1, 3, 6, 10, 15, 21, 28, 36, 45]\n"}︡
︠5c7fbf8e-12d4-47bf-a75d-4966fef14184︠

︠a6527fac-60ba-445d-b290-06bbfa5b1ea3︠
filter?
︡6637a4ed-b434-4b38-8342-eb8d1c37e2f0︡{"stdout":"Unable to read source filename (<built-in function filter> is not a module, class, method, function, traceback, frame, or code object)   Docstring:\n   filter(function or None, sequence) -> list, tuple, or string\n\nReturn those items of sequence for which function(item) is true.  If\nfunction is None, return the items that are true.  If sequence is a\ntuple or string, return the same type, else return a list.\n\n"}︡
︠2d772e25-f504-417f-90a4-2b28b0143b05︠
reduce?
︡f9f9facc-e547-46f4-be9d-e494794d44ec︡{"stdout":"Unable to read source filename (<built-in function reduce> is not a module, class, method, function, traceback, frame, or code object)   Docstring:\n   reduce(function, sequence[, initial]) -> value\n\nApply a function of two arguments cumulatively to the items of a\nsequence, from left to right, so as to reduce the sequence to a single\nvalue. For example, reduce(lambda x, y: x+y, [1, 2, 3, 4, 5])\ncalculates ((((1+2)+3)+4)+5).  If initial is present, it is placed\nbefore the items of the sequence in the calculation, and serves as a\ndefault when the sequence is empty.\n\n"}︡
︠b1d10e1c-b45a-4174-a0a3-03dfb63283c3︠
# in magma...
&+[1..5]
︠1f0b2e54-98ec-4472-9750-38ddc8102d24︠

︠829c1195-9a1e-4072-bf2e-792f92f29c1ci︠
%md
## Python Functions

- arguments are references (and the default argument gotcha)
- all functions return exactly one thing
- tuple packing/unpacking
- variable number of arguments and keywords
- local/global scope

︡ee55d59d-047c-4f9e-a56d-87093370a393︡{"html":"<h2>Python Functions</h2>\n\n<ul>\n<li>arguments are references (and the default argument gotcha)</li>\n<li>all functions return exactly one thing</li>\n<li>tuple packing/unpacking</li>\n<li>variable number of arguments and keywords</li>\n<li>local/global scope</li>\n</ul>\n"}︡
︠f2f3d0fb-8d6d-4fe6-9b61-6632f7fe221b︠
def f(v, w=[]):
    print id(w)
    w.append(v)
    print v, w
︡5019f9e1-5236-4336-bd9a-2728ea25d387︡
︠02173fa0-209a-49ce-b0d4-cf7130c02a4f︠
f(2)
︡7448cd49-6758-4758-8d2f-06038954c2f2︡{"stdout":"218375448\n2 [2]\n"}︡
︠b7fc8ed8-5be4-4c14-83ae-7f41e58e5d35︠
f(2)
︡0c3655fb-347c-480a-a6b0-8235e9c5d28c︡{"stdout":"218375448\n2 [2, 2]\n"}︡
︠c95ae8a7-980e-40e4-ab35-ae8874932d2a︠
f(pi)
︡0e014145-cfdf-46e6-aa3b-b1eafa6bef4e︡{"stdout":"218375448\npi [2, 2, pi]\n"}︡
︠70f70c51-b46b-4a5a-8314-576ee85fe5a1︠
f(2)
︡3532d5af-49a8-43ba-b641-9183113209cf︡{"stdout":"2 []\n"}︡
︠b56d8199-2007-44ae-9a3d-50dac18e31c3︠

︠f44d2bef-d34b-48d1-bef8-7ffa1a608527︠
# fix

def f(v, w=None):
    if w is None:
        w = []
    print id(w)
    w.append(v)
    print v, w
︡b3f16202-f13a-49d2-8428-7d88e2033fdb︡
︠abdc65d5-c424-4714-b8cb-a2540e156e2f︠
f(2)
︡18d3bfd7-da86-4dd5-82b8-b3ae7f234a9e︡{"stdout":"218375736\n2 [2]\n"}︡
︠8b65e6cc-dd54-456f-a1b9-8ef952acea8f︠
f(2)
︡a353241d-d438-4585-ac4f-b5f7738dc356︡{"stdout":"218376024\n2 [2]\n"}︡
︠8555e290-3805-4cfa-b6bd-23964a14070d︠

︠84b28b55-72ac-4fea-978a-062bb29d5cde︠
w = [1,2,3]
f(v=pi, w=w)
︡eb582ee2-218c-41b5-b9cd-d928ac535f93︡{"stdout":"pi [1, 2, 3, pi]\n"}︡
︠8bb522b1-390f-4053-b8d9-765f3e3b0e07︠
w
︡8408c4ff-c447-467a-99eb-79c66ca7e4bb︡{"stdout":"[1, 2, 3, pi]\n"}︡
︠343376d1-bdf8-4b4c-bdeb-9948f9fb6503︠
def length(v):
    v.append('he he')
    return len(v)-1
︡86e7a0f5-e39a-48f3-b0c8-f12eac786568︡
︠8691071f-3d9e-4fe7-afe1-0eaf017a04b3︠
length(w)
︡778b66cd-089c-4306-a580-01f58b8dc9e6︡{"stdout":"4\n"}︡
︠fe691d8c-d197-4f47-b231-b46ee9952dd8︠
w
︡3dac07dc-6ef3-44a2-95c3-32eb41b4498d︡{"stdout":"[1, 2, 3, pi, 'he he']\n"}︡
︠f48260d8-01ae-4105-91bf-0f6dca8595fbi︠
%md
## Putting your code in a file

 - loading .py, .sage files
 - importing (and reloading) .py modules
︡25362129-0963-4fcb-a057-f6018bf32f5d︡{"html":"<h2>Putting your code in a file</h2>\n\n<ul>\n<li>loading .py, .sage files</li>\n<li>importing (and reloading) .py modules</li>\n</ul>\n"}︡
︠f8c0218e-1554-4e33-8ad1-cbd941b0f506︠



︠e677350c-a821-4794-b50c-06d4e3d4a1cc︠

︠e3e6170c-e63e-4543-b811-e28ed8481433︠

︠2e5bf60b-1026-4553-9bed-d73ee3b098f4︠











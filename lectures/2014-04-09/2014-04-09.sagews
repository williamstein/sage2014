︠18805c04-25e1-4f63-8089-e733c4a0f1c9︠

︡3a1d1a32-fe8d-4087-b19b-1a02ca01a9ae︡
︡3a1d1a32-fe8d-4087-b19b-1a02ca01a9ae︡
︡3a1d1a32-fe8d-4087-b19b-1a02ca01a9ae︡
︡3a1d1a32-fe8d-4087-b19b-1a02ca01a9ae︡
︠0a143557-ca91-49ad-bc1d-814f8b0fa767︠
%md

# Math 480b -- Sage Course

## April 9, 2014

Screencast: <REMIND ME -- START IT!!!!!!!>

**Plan**

- Questions?

- Python
   - list comprehensions
   - functions
   - putting code in files/modules and loading them

- Friday: creating your own data types
︡bfa65b4c-2405-4bbb-924e-c5e0f9292240︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>April 9, 2014</h2>\n\n<p>Screencast: <REMIND ME &#8211; START IT!!!!!!!></p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions?</p></li>\n<li><p>Python</p>\n\n<ul>\n<li>list comprehensions</li>\n<li>functions</li>\n<li>putting code in files/modules and loading them</li>\n</ul></li>\n<li><p>Friday: creating your own data types</p></li>\n</ul>\n"}︡
︠bbddef24-cd7a-4f57-a31c-da02e8ebfe23i︠
%md
## Python: List Comprehensions

- simple examples -- turning a for loop to make a list into a comprehension
- more complicated examples
- map versus list comprehension
- the scope gotcha

︡3bab44f7-8a55-4df0-9128-3ab9821eff04︡{"html":"<h2>Python: List Comprehensions</h2>\n\n<ul>\n<li>simple examples &#8211; turning a for loop to make a list into a comprehension</li>\n<li>more complicated examples</li>\n<li>map versus list comprehension</li>\n<li>the scope gotcha</li>\n</ul>\n"}︡
︠c622b10e-5068-4365-ac56-877c6f5c7ca3︠




︠7961d5d6-9e22-4c63-adef-1da64cde5f99︠




︠f23c4c5c-81b7-4677-878e-c1bb16adadee︠




︠bae51409-83d2-421a-9591-24cd618f24bd︠





︠ccf79395-a4df-4ceb-b63a-4884825751f9︠
map?
︡380451ab-9c32-463e-b131-14079ece4f39︡{"stdout":"Unable to read source filename (<built-in function map> is not a module, class, method, function, traceback, frame, or code object)   Docstring:\n   map(function, sequence[, sequence, ...]) -> list\n\nReturn a list of the results of applying the function to the items of\nthe argument sequence(s).  If more than one sequence is given, the\nfunction is called with an argument list consisting of the\ncorresponding item of each sequence, substituting None for missing\nvalues when not all sequences have the same length.  If the function\nis None, return a list of the items of the sequence (or a list of\ntuples if more than one sequence).\n"}︡{"stdout":"\n"}︡
︠a6527fac-60ba-445d-b290-06bbfa5b1ea3︠
filter?
︡6637a4ed-b434-4b38-8342-eb8d1c37e2f0︡{"stdout":"Unable to read source filename (<built-in function filter> is not a module, class, method, function, traceback, frame, or code object)   Docstring:\n   filter(function or None, sequence) -> list, tuple, or string\n\nReturn those items of sequence for which function(item) is true.  If\nfunction is None, return the items that are true.  If sequence is a\ntuple or string, return the same type, else return a list.\n\n"}︡
︠2d772e25-f504-417f-90a4-2b28b0143b05︠

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




︠70f70c51-b46b-4a5a-8314-576ee85fe5a1︠

︠8bb522b1-390f-4053-b8d9-765f3e3b0e07︠

︠8691071f-3d9e-4fe7-afe1-0eaf017a04b3︠

︠fe691d8c-d197-4f47-b231-b46ee9952dd8︠

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











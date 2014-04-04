︠5fb55eb3-eabb-4edb-ba17-dabd890d2eefi︠
%md
# Homework 2 - Math 480b - Spring 2014

**Due Friday, April 11, 2014 by 6pm**

Turn it in by creating a folder called "homework2" in your project, with this worksheet in it.  It will be automatically collected.

NOTE: You can put this worksheet in a SageMathCloud project by navigating to a directory (using the Files tab), then click "+New" and paste the following in the blank then click "From Web":

     https://raw.githubusercontent.com/williamstein/sage2014/master/homework/homework2/hw2.sagews

<br>
You can also grab this homework from the shared project: <https://cloud.sagemath.com/projects/edf7b34d-8ef9-49ad-b83f-8fa4cde53380/>


︡fecdf690-8928-4c62-a3ab-f6fbf41f8f80︡{"html":"<h1>Homework 2 - Math 480b - Spring 2014</h1>\n\n<p><strong>Due Friday, April 11, 2014 by 6pm</strong></p>\n\n<p>Turn it in by creating a folder called &#8220;homework2&#8221; in your project, with this worksheet in it.  It will be automatically collected.</p>\n\n<p>NOTE: You can put this worksheet in a SageMathCloud project by navigating to a directory (using the Files tab), then click &#8220;+New&#8221; and paste the following in the blank then click &#8220;From Web\":</p>\n\n<pre><code> https://raw.githubusercontent.com/williamstein/sage2014/master/homework/homework2/hw2.sagews\n</code></pre>\n\n<p><br>\nYou can also grab this homework from the shared project: <a href=\"https://cloud.sagemath.com/projects/edf7b34d-8ef9-49ad-b83f-8fa4cde53380/\">https://cloud.sagemath.com/projects/edf7b34d-8ef9-49ad-b83f-8fa4cde53380/</a></p>\n"}︡
︠b5a63860-9c5d-4f36-87a1-0729a9493eedi︠
%md
## Problem 1

Write a function called flatten, which takes a list and "flattens" it -- that is, removes any internal lists, while keeping the elements in the same order. This is best explained by example:
<br><br>

        sage: flatten([1,2,3])
        [1, 2, 3]
        sage: flatten(["house", [["boat"], 3]])
        ["house", "boat", 3]
        sage: flatten([[1,2], [[[3]], 4, [[5, 6]]]])
        [1, 2, 3, 4, 5, 6]

<br><br>
This is a very standard problem, and solutions can be found online easily, so try hard to do it without just looking up the answer.  It's for your benefit.
︡24b9ec84-4ee9-42c0-8fb8-fde5db087372︡{"html":"<h2>Problem 1</h2>\n\n<p>Write a function called flatten, which takes a list and &#8220;flattens&#8221; it &#8211; that is, removes any internal lists, while keeping the elements in the same order. This is best explained by example:\n<br><br></p>\n\n<pre><code>    sage: flatten([1,2,3])\n    [1, 2, 3]\n    sage: flatten([\"house\", [[\"boat\"], 3]])\n    [\"house\", \"boat\", 3]\n    sage: flatten([[1,2], [[[3]], 4, [[5, 6]]]])\n    [1, 2, 3, 4, 5, 6]\n</code></pre>\n\n<p><br><br>\nThis is a very standard problem, and solutions can be found online easily, so try hard to do it without just looking up the answer.  It&#8217;s for your benefit.</p>\n"}︡
︠39cef0b2-6be1-4f74-a4f6-587bd15892c3︠

︠2e1ddf9f-6eb2-4db6-8938-efb418a1e296︠

︠d9f60944-b9f4-4cc0-8351-188d81e7370c︠

︠855d00c5-7918-407c-b33f-cdbd18445e7ei︠
%md
## Problem 2

Write a function triangle which takes a positive integer $n$ and a positive integer $k$ as input and returns the sum of the $k$ powers of the first $n$ integers:

<br><br>

        >>> triangle(3,1)   # 1+2+3
        6
        >>> triangle(3,2)   # 1+4+9
        14
        >>> triangle(100, 1)
        5050

<br><br>
You should be able to do this in one line with a list comprehension -- don't worry about making it fast, just do something naive and easy to implement.
︡5ebb1036-aa5b-4975-be2e-f0f11e58a377︡{"html":"<h2>Problem 2</h2>\n\n<p>Write a function triangle which takes a positive integer $n$ and a positive integer $k$ as input and returns the sum of the $k$ powers of the first $n$ integers:</p>\n\n<p><br><br></p>\n\n<pre><code>    &gt;&gt;&gt; triangle(3,1)   # 1+2+3\n    6\n    &gt;&gt;&gt; triangle(3,2)   # 1+4+9\n    14\n    &gt;&gt;&gt; triangle(100, 1)\n    5050\n</code></pre>\n\n<p><br><br>\nYou should be able to do this in one line with a list comprehension &#8211; don&#8217;t worry about making it fast, just do something naive and easy to implement.</p>\n"}︡
︠43889bda-c16b-417c-ba08-7af419602571︠

︠3179ef6c-e7f9-42be-9521-d898f5b16da3︠

︠98504561-7463-4c5e-ab70-89f99dbe019f︠

︠567f3046-d10c-4777-911e-47cf80887e63︠

︠5bd9076a-d57f-4e94-b14e-62a604bc10de︠

︠5442efec-92e8-427c-aa2f-4fdc7162a210i︠
%md
## Problem 3

Implement the "double factorial" -- that is, the function that inputs a positive integer n and returns the product of all the odd integers less than or equal to n.
︡c6f8d583-3eb2-49e5-9953-05fab9e29c73︡{"html":"<h2>Problem 3</h2>\n\n<p>Implement the &#8220;double factorial&#8221; &#8211; that is, the function that inputs a positive integer n and returns the product of all the odd integers less than or equal to n.</p>\n"}︡
︠c240101a-6429-4022-8284-7ae305219f21︠

︠db049958-8554-42dd-b01c-1f5d74931638︠

︠1510a2e6-fd1f-41be-bf73-d4e5687050a4︠

︠6405315a-dd00-44c8-947a-df7eab413481i︠

%md
## Problem 4

Write a function called `copy_and_flatten_directory` that takes as input two directory names. It then copies all files in all subfolders of the first directory into the second subdirectory, ignoring the directory structure completely. (That is, it flattens it.) So, for instance, if the first folder had these files

        mydir/foo/bar/baz.txt
        mydir/foo/bar/pie.pdf
        mydir/foo/bar/stuff.txt
        mydir/myfile.py
        mydir/other_stuff.ss


then, after this function is run, the second folder should contain

        baz.txt
        myfile.py
        other_stuff.ss
        pie.pdf
        stuff.txt

Python has functions like `os.path.listdir`, `shutil.copyfile`, etc., which will be useful.  Do `import shutil`, then `shutil.[tab key]` to get going.


︡65ac23b8-4bc9-41e6-bed7-8755583cd495︡{"html":"<h2>Problem 4</h2>\n\n<p>Write a function called <code>copy_and_flatten_directory</code> that takes as input two directory names. It then copies all files in all subfolders of the first directory into the second subdirectory, ignoring the directory structure completely. (That is, it flattens it.) So, for instance, if the first folder had these files</p>\n\n<pre><code>    mydir/foo/bar/baz.txt\n    mydir/foo/bar/pie.pdf\n    mydir/foo/bar/stuff.txt\n    mydir/myfile.py\n    mydir/other_stuff.ss\n</code></pre>\n\n<p>then, after this function is run, the second folder should contain</p>\n\n<pre><code>    baz.txt\n    myfile.py\n    other_stuff.ss\n    pie.pdf\n    stuff.txt\n</code></pre>\n\n<p>Python has functions like <code>os.path.listdir</code>, <code>shutil.copyfile</code>, etc., which will be useful.  Do <code>import shutil</code>, then <code>shutil.[tab key]</code> to get going.</p>\n"}︡
︠c37e579d-d1c2-422b-9984-ae280d137e09︠

︠7d0e58bd-064f-46c8-8589-1dcf30141a87︠

︠e245b2b3-973c-4bd8-9422-50afd2f05dd1︠

︠bce95522-087a-4ef3-a67c-dd74c43bfff1︠

︠0bdf6b8d-1229-45d7-8faf-c4867ebde927i︠
%md
## Problem 5

Write a function `remove_duplicates` that takes as input a list (or tuple), and returns a new list (or tuple, if the input was a tuple) which contains exactly one copy of each entry in the input list (or tuple).  Here's an example:

        >>> remove_duplicates([3,3,3,3])
        [3]
        >>> remove_duplicates((3,3,3,3))
        (3,)
        >>> remove_duplicates([3, [3]])
        [3, [3]]
        >>> remove_duplicates([3, [3], [3]])
        [3, [3]]
︡aeeb978d-aea7-4144-b319-9cbd0bd31992︡{"html":"<h2>Problem 5</h2>\n\n<p>Write a function <code>remove_duplicates</code> that takes as input a list (or tuple), and returns a new list (or tuple, if the input was a tuple) which contains exactly one copy of each entry in the input list (or tuple).  Here&#8217;s an example:</p>\n\n<pre><code>    &gt;&gt;&gt; remove_duplicates([3,3,3,3])\n    [3]\n    &gt;&gt;&gt; remove_duplicates((3,3,3,3))\n    (3,)\n    &gt;&gt;&gt; remove_duplicates([3, [3]])\n    [3, [3]]\n    &gt;&gt;&gt; remove_duplicates([3, [3], [3]])\n    [3, [3]]\n</code></pre>\n"}︡
︠fb99293b-7fcb-464a-9da2-5173eab30fbb︠

︠069cbba7-dc48-48ec-8416-274ef6c19bdb︠

︠e2d56538-8416-4f14-b22e-8d89bd5888a0︠

︠64733da7-4d05-4add-bc8b-7722baab5297︠

︠7a6855f9-4114-447f-940f-587bf44b31ddi︠
%md
## Problem 6

I heard somebody claim that for every positive integer $n$ we have

$$(1+2+...+n)^2 = 1^3 + 2^3 + ... + n^3.$$

Write a program which takes as input a positive integer n and verifies (or disproves) this claim for every positive integer up to and including n. (That is, compute both sides and check that they match.) You should print some output as you go -- but printing something for every single integer would probably be overkill. Try to print a manageable amount of data.
︡48b1bdd2-84ae-4304-82a8-48348cbdd5a0︡{"html":"<h2>Problem 6</h2>\n\n<p>I heard somebody claim that for every positive integer $n$ we have</p>\n\n<p>$$(1+2+&#8230;+n)^2 = 1^3 + 2^3 + &#8230; + n^3.$$</p>\n\n<p>Write a program which takes as input a positive integer n and verifies (or disproves) this claim for every positive integer up to and including n. (That is, compute both sides and check that they match.) You should print some output as you go &#8211; but printing something for every single integer would probably be overkill. Try to print a manageable amount of data.</p>\n"}︡
︠33e634d8-88c3-4f27-970b-d1c0a5403764︠

︠5f2b528b-b614-4173-a5cb-ffc0c73db0ba︠

︠82d01b81-f219-466f-ab54-888f3818bb71︠

︠b41f569d-3285-43c8-ac0e-1f9ac9af3059i︠
%md
## Problem 7

Use Sage to solve **at least 5** Project Euler problems from here: <http://projecteuler.net/problems>

Carefully document which of the 5 problems you solved below, along with the solution, so that the graders will be able to verify that you solved them.
︡be779c2d-6726-4f84-b3df-69251abd314c︡{"html":"<h2>Problem 7</h2>\n\n<p>Use Sage to solve <strong>at least 5</strong> Project Euler problems from here: <a href=\"http://projecteuler.net/problems\">http://projecteuler.net/problems</a></p>\n\n<p>Carefully document which of the 5 problems you solved below, along with the solution, so that the graders will be able to verify that you solved them.</p>\n"}︡
︠155a4ae9-681c-4dcc-95f0-45b6f6580ad7︠

︠abc3eae1-3cad-4b89-8c91-dcc3d7cbd482︠

︠22318ca7-a002-46bd-b869-1d0f79625e72︠

︠1afa173b-925c-4a9f-9f31-a76407c28fb9︠

︠f8288dcd-e2a5-4771-a819-4a1df24a0e44︠










︠95e8c4cf-f205-418b-94aa-3303b203dd69i︠
%md

# Math 480b -- Sage Course
## The Command Line Terminal

## April 25, 2014

Screencast: REMEMBER!!!!!! (with sound)

**Plan**

- Homework
    -- your grading of hw3 is due today at 6pm.  I will collect and redistribute it by Saturday morning so at least you'll get some feedback on your project.
    -- your hw4 is due **Sunday at 6pm.**
- Lecture today on Command Line Terminal
︡2adf8c7a-fbc7-498c-a371-e4cb4387f956︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>The Command Line Terminal</h2>\n\n<h2>April 25, 2014</h2>\n\n<p>Screencast: REMEMBER!!!!!! (with sound)</p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li>Homework\n&#8211; your grading of hw3 is due today at 6pm.  I will collect and redistribute it by Saturday morning so at least you&#8217;ll get some feedback on your project.\n&#8211; your hw4 is due <strong>Sunday at 6pm.</strong></li>\n<li>Lecture today on Command Line Terminal</li>\n</ul>\n"}︡
︠a1768089-42df-45c0-9a7f-f89371a04f85︠

︠6629b8ce-36ef-4a61-ac9c-291a8eb25a62︠

︠0ee5e67d-e039-4b66-9827-ad243995bd2ei︠
%md

## The Command Line

- We will talk about bash (=bourne again shell), which is by far the most popular.

- This is what you get when you click "+New-->Command Line Terminal" in SMC.  It's also what you get when you open a terminal on Linux or OS X.   It is *NOT* what you get when you open cmd.exe on Windows.

- You can execute all of the (non-interactive) commands we will mention here in a Sage worksheet or from the sage command-line terminal or from an IPython notebook by preceeding them with !

︡22e31d46-1b68-473c-8d52-60c1cbe72fd9︡{"html":"<h2>The Command Line</h2>\n\n<ul>\n<li><p>We will talk about bash (=bourne again shell), which is by far the most popular.</p></li>\n<li><p>This is what you get when you click &#8220;+New&#8211;>Command Line Terminal&#8221; in SMC.  It&#8217;s also what you get when you open a terminal on Linux or OS X.   It is <em>NOT</em> what you get when you open cmd.exe on Windows.</p></li>\n<li><p>You can execute all of the (non-interactive) commands we will mention here in a Sage worksheet or from the sage command-line terminal or from an IPython notebook by preceeding them with !</p></li>\n</ul>\n"}︡
︠b2b259e0-1d2f-467a-a958-b9e70c28ae44︠
!pwd
︡36ad31a4-c81f-4b17-b649-7ad60a08576a︡{"stdout":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/sage2014/lectures/2014-04-25\n"}︡
︠ca668c07-e250-48d1-934d-35b41c3402e4︠
!ls
︡b4422eaf-26a5-4729-846e-4af3b321ea9f︡{"stdout":"2014-04-25.sagews\n"}︡
︠806f0dd7-cf6a-48dd-82d4-bf95a4dc9a4di︠
%md
- You type stuff at a prompt and output appears.   The command line terminal is extremely powerful.    It mostly solves a similar problem to OS X's finder and other file explorers, but in a completely different way.  Some things that are very hard in a graphical UI become utterly trivial in the command line, and conversely.

- The most import basic commands: **memorize these**
    - `pwd` = **p**rint **w**orking **d**irectory (where you are -- like the folder you are browsing)
    - `ls` = **list** the files in the working directory
    - `cd <path>` = **c**hange **d**directory; use forward slashes.  Use .. to go up.
    - `mv <src1> <src2> ... <dest>` = **move** a file (or files) or directory from one place to another (in particular, rename)
    - `cp <src1> <src2> ... <dest>` = **copy** a file from one place to another; use ``cp -r`` to **r**ecursively copy a directory
    - `mkdir <path>` = **make directory**
    - `rm <path>` = **rem**ove a file; or the much more dangerous `rm -rf <path>` = delete it if at all possible.
    - `man <command>` = **man**ual about how to use a command

<br>
- Illustrate each of these in a terminal.  (NOTE: In SMC, the terminal history currently vanishes after a while -- this will likely change though.)
︡69a8ac36-a0c4-4116-b3c5-0c391df2db67︡{"html":"<ul>\n<li><p>You type stuff at a prompt and output appears.   The command line terminal is extremely powerful.    It mostly solves a similar problem to OS X&#8217;s finder and other file explorers, but in a completely different way.  Some things that are very hard in a graphical UI become utterly trivial in the command line, and conversely.</p></li>\n<li><p>The most import basic commands: <strong>memorize these</strong></p>\n\n<ul>\n<li><code>pwd</code> = <strong>p</strong>rint <strong>w</strong>orking <strong>d</strong>irectory (where you are &#8211; like the folder you are browsing)</li>\n<li><code>ls</code> = <strong>list</strong> the files in the working directory</li>\n<li><code>cd &lt;path&gt;</code> = <strong>c</strong>hange <strong>d</strong>directory; use forward slashes.  Use .. to go up.</li>\n<li><code>mv &lt;src1&gt; &lt;src2&gt; ... &lt;dest&gt;</code> = <strong>move</strong> a file (or files) or directory from one place to another (in particular, rename)</li>\n<li><code>cp &lt;src1&gt; &lt;src2&gt; ... &lt;dest&gt;</code> = <strong>copy</strong> a file from one place to another; use <code>cp -r</code> to <strong>r</strong>ecursively copy a directory</li>\n<li><code>mkdir &lt;path&gt;</code> = <strong>make directory</strong></li>\n<li><code>rm &lt;path&gt;</code> = <strong>rem</strong>ove a file; or the much more dangerous <code>rm -rf &lt;path&gt;</code> = delete it if at all possible.</li>\n<li><code>man &lt;command&gt;</code> = <strong>man</strong>ual about how to use a command</li>\n</ul></li>\n</ul>\n\n<p><br>\n- Illustrate each of these in a terminal.  (NOTE: In SMC, the terminal history currently vanishes after a while &#8211; this will likely change though.)</p>\n"}︡
︠ac8a3fed-f059-488b-b87e-a1b125053a1d︠

︠30289dc6-0392-474a-bdc3-604df6729257i︠
%md
## History

- get it with the up and down arrows.
- type "history" to see it.
- type "![number]" to re-run the numbered command.
︡2aee911a-25e3-4bc7-b925-babb477e8e60︡{"html":"<h2>History</h2>\n\n<ul>\n<li>get it with the up and down arrows.</li>\n<li>type &#8220;history&#8221; to see it.</li>\n<li>type &#8220;![number]&#8221; to re-run the numbered command.</li>\n</ul>\n"}︡
︠ba8f9b80-e718-495c-b610-3e3ba2105d36︠

︠578d1665-0f01-45ac-b658-4238691b6142︠

︠dede8158-de3e-43e5-9739-1b7a7327f7b5i︠
%md
## History

︡05f31ba1-e14c-4d72-8c5b-be0d2d52a10a︡{"html":"<h2>History</h2>\n"}︡
︠91c1ae64-eafd-4a58-8f52-07ca7655d166︠
# These guys created Unix in the 70s...
salvus.file("Ken_n_dennis.jpg")
︡75c88def-dc7a-483d-913e-a7e937f61de5︡{"once":false,"file":{"show":true,"uuid":"6e31defa-2f9e-44d0-8a12-946affbe23f8","filename":"Ken_n_dennis.jpg"}}︡
︠037a1728-9025-4af9-b135-4b7a8fdbec2a︠
# Actual 1979 Unix (Version 7) running:
salvus.file("unix1979.png")
︡8f9ab1ba-5dfd-404b-9edc-c5ca11edc515︡{"once":false,"file":{"show":true,"uuid":"b20d0180-0c9a-4b40-ac41-2756f6fcb7dc","filename":"unix1979.png"}}︡
︠19e23ebb-7619-4adf-83a6-deec44063f81︠
# It looks similar 35 years later!
!ls -l /usr
︡c83d205a-a630-4151-ab74-bd3edd460daf︡{"stdout":"total 184\ndrwxr-xr-x   2 root root 69632 Apr 25 13:56 bin\ndrwxr-xr-x   2 root root  4096 Mar  2 02:21 games\ndrwxr-xr-x 107 root root 20480 Mar 25 05:59 include\ndrwxr-xr-x 159 root root 45056 Apr 25 13:56 lib\ndrwxr-xr-x   3 root root  4096 Jan 16 03:43 lib32\ndrwxr-xr-x   3 root root  4096 Apr 25  2013 libexec\ndrwxr-xr-x  13 root root  4096 Nov 27 05:54 local\ndrwxr-xr-x   2 root root 12288 Apr  9 22:20 sbin\ndrwxr-xr-x 237 root root 12288 Mar 25 05:59 share\ndrwxr-xr-x  12 root root  4096 Mar 20 03:04 src\n"}︡
︠c3bf9e5c-19cf-4648-8de2-21ad4c67a2bc︠

︠794adffd-dfbf-4093-9659-1e9cc86c6833i︠
%md

## What makes the terminal so powerful...

- Use **tab completion** (in the actual terminal) to complete file names

- You can use **patterns** to specify the files or directories that are arguments to commands

- You can **redirect** the input or output of a command.

- You can **combine** commands together via pipes (sort of like composing functions).

- You can temporarily pause (control-Z) and restart (fg) commands (and much more).

- There are **thousands** (!) of additional commands like the above, which all work in a uniform way: `cal 2014`, `grep`, `du`, ...


Slowly and carefully illustrate the above points using the following commands:

    ls, grep, du, find, man , sage, ipython, gp, git

︡34d6179d-395d-439f-a2b4-5fe963a6bc0e︡{"html":"<h2>What makes the terminal so powerful&#8230;</h2>\n\n<ul>\n<li><p>Use <strong>tab completion</strong> (in the actual terminal) to complete file names</p></li>\n<li><p>You can use <strong>patterns</strong> to specify the files or directories that are arguments to commands</p></li>\n<li><p>You can <strong>redirect</strong> the input or output of a command.</p></li>\n<li><p>You can <strong>combine</strong> commands together via pipes (sort of like composing functions).</p></li>\n<li><p>You can temporarily pause (control-Z) and restart (fg) commands (and much more).</p></li>\n<li><p>There are <strong>thousands</strong> (!) of additional commands like the above, which all work in a uniform way: <code>cal 2014</code>, <code>grep</code>, <code>du</code>, &#8230;</p></li>\n</ul>\n\n<p>Slowly and carefully illustrate the above points using the following commands:</p>\n\n<pre><code>ls, grep, du, find, man , sage, ipython, gp, git\n</code></pre>\n"}︡
︠fd06dfdf-c3b8-4f3f-b947-5917b611b2ea︠

︠7f37a149-f51f-43c6-af27-a674ae071310︠

︠ea494c22-d070-47d8-a387-abc35100775fi︠
%md
## Summary of key ideas

- The man command documents every command
- Use patterns to specify filenames
- Use `foo [...] | bar [...]` to make the output of foo be the input to bar
- Use `foo [...] > output_file` to redirect the output of foo to the given file, and Use `foo [...] < input_file` to make input to foo come from the given file.
- The most important commands are: man, ls, cd, mv, cp
- When you figure out how to do something, write down the "command line" that does it somewhere.  You can paste it in later, or tell other people about it... and it is very highly likely to work forever, since UNIX is quite stable (over many decades).

︡7ae6a2db-062b-4be9-be46-6278c7fcc9d4︡{"html":"<h2>Summary of key ideas</h2>\n\n<ul>\n<li>The man command documents every command</li>\n<li>Use patterns to specify filenames</li>\n<li>Use <code>foo [...] | bar [...]</code> to make the output of foo be the input to bar</li>\n<li>Use <code>foo [...] &gt; output_file</code> to redirect the output of foo to the given file, and Use <code>foo [...] &lt; input_file</code> to make input to foo come from the given file.</li>\n<li>The most important commands are: man, ls, cd, mv, cp</li>\n<li>When you figure out how to do something, write down the &#8220;command line&#8221; that does it somewhere.  You can paste it in later, or tell other people about it&#8230; and it is very highly likely to work forever, since UNIX is quite stable (over many decades).</li>\n</ul>\n"}︡
︠d6097b97-0de0-48ca-87ba-b063887a667b︠

︠f408e0f3-4c8c-41f9-8fdb-f72870aa96e2︠

︠e598a4a1-3eeb-4943-947c-e72cd7aaa898︠

︠c552a79d-22df-44ac-a5cd-4326f0ca38abi︠
%md

Other: In SMC (and OS X), you can open a file or folder in the graphical interface by typing `open filename`
︡f4342a75-9c63-4ff5-8721-d75cea01f267︡{"html":"<p>Other: In SMC (and OS X), you can open a file or folder in the graphical interface by typing <code>open filename</code></p>\n"}︡
︠d4c636a8-b708-47cd-92bc-2ff9275f0567︠

︠0da88b0d-a716-4fe8-8e1b-908bff44eb9c︠










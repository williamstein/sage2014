︠95e8c4cf-f205-418b-94aa-3303b203dd69i︠
%md

# Math 480b -- Sage Course
## The Command Line Terminal

## April 28, 2014

Screencast: <http://youtu.be/AOmUj4c7H4k>

**Plan**

- Questions
- Homework
    -- hw4 collected and grading of hw4 has been assigned.
    -- hw5 assigned
- More on the command line terminal
- Git revision control
︡e48fffdd-caed-4818-9593-10f6929dd790︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>The Command Line Terminal</h2>\n\n<h2>April 28, 2014</h2>\n\n<p>Screencast: <a href=\"http://youtu.be/AOmUj4c7H4k\">http://youtu.be/AOmUj4c7H4k</a></p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li>Questions</li>\n<li>Homework\n&#8211; hw4 collected and grading of hw4 has been assigned.\n&#8211; hw5 assigned</li>\n<li>More on the command line terminal</li>\n<li>Git revision control</li>\n</ul>\n"}︡
︠e68236ea-4900-4917-9406-6440c2a7e3a8︠

︠cb5fdc17-a5fd-4126-9e10-2f514ecc1c3fi︠
%md
## The Command Line: part 2

︡8916d432-784d-4a73-9ab0-75a5f6c15087︡{"html":"<h2>The Command Line: part 2</h2>\n"}︡
︠96beef86-bd88-46c8-aaa5-3e8afa9f59ad︠

︠794adffd-dfbf-4093-9659-1e9cc86c6833i︠
%md

## What makes the terminal so powerful...

- Use **tab completion** (in the actual terminal) to complete file names

- You can use **patterns** to specify the files or directories that are arguments to commands

- You can **redirect** the input or output of a command.

- You can **combine** commands together via pipes (sort of like composing functions).

- You can temporarily pause (control-Z) and restart (fg) commands (and much more).

- There are **thousands** (!) of additional commands like the above, which all work in a uniform way: `cal 2014`, `grep`, `du`, ...


Illustrate some of the above points using the following commands:

    ls, grep, du, find, man , sage, ipython, gp, git

︡3c829ae3-b638-4971-b671-7e5f326c6ade︡{"html":"<h2>What makes the terminal so powerful&#8230;</h2>\n\n<ul>\n<li><p>Use <strong>tab completion</strong> (in the actual terminal) to complete file names</p></li>\n<li><p>You can use <strong>patterns</strong> to specify the files or directories that are arguments to commands</p></li>\n<li><p>You can <strong>redirect</strong> the input or output of a command.</p></li>\n<li><p>You can <strong>combine</strong> commands together via pipes (sort of like composing functions).</p></li>\n<li><p>You can temporarily pause (control-Z) and restart (fg) commands (and much more).</p></li>\n<li><p>There are <strong>thousands</strong> (!) of additional commands like the above, which all work in a uniform way: <code>cal 2014</code>, <code>grep</code>, <code>du</code>, &#8230;</p></li>\n</ul>\n\n<p>Illustrate some of the above points using the following commands:</p>\n\n<pre><code>ls, grep, du, find, man , sage, ipython, gp, git\n</code></pre>\n"}︡
︠fd06dfdf-c3b8-4f3f-b947-5917b611b2ea︠

︠7f37a149-f51f-43c6-af27-a674ae071310︠

︠ea494c22-d070-47d8-a387-abc35100775fi︠
%md
## Key ideas

- The man command documents every command
- Use patterns to specify filenames
- Use `foo [...] | bar [...]` to make the output of foo be the input to bar
- Use `foo [...] > output_file` to redirect the output of foo to the given file, and Use `foo [...] < input_file` to make input to foo come from the given file.
- The most important commands are: man, ls, cd, mv, cp
- When you figure out how to do something, write down the "command line" that does it somewhere.  You can paste it in later, or tell other people about it... and it is very highly likely to work forever, since UNIX is quite stable (over many decades).

︡f3facad9-6ff9-41ef-a621-a9d5dd353747︡{"html":"<h2>Key ideas</h2>\n\n<ul>\n<li>The man command documents every command</li>\n<li>Use patterns to specify filenames</li>\n<li>Use <code>foo [...] | bar [...]</code> to make the output of foo be the input to bar</li>\n<li>Use <code>foo [...] &gt; output_file</code> to redirect the output of foo to the given file, and Use <code>foo [...] &lt; input_file</code> to make input to foo come from the given file.</li>\n<li>The most important commands are: man, ls, cd, mv, cp</li>\n<li>When you figure out how to do something, write down the &#8220;command line&#8221; that does it somewhere.  You can paste it in later, or tell other people about it&#8230; and it is very highly likely to work forever, since UNIX is quite stable (over many decades).</li>\n</ul>\n"}︡
︠d6097b97-0de0-48ca-87ba-b063887a667b︠

︠f408e0f3-4c8c-41f9-8fdb-f72870aa96e2︠

︠e598a4a1-3eeb-4943-947c-e72cd7aaa898︠

︠c552a79d-22df-44ac-a5cd-4326f0ca38abi︠
%md
## Git:

   *"Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."*

Why learn (basics of) git:

   - It is the **most popular revision control system** for *open source* development.

   - It is used for **Sage development**, so you should know something about git to contribute to Sage.  Similar remarks for many other open source projects.

   - It could **save your ass**: it's a massively cleaner way to save revisions of a document (with a comment on each revision) than just making lots of random copies all over the place.  People who do serious computer-based work and don't use revision control will almost certainly spend several **days** of their lives recreating documents they stupidly lost.   Instead, spend that time learning git.

   - It facilities **synchronization**: Useful when collaborating with other people or when you have a program on several computers.

︡88819b9d-c1c6-4e3b-a087-bf98e0a40ac3︡{"html":"<h2>Git:</h2>\n\n<p><em>\"Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.\"</em></p>\n\n<p>Why learn (basics of) git:</p>\n\n<ul>\n<li><p>It is the <strong>most popular revision control system</strong> for <em>open source</em> development.</p></li>\n<li><p>It is used for <strong>Sage development</strong>, so you should know something about git to contribute to Sage.  Similar remarks for many other open source projects.</p></li>\n<li><p>It could <strong>save your ass</strong>: it&#8217;s a massively cleaner way to save revisions of a document (with a comment on each revision) than just making lots of random copies all over the place.  People who do serious computer-based work and don&#8217;t use revision control will almost certainly spend several <strong>days</strong> of their lives recreating documents they stupidly lost.   Instead, spend that time learning git.</p></li>\n<li><p>It facilities <strong>synchronization</strong>: Useful when collaborating with other people or when you have a program on several computers.</p></li>\n</ul>\n"}︡
︠d9bb93b4-8848-490a-9bf1-c3500d8b965ai︠
salvus.file("users.png")
︡633c3fdc-c7f4-4cc4-9dba-76f92bb020e4︡{"once":false,"file":{"show":true,"uuid":"67d459a6-d8d4-458b-a424-f5c39dfbd44b","filename":"users.png"}}︡
︠0e9a2a41-40f2-4042-b012-94b8a4ebda65︠

︠5be43623-d151-4e2e-9b66-fcf564ab8a5ci︠
%md
## A Very Basic Git Tutorial

Do this all in a brand new project

- Create a new git repository: make a directory, then run `git init` in it.

        mkdir example
        cd example
        git init

- Create a file, add it, commit.

        echo "my awesome content" > my_file
        git add my_file
        git status
        git commit -a -v
        # fix issues with identity

- Change the file, look at what has changed, commit.

        echo "my super awesome content" >> my_file
        git commit -a -v

- Make changes then throw them away

        echo "so awesome" >> my_file
        git diff --color
        git checkout my_file
        cat my_file

- Checkout early version

        git checkout <SHA1 HASH> my_file
        cat my_file
        get checkout HEAD
        cat my_file

- Create a github account

        https://github.com

- Create a corresponding project on github

        ...

- Push our repo there.

        ssh-keygen
        open ~/.ssh/id_rsa.pub   # copy this to github
        git push ...

- Clone it from github to somewhere else

        cd ~
        git clone ... example-clone


- Save some changes

        cd example-clone
        echo "pretty cool" >> my_file
        git commit -a -v
        git push

- Look online and see the commits

- Pull into our original repo

        git pull

︡24b59abf-2eac-4bd4-8931-ab595b607b3f︡{"html":"<h2>A Very Basic Git Tutorial</h2>\n\n<p>Do this all in a brand new project</p>\n\n<ul>\n<li><p>Create a new git repository: make a directory, then run <code>git init</code> in it.</p>\n\n<pre><code>mkdir example\ncd example\ngit init\n</code></pre></li>\n<li><p>Create a file, add it, commit.</p>\n\n<pre><code>echo \"my awesome content\" &gt; my_file\ngit add my_file\ngit status\ngit commit -a -v\n# fix issues with identity\n</code></pre></li>\n<li><p>Change the file, look at what has changed, commit.</p>\n\n<pre><code>echo \"my super awesome content\" &gt;&gt; my_file\ngit commit -a -v\n</code></pre></li>\n<li><p>Make changes then throw them away</p>\n\n<pre><code>echo \"so awesome\" &gt;&gt; my_file\ngit diff --color\ngit checkout my_file\ncat my_file\n</code></pre></li>\n<li><p>Checkout early version</p>\n\n<pre><code>git checkout &lt;SHA1 HASH&gt; my_file\ncat my_file\nget checkout HEAD\ncat my_file\n</code></pre></li>\n<li><p>Create a github account</p>\n\n<pre><code>https://github.com\n</code></pre></li>\n<li><p>Create a corresponding project on github</p>\n\n<pre><code>...\n</code></pre></li>\n<li><p>Push our repo there.</p>\n\n<pre><code>ssh-keygen\nopen ~/.ssh/id_rsa.pub   # copy this to github\ngit push ...\n</code></pre></li>\n<li><p>Clone it from github to somewhere else</p>\n\n<pre><code>cd ~\ngit clone ... example-clone\n</code></pre></li>\n<li><p>Save some changes</p>\n\n<pre><code>cd example-clone\necho \"pretty cool\" &gt;&gt; my_file\ngit commit -a -v\ngit push\n</code></pre></li>\n<li><p>Look online and see the commits</p></li>\n<li><p>Pull into our original repo</p>\n\n<pre><code>git pull\n</code></pre></li>\n</ul>\n"}︡
︠3450101e-31a2-4e17-bcdb-87d35cda349a︠

︠22d05050-c90b-40bf-92f2-37d648e5d655︠

︠507e834f-cc3a-41fa-8d2e-ac8a42b2b2ae︠

︠9272ea60-71e6-4765-af82-1d3132a16dcc︠

︠4c24e65d-0233-407c-aaab-ae23edc4cb15︠











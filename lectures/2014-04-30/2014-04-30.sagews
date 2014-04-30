︠95e8c4cf-f205-418b-94aa-3303b203dd69i︠
%md

# Math 480b -- Sage Course
## Git

## April 30, 2014

Screencast: REMIND ME!!!!!!! ?!

**Plan**

- Questions
- Homework reminder
    -- grading of hw4 due Friday
    -- hw5 due Friday
    -- every student in the class did their grading of hw3 and also did hw3 -- good job!
- Git -- it will take today and Friday to get through all of this.  Next week will be how to do Sage development. <http://www.sagemath.org/doc/developer/>
︡a025f949-fb25-4008-ba53-a1ef527c98a3︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>Git</h2>\n\n<h2>April 30, 2014</h2>\n\n<p>Screencast: REMIND ME!!!!!!! ?!</p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li>Questions</li>\n<li>Homework reminder\n&#8211; grading of hw4 due Friday\n&#8211; hw5 due Friday\n&#8211; every student in the class did their grading of hw3 and also did hw3 &#8211; good job!</li>\n<li>Git &#8211; it will take today and Friday to get through all of this.  Next week will be how to do Sage development. <a href=\"http://www.sagemath.org/doc/developer/\">http://www.sagemath.org/doc/developer/</a></li>\n</ul>\n"}︡
︠e68236ea-4900-4917-9406-6440c2a7e3a8i︠
%md

NOTES:

 - I've been doing tons of upgrades to SageMathCloud. FYI.
 - I like <http://git-scm.com/book>


︡1c2e540d-ea46-4495-91c0-a3ee65c7dbd4︡{"html":"<p>NOTES: </p>\n\n<ul>\n<li>I&#8217;ve been doing tons of upgrades to SageMathCloud. FYI.</li>\n<li>I like <a href=\"http://git-scm.com/book\">http://git-scm.com/book</a></li>\n</ul>\n"}︡
︠5be43623-d151-4e2e-9b66-fcf564ab8a5ci︠
%md
## Git Tutorial -- part 1
### Starting a new open source project using SageMathCloud and GitHub

I will do this all in a *brand new SageMathCloud project*.

- Create a new git repository: make a directory, then run `git init` in it.

        mkdir gauss
        cd gauss
        git init

- Create a file, add it, commit.

        <create a minimal Gaussian rational file gauss.sage>
        git add gauss.sage
        git status
        git commit -a -v
        # fix issues with identity...

- Change the file, look at what has changed, commit.

        <change the file>
        git commit -a -v

- Make changes then throw them away


        <make some changes>
        git diff --color
        git checkout gauss.sage
        cat gauss.sage

- Checkout early version

        git checkout <SHA1 HASH> gauss.sage
        cat gauss.sage
        get checkout HEAD
        cat gauss.sage

- Create a Github account

        https://github.com

- Create a corresponding project on github

        ...

- Push our repo there.

        ssh-keygen
        open ~/.ssh/id_rsa.pub   # copy this to github
        git push ...

- Clone it from Github to somewhere else

        cd ~
        git clone ... gauss-clone


- Save some changes

        cd gauss-clone
        open gauss.sage  # edit and save
        git commit -a -v
        git push

- Look online and see the commits

- Pull into our original repo

        git pull

︡84c3172e-4410-420c-9b3c-940f2baf9301︡{"html":"<h2>Git Tutorial &#8211; part 1</h2>\n\n<h3>Starting a new open source project using SageMathCloud and GitHub</h3>\n\n<p>I will do this all in a <em>brand new SageMathCloud project</em>.</p>\n\n<ul>\n<li><p>Create a new git repository: make a directory, then run <code>git init</code> in it.</p>\n\n<pre><code>mkdir gauss\ncd gauss\ngit init\n</code></pre></li>\n<li><p>Create a file, add it, commit.</p>\n\n<pre><code>&lt;create a minimal Gaussian rational file gauss.sage&gt;\ngit add gauss.sage\ngit status\ngit commit -a -v\n# fix issues with identity...\n</code></pre></li>\n<li><p>Change the file, look at what has changed, commit.</p>\n\n<pre><code>&lt;change the file&gt;\ngit commit -a -v\n</code></pre></li>\n<li><p>Make changes then throw them away</p>\n\n<pre><code>&lt;make some changes&gt;\ngit diff --color\ngit checkout gauss.sage\ncat gauss.sage\n</code></pre></li>\n<li><p>Checkout early version</p>\n\n<pre><code>git checkout &lt;SHA1 HASH&gt; gauss.sage\ncat gauss.sage\nget checkout HEAD\ncat gauss.sage\n</code></pre></li>\n<li><p>Create a Github account</p>\n\n<pre><code>https://github.com\n</code></pre></li>\n<li><p>Create a corresponding project on github</p>\n\n<pre><code>...\n</code></pre></li>\n<li><p>Push our repo there.</p>\n\n<pre><code>ssh-keygen\nopen ~/.ssh/id_rsa.pub   # copy this to github\ngit push ...\n</code></pre></li>\n<li><p>Clone it from Github to somewhere else</p>\n\n<pre><code>cd ~\ngit clone ... gauss-clone\n</code></pre></li>\n<li><p>Save some changes</p>\n\n<pre><code>cd gauss-clone\nopen gauss.sage  # edit and save\ngit commit -a -v\ngit push\n</code></pre></li>\n<li><p>Look online and see the commits</p></li>\n<li><p>Pull into our original repo</p>\n\n<pre><code>git pull\n</code></pre></li>\n</ul>\n"}︡
︠b2006722-6d8e-4edd-8b2d-a8c84eff65c5︠

︠3450101e-31a2-4e17-bcdb-87d35cda349ai︠
%md
## Git Tutorial -- part 2 -- collaborate

**(I encourage everybody with a laptop in class right now to do EXACTLY this right now!!)**

- As a different user (williamstein) fork the above gauss project.

- Clone it into my private teaching project.

- Make changes, commit, push.

- Send a github pull request.

- Look at our original project.

︡991b3d11-10d0-4efd-9ee9-aa6fa8fba4ac︡{"html":"<h2>Git Tutorial &#8211; part 2 &#8211; collaborate</h2>\n\n<p><strong>(I encourage everybody with a laptop in class right now to do EXACTLY this right now!!)</strong></p>\n\n<ul>\n<li><p>As a different user (williamstein) fork the above gauss project.</p></li>\n<li><p>Clone it into my private teaching project.</p></li>\n<li><p>Make changes, commit, push.</p></li>\n<li><p>Send a github pull request.</p></li>\n<li><p>Look at our original project.</p></li>\n</ul>\n"}︡
︠dcb5feb8-5afa-4568-97b2-300ce47a41e6︠

︠cb98bf25-3db2-46d5-8860-cb24682b8c07︠

︠63c13e24-dbea-4f5f-8b72-37519a5867f5︠

︠559198a5-5747-4019-b40b-51adb3f93e70i︠
%md
## Git Tutorial - part 3 -- branching

- make a new branch of our project

        git branch
        git branch dev
        git checkout dev   # super lightweight/fast/efficient, even if project is huge

 <br>

- make some changes and commit them

- push them to github as a new branch

     Explain how to *figure out how* to do this by doing a Google search on 'push new branch to remote' and reading Stack overflow.  Note that this search doesn't have the word "git" in it, but the entire first page of results is git-specific, even though one could do the same search for other similar software such as mercurial.


- switch back to the original master branch, and merge the changes from the dev branch.

︡ecf1deb6-d903-4bd6-bac3-2e3c63ed5110︡{"html":"<h2>Git Tutorial - part 3 &#8211; branching</h2>\n\n<ul>\n<li><p>make a new branch of our project</p>\n\n<pre><code>git branch\ngit branch dev\ngit checkout dev   # super lightweight/fast/efficient, even if project is huge\n</code></pre>\n\n<p><br></p></li>\n<li><p>make some changes and commit them</p></li>\n<li><p>push them to github as a new branch</p>\n\n<p>Explain how to <em>figure out how</em> to do this by doing a Google search on &#8216;push new branch to remote&#8217; and reading Stack overflow.  Note that this search doesn&#8217;t have the word &#8220;git&#8221; in it, but the entire first page of results is git-specific, even though one could do the same search for other similar software such as mercurial.</p></li>\n<li><p>switch back to the original master branch, and merge the changes from the dev branch.</p></li>\n</ul>\n"}︡
︠22d05050-c90b-40bf-92f2-37d648e5d655︠

︠507e834f-cc3a-41fa-8d2e-ac8a42b2b2ae︠

︠9272ea60-71e6-4765-af82-1d3132a16dcc︠

︠4c24e65d-0233-407c-aaab-ae23edc4cb15︠











︠95e8c4cf-f205-418b-94aa-3303b203dd69i︠
%md

# Math 480b -- Sage Course
## Git, Build Sage

## May 2, 2014

Screencast: REMIND ME!!!!!!! ?!

**Plan**

- Questions

- Quick project descriptions (go around room)

- Homework reminder
    -- grading of hw4 due TODAY
    -- hw5 due TODAY

- Git -- forking, cloning, branching

- Build Sage from source (do this by Monday -- it should take you about **1 minute of work**)

︡f466298f-fde7-4a46-87ff-bd86a84e905b︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>Git, Build Sage</h2>\n\n<h2>May 2, 2014</h2>\n\n<p>Screencast: REMIND ME!!!!!!! ?!</p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions</p></li>\n<li><p>Quick project descriptions (go around room)</p></li>\n<li><p>Homework reminder\n&#8211; grading of hw4 due TODAY\n&#8211; hw5 due TODAY</p></li>\n<li><p>Git &#8211; forking, cloning, branching</p></li>\n<li><p>Build Sage from source (do this by Monday &#8211; it should take you about <strong>1 minute of work</strong>)</p></li>\n</ul>\n"}︡
︠5da64fcf-04b9-4bb3-b586-990f73f48a28︠

︠117de47f-8c3c-4519-b99d-08a8f9856468︠

︠3450101e-31a2-4e17-bcdb-87d35cda349ai︠
%md
## Git Tutorial: collaborate

**(I encourage everybody with a laptop in class right now to do EXACTLY this right now!!)**

- As a different user (williamstein) fork the gauss project: <https://github.com/Math480bSageCourse/gauss>

- Clone it into my private teaching project.

- Make changes, commit, push.

- Send a github pull request.

- Look at our original project.

- Encourage students in class to do the same.

︡0741a779-648f-4387-bf63-b162b3a86745︡{"html":"<h2>Git Tutorial: collaborate</h2>\n\n<p><strong>(I encourage everybody with a laptop in class right now to do EXACTLY this right now!!)</strong></p>\n\n<ul>\n<li><p>As a different user (williamstein) fork the gauss project: <a href=\"https://github.com/Math480bSageCourse/gauss\">https://github.com/Math480bSageCourse/gauss</a></p></li>\n<li><p>Clone it into my private teaching project.</p></li>\n<li><p>Make changes, commit, push.</p></li>\n<li><p>Send a github pull request.</p></li>\n<li><p>Look at our original project.</p></li>\n<li><p>Encourage students in class to do the same.</p></li>\n</ul>\n"}︡
︠dcb5feb8-5afa-4568-97b2-300ce47a41e6︠

︠cb98bf25-3db2-46d5-8860-cb24682b8c07︠

︠63c13e24-dbea-4f5f-8b72-37519a5867f5︠

︠559198a5-5747-4019-b40b-51adb3f93e70i︠
%md
## Git Tutorial: branching

- make a new branch of our project

        git branch
        git branch dev
        git checkout dev   # super lightweight/fast/efficient, even if project is huge

 <br>

- make some changes and commit them

- push them to github as a new branch

     Explain how to *figure out how* to do this by doing a Google search on 'push new branch to remote' and reading Stack overflow.  Note that this search doesn't have the word "git" in it, but the entire first page of results is git-specific, even though one could do the same search for other similar software such as mercurial.


- switch back to the original master branch, and merge the changes from the dev branch.

︡6ac51792-681a-4f22-b4c0-4ddce1979bea︡{"html":"<h2>Git Tutorial: branching</h2>\n\n<ul>\n<li><p>make a new branch of our project</p>\n\n<pre><code>git branch\ngit branch dev\ngit checkout dev   # super lightweight/fast/efficient, even if project is huge\n</code></pre>\n\n<p><br></p></li>\n<li><p>make some changes and commit them</p></li>\n<li><p>push them to github as a new branch</p>\n\n<p>Explain how to <em>figure out how</em> to do this by doing a Google search on &#8216;push new branch to remote&#8217; and reading Stack overflow.  Note that this search doesn&#8217;t have the word &#8220;git&#8221; in it, but the entire first page of results is git-specific, even though one could do the same search for other similar software such as mercurial.</p></li>\n<li><p>switch back to the original master branch, and merge the changes from the dev branch.</p></li>\n</ul>\n"}︡
︠68b9bdc0-dde4-4352-8641-ba5e0235386f︠

︠22d05050-c90b-40bf-92f2-37d648e5d655︠

︠507e834f-cc3a-41fa-8d2e-ac8a42b2b2ae︠

︠82ee10cb-6330-4222-bfd3-080c6726dc3di︠
%md
## Build your own Sage

In preparation for modifying Sage itself, we will all build our own copies of Sage from source.
This uses lots of disk space... but let's just go for it (you all have 5GB quotas, so should be fine).

        git clone git://github.com/sagemath/sage.git
        cd sage
        make

Then check back in a few hours...

Want to use it?     Type this in the terminal:

        ./sage

Want to use it from a worksheet?  Type this from within the sage directory, then in project settings click "Restart Sage Worksheet Server".

        mkdir ~/bin/
        ln -s `pwd`/sage ~/bin/sage

You can run the test suite (over 200,000 lines of input):

        make test

Curious about disk usage?

        du -sch *


Next week: how to find your way around your shiny new copy of Sage, how to change anything and see the results, etc.



︡93385bb5-bb14-4d80-b75a-a3b6d89995d8︡{"html":"<h2>Build your own Sage</h2>\n\n<p>In preparation for modifying Sage itself, we will all build our own copies of Sage from source.\nThis uses lots of disk space&#8230; but let&#8217;s just go for it (you all have 5GB quotas, so should be fine).</p>\n\n<pre><code>    git clone git://github.com/sagemath/sage.git\n    cd sage\n    make\n</code></pre>\n\n<p>Then check back in a few hours&#8230;</p>\n\n<p>Want to use it?     Type this in the terminal:</p>\n\n<pre><code>    ./sage\n</code></pre>\n\n<p>Want to use it from a worksheet?  Type this from within the sage directory, then in project settings click &#8220;Restart Sage Worksheet Server&#8221;.</p>\n\n<pre><code>    mkdir ~/bin/\n    ln -s `pwd`/sage ~/bin/sage\n</code></pre>\n\n<p>You can run the test suite (over 200,000 lines of input):</p>\n\n<pre><code>    make test\n</code></pre>\n\n<p>Curious about disk usage?</p>\n\n<pre><code>    du -sch *\n</code></pre>\n\n<p>Next week: how to find your way around your shiny new copy of Sage, how to change anything and see the results, etc.</p>\n"}︡
︠e8fb4902-310b-4620-9b66-ce581ce6645c︠

︠03aa79bc-cbdd-4a4c-895c-acf760e77fb5︠

︠9272ea60-71e6-4765-af82-1d3132a16dcc︠

︠4c24e65d-0233-407c-aaab-ae23edc4cb15︠











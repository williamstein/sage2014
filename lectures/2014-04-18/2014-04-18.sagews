︠e3f49162-f049-41f0-ad9c-4cd6b191a01ei︠
%md

# Math 480b -- Sage Course

## April 18, 2014

Screencast: <http://youtu.be/c6st7_3VmDU>

**Plan**

- Questions?

- Homework reminder: everything due tonight at 6pm.

- Python class: the field of rational numbers

- Example decorators: @interact, @parallel, @cached_function, @disk_cached_function

- Something different: some 2D (and maybe 3D?) graphics in Sage


︡a53fce25-a19f-43c6-a829-b425806c1cdb︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>April 18, 2014</h2>\n\n<p>Screencast: <a href=\"http://youtu.be/c6st7_3VmDU\">http://youtu.be/c6st7_3VmDU</a></p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions?</p></li>\n<li><p>Homework reminder: everything due tonight at 6pm.</p></li>\n<li><p>Python class: the field of rational numbers</p></li>\n<li><p>Example decorators: @interact, @parallel, @cached_function, @disk_cached_function</p></li>\n<li><p>Something different: some 2D (and maybe 3D?) graphics in Sage</p></li>\n</ul>\n"}︡
︠6e0f0cf7-274d-436a-bf7d-705157325de0︠
f = open('myfile','w')   # 'r', 'a'
f
︡20153e6c-b4df-4fbd-8cbd-18afd9b9eb39︡{"stdout":"<open file 'myfile', mode 'w' at 0x7acc390>\n"}︡
︠7921310b-52f2-4884-9680-e10a8b5c8df9︠
f.write("hi")
︡a0340ec9-556e-40f5-b9d9-e6207b1f4d8a︡
︠ca0dc23c-038a-4bd3-a843-1e7b1baccffc︠
f.flush()
︡098b8483-02e5-4772-b452-6151683a3446︡
︠3337c3af-43cf-40c1-9db3-c0a1fcf5e5d2︠
f.close()
︡862fa083-c408-4969-9386-0be086357ebf︡
︠5ac07e2e-8f86-4dad-82a9-90226cd040ab︠

︠adef80f7-9d95-4827-bb8c-f0a24c4ea806i︠
%md
## Another Python Class: The Field of Rational Numbers

- quick review: look at rational.sage
- goal: make a class that models "The Field of Rational Numbers"
︡81284875-f78c-4678-bdb6-1c5e7aeb2041︡{"html":"<h2>Another Python Class: The Field of Rational Numbers</h2>\n\n<ul>\n<li>quick review: look at rational.sage</li>\n<li>goal: make a class that models &#8220;The Field of Rational Numbers&#8221;</li>\n</ul>\n"}︡
︠c632714e-3e2b-4acd-9c41-c4d6a074f96b︠
class RationalField:
    def __init__(self):
        pass
    
    def __repr__(self):
        return "The Rational Numbers"
    def cardinality(self):
        return "really, really big (infinite!)"
    def __iter__(self):  # wrong
        i = 0
        while True:
            yield i
            i += 1
︡8d4a9a12-a2b5-4f67-b8a7-ac7dc51eb454︡
︠23e71d7f-b4ba-4679-92ed-2a7de8d69ae8︠
Q = RationalField()
Q
︡fdcf9cfe-9b8d-44bc-8570-65a9bfcce677︡{"stdout":"The Rational Numbers\n"}︡
︠59af0654-7857-4a8d-8021-9d92d9aed039︠
QQ
︡2c8b57c7-bd04-42ac-bb0f-c1f230d41a2b︡{"stdout":"Rational Field\n"}︡
︠e30b3d5e-d016-4b58-af28-14ffb1ac4029︠
j = 0
for n in QQ:
    j += 1
    print n,
    if j > 1000:
        break
    
︠a0f14d60-2cb6-467f-8d8e-31efa65fe607︠
%load rational.sage
class RationalField:
    def __init__(self):
        pass
    def __repr__(self):
        return "The Rational Numbers"
    def cardinality(self):
        return "really, really big (infinite!)"
    def __iter__(self):  # wrong
        i = 0
        while True:
            yield i
            i += 1
    def __call__(self, n, d):
        return RationalNumber(n, d)              
︡f6f0510a-b23d-457e-86af-d1f10a632b08︡
︠bf8e3abc-93e6-4805-9801-b410d8a58c25︠
Q = RationalField()
Q
︡6b15aa42-68e0-4fcf-ade7-8064049592b1︡{"stdout":"The Rational Numbers\n"}︡
︠0bb455c9-e013-415f-8b22-520b788c6b3d︠
Q(2,3)
︡597c7454-0b10-41e0-9a79-8cc7bd70e508︡{"stdout":"2/3\n"}︡
︠85d167c7-4215-43b0-891a-252130587ac3︠
Q(-5,1)
︡0672158a-9b29-4899-911f-59c2fa23b60a︡{"stdout":"-5/1\n"}︡
︠bf9d8ad1-8af0-46d3-be58-1f3617bf37f9︠
QQ.zero_ideal()
︡6544a3c3-4374-4fd5-bbd6-2159f0762e95︡{"stdout":"Principal ideal (0) of Rational Field\n"}︡
︠bd7fee18-6a96-4101-9634-30172a368d8a︠
random_matrix(QQ,10)
︡3466ebb0-4558-427f-97a2-62e95b8dbc5b︡{"stdout":"[  -1    0    2    0  1/2    1    0   -2   -1    0]\n[   1    0   -1    2    0    0    0    0   -1    0]\n[  -2    0    0    0    0    1   -1    0    0   -1]\n[   0    0   -1 -1/2    1   -1    1    1    1    0]\n[ 1/2    1    0    1    0  1/2    0   -1    0    2]\n[   1    0   -2    0    0    0    2   -2    0  1/2]\n[   0    1    2    1    1 -1/2   -2    1    0   -2]\n[ 1/2    0    2   -2   -1  1/2    0   -2    1  1/2]\n[   0   -2   -1    2    2   -2    0    2  1/2   -2]\n[   0  1/2    0   -2    2   -2   -2    0   -1   -1]\n"}︡
︠807f1eeb-e3f1-4632-968c-5eeea9e5b06f︠
show(QQ)
︡0860f0c4-cf11-43e1-9772-c39ecb1c16d5︡{"tex":{"tex":"\\Bold{Q}","display":true}}︡
︠d3d62f74-f33d-4887-85fe-45c9c2e37042︠
latex(QQ)
︡6afddbc6-2499-4bb1-86b5-01b0996293cb︡{"stdout":"\\Bold{Q}\n"}︡
︠f68864e9-3335-478f-a1ed-7edd5ac637de︠

︠00068502-a5c1-4fa5-9190-f96351e4d615i︠
%md
## Example Decorators

(these are sage-specific)

### @cached_function
︡b88af414-d6e5-4501-92b4-95f5675df701︡{"html":"<h2>Example Decorators</h2>\n\n<p>(these are sage-specific)</p>\n\n<h3>@cached_function</h3>\n"}︡
︠ac2b6786-a746-4c18-a00c-0fdd75e2a8a2︠
@foo
def f(...):
    ...

THE SAME AS

def f(...):
    ....
f = foo(f)    
︠814239ce-e70a-4e23-8bc6-6f0889def916︠

︠dcff7e7a-8b9c-430e-bb2f-89a87d70eb9a︠

︠e1404d7a-82f0-413e-9725-f85d32aaef44︠
cached_function
︠0b3579d9-a32f-4f44-bdab-dd25f2a8fd0b︠
def stupid(n):
    print "uhhhhh..."
    sys.stdout.flush()
    sleep(2)
    return n*n
︡16b3217b-c806-4d6e-a485-74093ec35c7f︡
︠2a297875-1e1f-4752-b164-8de6aaa54500︠
stupid(17)
︡dc0a5833-d42e-4da5-a7a1-a237d3e852c1︡{"stdout":"uhhhhh...\n"}︡{"stdout":"289"}︡{"stdout":"\n"}︡
︠0032627e-4007-4601-ae96-8b50823fbc82︠
@cached_function
def stupid(n):
    print "uhhhhh..."
    sys.stdout.flush()
    sleep(2)
    return n*n
︡c941e084-b880-4e43-b165-41e59b21b77d︡
︠9e5e0ed8-42c7-4ccc-a69c-b82694d669d3︠
stupid(17)
︡bc14a375-65bc-4bdc-8e34-4cdf6c2dc15f︡{"stdout":"uhhhhh...\n"}︡{"stdout":"289"}︡{"stdout":"\n"}︡
︠33ce0c20-9543-47fb-8b8a-a5fe9277c69c︠
stupid(17)
︡ed132920-5f1e-49a7-ac2b-5a1be9bcb327︡{"stdout":"289\n"}︡
︠58d891eb-b58c-4f94-9824-886e2bbd06f9︠
get_memory_usage()
︡57b583a7-1d0e-4b8c-8811-5774bd69e4de︡{"stdout":"1060.99609375\n"}︡
︠14a5991e-7cdf-4052-a0c6-de6bbc735567︠
stupid(178)
︡114cd567-a16b-4b87-a4d8-6b29bf2ee715︡{"stdout":"uhhhhh...\n"}︡{"stdout":"31684"}︡{"stdout":"\n"}︡
︠1f731122-3da1-4d01-bd5a-8f4b2f7b002a︠
get_memory_usage()
︡f4f2167e-dfcb-424b-8eb7-a35e0daf90d1︡{"stdout":"1060.99609375\n"}︡
︠3538ed3d-fe7b-4e6c-ad28-5ea2437d1d88︠

︠0f31791b-585e-43a4-8bf4-c2c8c9c06742i︠
%md
### @disk_cached_function
︡3f6aec4a-6aa8-40f4-9eb6-c00afc5c865c︡{"html":"<h3>@disk_cached_function</h3>\n"}︡
︠ac432465-a3a3-480d-af91-0c7590809ec4︠
disk_cached_function(
︠e126dd01-2dc2-4ee5-b2d2-5a87e355d14b︠
@disk_cached_function('stupid')
def stupid(n):
    print "uhhhhh..."
    sys.stdout.flush()
    sleep(2)
    return n*n
︡008120e8-30b0-4e4b-803b-80500aadadc6︡
︠eab526c5-e24e-47f3-bdb5-e400fdda8851︠
stupid(1457)
︡ca3e552c-901e-4561-b0b5-d06e39091e1c︡{"stdout":"uhhhhh...\n"}︡{"stdout":"2122849"}︡{"stdout":"\n"}︡
︠a77b222e-86a1-44b8-b8c5-b3a51770defc︠
%time stupid(1457)
︡e7b95f61-1eb7-42cf-8ab9-67edbb9bad7d︡{"stdout":"2122849\n"}︡{"stdout":"CPU time: 0.00 s, Wall time: 0.00 s\n"}︡
︠d0207427-b818-473b-8034-2a998705339c︠
# don't do the above millions of times.
USE sqlite
︠91b4f35c-9b1e-459e-80bf-72e1a4c18d08︠
import sqlite3
︡ff469beb-7bc1-4e5b-9d36-64c81700d7f4︡
︠e4d0a152-caca-4298-9f19-0f5df6d04ba6︠

︠d786bd5a-07ae-4f29-9b28-f47759ee8629i︠
%md
### @interact
︡07b1aa63-bc97-4eac-bf12-5abc93445c52︡{"html":"<h3>@interact</h3>\n"}︡
︠cbb4ad2d-a5d9-4f26-9d83-5d2b291674d0︠
@interact
def f(n=[1..12], m=(1..100), c=Color('red')):
    print "%s * %s = %s"%(n,m, n*m)
    print "c = ", c
︡738fb100-cc95-4d3c-aeca-da847a947b6e︡{"interact":{"style":"None","flicker":false,"layout":[[["n",12,null]],[["m",12,null]],[["c",12,null]],[["",12,null]]],"id":"091b83b8-4c7a-4c66-b7e8-e09d76aa37ac","controls":[{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["1","2","3","4","5","6","7","8","9","10","11","12"],"label":"n","nrows":null,"width":null,"var":"n"},{"control_type":"slider","default":0,"var":"m","width":null,"vals":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"],"animate":true,"label":"m","display_value":true},{"widget":null,"control_type":"color-selector","hide_box":false,"Color":"<class 'sage.plot.colors.Color'>","label":"c","default":"#ff0000","readonly":false,"var":"c"}]}}︡
︠cc743140-4e8a-4863-b5cd-1e3d6b0ad9d6︠
f.m = 50
f.n = 4
f.c = 'green'
︡135da504-b656-4287-922d-63cc4f9992fb︡{"obj":"{\"var\": \"m\", \"default\": 49, \"id\": \"091b83b8-4c7a-4c66-b7e8-e09d76aa37ac\"}","javascript":{"coffeescript":false,"code":"worksheet.set_interact_var(obj)"},"once":false}︡{"obj":"{\"var\": \"n\", \"default\": 3, \"id\": \"091b83b8-4c7a-4c66-b7e8-e09d76aa37ac\"}","javascript":{"coffeescript":false,"code":"worksheet.set_interact_var(obj)"},"once":false}︡{"obj":"{\"var\": \"c\", \"default\": \"#008000\", \"id\": \"091b83b8-4c7a-4c66-b7e8-e09d76aa37ac\"}","javascript":{"coffeescript":false,"code":"worksheet.set_interact_var(obj)"},"once":false}︡
︠8872ecff-ea14-4895-92a4-2f05a3c9dd53︠
f(4,5)
︡70c4a8c0-cd88-4256-b86d-311762aa02b9︡{"stdout":"4 * 5 = 20\n"}︡
︠2c7ba6a8-5dba-47e7-bfc4-c92e144c6315︠
f(17,18)
︡5b5c4afe-e8ad-4014-955e-3d334b550aa3︡{"stdout":"17 * 18 = 306\n"}︡
︠173f50bc-05c7-49a5-bc84-916bc1a4df72︠

︠a362cc68-4ff2-4ed8-8723-2cb3669e803e︠

︠2342fd35-15a8-458a-bf81-1420980d49e3i︠
%md
### @parallel
︡95d0b525-5fa4-41ee-8120-1a9ec4e5cee6︡{"html":"<h3>@parallel</h3>\n"}︡
︠07164383-80dc-489f-a76b-88b1a66d8b9f︠

︠15a6d0ae-2089-435e-8a84-ab9ad2d4eec8︠

︠b68da378-79a4-4ba6-8226-282b04d2076a︠

︠974ddef9-633e-430a-bd4b-964cdb3c1f50︠

︠e740094c-4035-48fc-952c-5e54d314ce5a︠

︠db920b14-abaf-4850-badd-016750785d8di︠
%md
## Some graphics in Sage

- How do I plot a function?
- How do I plot a polygon?
- Plot a random walk?
- Matplotlib plotting: http://matplotlib.org/gallery.html
- Some regular polytopes, random sphere, function of two variables.
︡4893695b-1707-4f87-9253-9bd68a7e1dfb︡{"html":"<h2>Some graphics in Sage</h2>\n\n<ul>\n<li>How do I plot a function?</li>\n<li>How do I plot a polygon?</li>\n<li>Plot a random walk?</li>\n<li>Matplotlib plotting: http://matplotlib.org/gallery.html</li>\n<li>Some regular polytopes, random sphere, function of two variables.</li>\n</ul>\n"}︡
︠4f367c4e-e30f-46f4-bd62-e5bb24b63318︠
import matplotlib.pyplot as plt


# The slices will be ordered and plotted counter-clockwise.
labels = 'Frogs', 'Hogs', 'Dogs', 'Logs'
sizes = [15, 30, 45, 10]
colors = ['yellowgreen', 'gold', 'lightskyblue', 'lightcoral']
explode = (0, 0.1, 0, 0) # only "explode" the 2nd slice (i.e. 'Hogs')

plt.pie(sizes, explode=explode, labels=labels, colors=colors,
        autopct='%1.1f%%', shadow=True, startangle=90)
# Set aspect ratio to be equal so that pie is drawn as a circle.
plt.axis('equal')
plt.show()
︡3834e85b-ebe6-42a4-8e45-6c07f66c7f71︡{"stdout":"([<matplotlib.patches.Wedge object at 0x7a98510>, <matplotlib.patches.Wedge object at 0x7895f10>, <matplotlib.patches.Wedge object at 0x7895cd0>, <matplotlib.patches.Wedge object at 0x7b9b610>], [<matplotlib.text.Text object at 0x7a988d0>, <matplotlib.text.Text object at 0x7895e50>, <matplotlib.text.Text object at 0x7b9bc50>, <matplotlib.text.Text object at 0x7874050>], [<matplotlib.text.Text object at 0x7a98e10>, <matplotlib.text.Text object at 0x7895d50>, <matplotlib.text.Text object at 0x7b9bf90>, <matplotlib.text.Text object at 0x7874690>])"}︡{"stdout":"\n"}︡{"stdout":"(-1.1074797737419919, 1.027940084990864, -1.0246160299958926, 1.0000000049123423)\n"}︡{"once":false,"file":{"show":true,"uuid":"d3622300-2e09-44ba-96fe-3b70e2b64d75","filename":"0af5cfa9-e9c9-4dfd-96eb-a2fc495fa83d.png"}}︡
︠c43777ca-7ae9-4bb8-b309-644a79fd9042︠
plt
︡5f68d1ad-6515-4d05-997e-8864d14d5fdb︡{"stdout":"<module 'matplotlib.pyplot' from '/usr/local/sage/sage-6.2/local/lib/python2.7/site-packages/matplotlib/pyplot.py'>\n"}︡
︠2c6fcbae-5ba0-4c9e-b36f-c0cd30253ce5︠

︠5d80c69c-1f88-4bf3-b5ed-ba191d397a67︠

︠876e2580-c9aa-4cb0-add5-8d2281bb940f︠

︠4e9937b4-ede2-4671-8faf-a8c1d594387b︠

︠369d5a33-0127-4710-85ad-003844bbf065︠

︠a5220329-59c3-4025-b248-23e5a43c8c16︠

︠e0ea8474-e720-4859-a32d-0764c59c8b99i︠
"""
Simple demo of a scatter plot.
"""
import numpy as np
import matplotlib.pyplot as plt


N = 50
x = np.random.rand(N)
y = np.random.rand(N)
area = np.pi * (15 * np.random.rand(N))**2 # 0 to 15 point radiuses

plt.scatter(x, y, s=area, alpha=0.5)
plt.show()
︡2e155a1d-b432-49de-9272-29ffab00c6a1︡{"stdout":"'\\nSimple demo of a scatter plot.\\n'\n"}︡{"stdout":"<matplotlib.collections.PathCollection object at 0x7848450>"}︡{"stdout":"\n"}︡{"once":false,"file":{"show":true,"uuid":"fa2ed746-1282-48e5-8fcc-816679e1def0","filename":"0ed9c6bc-a675-4e16-ae47-c386e58921e6.png"}}︡
︠477c29f0-7a61-4190-b6b1-a7ab6214a8c8︠

︠8aebccd0-eeea-4640-a584-5047d8ad861f︠

︠9d3c4737-a875-4fe3-b91d-2a62063810cf︠

︠97bbc175-aa60-4d78-9578-9bda8d9b2339︠

︠197cd0b3-073d-4d23-aead-095cf3623ff8︠

︠11d89a42-120b-45f3-93e6-7c3a0abdd736︠

︠cbca8281-2180-43a7-928f-6f295eb16d75︠










︠e3f49162-f049-41f0-ad9c-4cd6b191a01ei︠
%md

# Math 480b -- Sage Course

## April 18, 2014

Screencast: REMEMBER!!!!!!!

**Plan**

- Questions?

- Homework reminder: everything due tonight at 6pm.

- Python class: the field of rational numbers

- Example decorators: @interact, @parallel, @cached_function, @disk_cached_function

- Something different: some 2D (and maybe 3D?) graphics in Sage


︡db95eaf1-79e7-485a-a69a-70eb54460ff4︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>April 18, 2014</h2>\n\n<p>Screencast: REMEMBER!!!!!!!</p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions?</p></li>\n<li><p>Homework reminder: everything due tonight at 6pm.</p></li>\n<li><p>Python class: the field of rational numbers</p></li>\n<li><p>Example decorators: @interact, @parallel, @cached_function, @disk_cached_function</p></li>\n<li><p>Something different: some 2D (and maybe 3D?) graphics in Sage</p></li>\n</ul>\n"}︡
︠5ac07e2e-8f86-4dad-82a9-90226cd040ab︠

︠adef80f7-9d95-4827-bb8c-f0a24c4ea806i︠
%md
## The Field of Rational Numbers
︡46462787-16ca-47dd-a0ff-46ad16e4cad0︡{"html":"<h2>The Field of Rational Numbers</h2>\n"}︡
︠a0f14d60-2cb6-467f-8d8e-31efa65fe607︠

︠0bb455c9-e013-415f-8b22-520b788c6b3d︠

︠85d167c7-4215-43b0-891a-252130587ac3︠

︠bd7fee18-6a96-4101-9634-30172a368d8a︠

︠807f1eeb-e3f1-4632-968c-5eeea9e5b06f︠

︠f68864e9-3335-478f-a1ed-7edd5ac637de︠

︠00068502-a5c1-4fa5-9190-f96351e4d615i︠
%md
## Example Decorators

(these are sage-specific)

### @cached_function
︡b88af414-d6e5-4501-92b4-95f5675df701︡{"html":"<h2>Example Decorators</h2>\n\n<p>(these are sage-specific)</p>\n\n<h3>@cached_function</h3>\n"}︡
︠e1404d7a-82f0-413e-9725-f85d32aaef44︠
cached_function
︠2a297875-1e1f-4752-b164-8de6aaa54500︠

︠0032627e-4007-4601-ae96-8b50823fbc82︠

︠14a5991e-7cdf-4052-a0c6-de6bbc735567︠

︠0f31791b-585e-43a4-8bf4-c2c8c9c06742i︠
%md
### @disk_cached_function
︡3f6aec4a-6aa8-40f4-9eb6-c00afc5c865c︡{"html":"<h3>@disk_cached_function</h3>\n"}︡
︠ac432465-a3a3-480d-af91-0c7590809ec4︠
disk_cached_function
︠e126dd01-2dc2-4ee5-b2d2-5a87e355d14b︠

︠a77b222e-86a1-44b8-b8c5-b3a51770defc︠

︠e4d0a152-caca-4298-9f19-0f5df6d04ba6︠

︠d786bd5a-07ae-4f29-9b28-f47759ee8629i︠
%md
### @interact
︡07b1aa63-bc97-4eac-bf12-5abc93445c52︡{"html":"<h3>@interact</h3>\n"}︡
︠cbb4ad2d-a5d9-4f26-9d83-5d2b291674d0︠

︠8872ecff-ea14-4895-92a4-2f05a3c9dd53︠

︠2c7ba6a8-5dba-47e7-bfc4-c92e144c6315︠

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

︠c43777ca-7ae9-4bb8-b309-644a79fd9042︠

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










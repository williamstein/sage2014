︠486af4d1-a507-43f4-95a1-a56e45b72838i︠
%md

# Math 480b -- Sage Course
## Drawing Plots using Sage, Matplotlib, R, etc.

## April 21, 2014

Screencast: <http://youtu.be/52Gd_qAEqF8>

**Plan**

- Questions?

- Homework 4; grading of homework 3 available for you to do; peer grading of homework 2 returned.

- 2D (and 3D) graphics in Sage
︡c7431b55-3f5a-428a-91af-e200a1c3f265︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>Drawing Plots using Sage, Matplotlib, R, etc.</h2>\n\n<h2>April 21, 2014</h2>\n\n<p>Screencast: REMEMBER!!!!!</p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions?</p></li>\n<li><p>Homework 4; grading of homework 3 available for you to do; peer grading of homework 2 returned.</p></li>\n<li><p>2D (and 3D) graphics in Sage</p></li>\n</ul>\n"}︡
︠8557b1f8-53cb-4c28-b172-8368f94469be︠







︠96ce8f71-9c55-420d-a601-ffc7ff49795di︠
%md
## 2d Sage Graphics (like Mathematica, but better)

- sequence of line segments
- a function
- interlude: combining plot objects using +
- points
- polygons, ellipses, etc.
- arrows
- contour plot
- implicit plot
- saving plots as pdf (e.g,. to include in a LaTeX document)
︡9aeecc36-90de-4bd0-a15f-c5deba9e58e9︡{"html":"<h2>2d Sage Graphics (like Mathematica, but better)</h2>\n\n<ul>\n<li>sequence of line segments</li>\n<li>a function</li>\n<li>interlude: combining plot objects using +</li>\n<li>points</li>\n<li>polygons, ellipses, etc.</li>\n<li>arrows</li>\n<li>contour plot</li>\n<li>implicit plot</li>\n<li>saving plots as pdf (e.g,. to include in a LaTeX document)</li>\n</ul>\n"}︡
︠d3ea8ee6-a313-4c50-ad9e-e2eb79bbcbb2︠
@interact
def f(c=Color('green')):
    show(plot(sin, (-1, 10), color=c))
︡eab8fec2-d9f0-4052-9c3a-c302898929d6︡{"interact":{"style":"None","flicker":false,"layout":[[["c",12,null]],[["",12,null]]],"id":"01e24a90-00e4-4433-a5b2-31cf276ec0c6","controls":[{"widget":null,"control_type":"color-selector","hide_box":false,"Color":"<class 'sage.plot.colors.Color'>","label":"c","default":"#008000","readonly":false,"var":"c"}]}}︡
︠cd5125ab-7df4-4036-9e38-799c646d444d︠
g = plot(sin(x^3)/x, (-1, 10), color='darkgreen', thickness=.1, fillcolor='purple', fill=True)
g
︡83275de6-612e-45d8-99e8-87d3dcb1e1f5︡{"once":false,"file":{"show":true,"uuid":"36e2be8e-9434-4fab-97c9-90f41e80717b","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/25742/tmp_AFhBV3.png"}}︡
︠1dd96ea5-0c20-40e5-983d-1fe8143fbc7a︠
show(g, svg=True)
︡47171ee5-f54c-44a5-b2d6-49a94de81740︡{"once":false,"file":{"show":true,"uuid":"64ab5dd3-4070-4169-89fb-8213bad48807","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/25742/tmp_x6InfA.svg"}}︡
︠90c2426e-9688-4ff2-be2d-c4f8f19dce10︠
g.save('a.pdf')
︡795ed237-6f04-4e99-830c-827eb16812f8︡
︠0dc997d8-00ac-4c8b-a25b-813b14061d4f︠
plot(sin, (-1, 10), frame=True, axes=False, gridlines=True)
︡ad57f980-e0ff-4fd1-b2f4-4e87395eeed7︡{"once":false,"file":{"show":true,"uuid":"a69c0d61-ae34-4c03-85f0-ab2eb2ae1995","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/25742/tmp_jFTN4j.png"}}︡
︠74de4bef-be6e-437f-b859-d7f78369f530︠
g = plot(sin(x), (x, 0, 4*pi), color='darkgreen')
h = plot(cos(x), (x, 0, 4*pi), color='darkblue')
︡f1d02ba7-f740-4211-be2f-4e5b58d0a1a6︡
︠4524622b-9fb8-4f48-9ff0-5f03b785cf7f︠
g + h  # salvus.file(...) behind the scenes.
︡409a1108-9a00-4fe2-8390-236ed850e63f︡{"once":false,"file":{"show":true,"uuid":"207d73ce-16f9-41cd-ad32-867fc8125eb0","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/25742/tmp_IM6ESc.png"}}︡
︠d2b9a1c3-3d7e-4130-8111-6c1d0cc4ac9f︠
random()
︡b2c5b169-47b2-405f-9d35-f3566cbde7bf︡{"stdout":"0.8181731957981786\n"}︡
︠e0e70c15-1222-4d59-81da-7bb757355710︠
v = [(0,0)]
for i in range(2000):
    last = v[-1]
    v.append((last[0]+(random()-.5), last[1]+(random()-.5)))

g = line(v, thickness=.4, color='purple')
g += points(v, pointsize=10, color='grey')
g.show(aspect_ratio=1, svg=True, figsize=10)
︡ff2023cb-84d7-4f17-8572-268950e19218︡{"once":false,"file":{"show":true,"uuid":"bddc31a8-ea1a-416b-b719-d2cba10f5146","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/25742/tmp_V9jDQj.svg"}}︡
︠9da4f2ef-5566-47f7-98db-00c05de58aef︠
a = polygon2d([(0,0), (1,1), (2,0)], fill=False, color='black', thickness=10)
b = polygon2d([(0,0), (1,1), (2,0)], color='yellow')
g = a+b; g
︡3e3b72a2-dc93-4a39-86bf-4fae92007735︡{"once":false,"file":{"show":true,"uuid":"e978f7e9-9762-4d52-83c6-b766f8c91ed4","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/25742/tmp_sXfDb0.png"}}︡
︠eb619bbb-15bf-4b00-9555-3d4108af4d94︠
g.rotate  # project idea; also g.copy()
︠fc75ee1d-5ed5-4750-8639-73883e325646︠
v = [(0,0)]
for i in range(5):
    last = v[-1]
    v.append((last[0]+(random()-.5), last[1]+(random()-.5)))

plots = []
for i in range(1,5):
    g = line(v[:i], thickness=.4, color='purple')
    g += points(v[:i], pointsize=10, color='grey',
                aspect_ratio=1, xmin=-1, x)
    plots.append(g)
︡1239b777-c778-40f9-870b-2016ad20ad94︡
︠ca686052-406f-46ca-96b2-9034844fd942︠
len(plots)
︡8d1ed3be-4916-4c49-9370-512cd9e13eee︡{"stdout":"4\n"}︡
︠d903aba3-bd95-4e17-bb10-42010c1c54a8︠
animate(plots)
︡0557889d-8a7b-4691-86c4-81ff65b6ca21︡{"once":false,"file":{"show":true,"uuid":"a8fbe218-a5d9-45b7-9ce2-89113c19293e","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/23784/tmp_4wrqiA.gif"}}︡
︠59d8a7de-2df7-4e49-b37a-91ce154fd47a︠

︠83568660-5bab-4d3e-ac80-83ac1346343ai︠
%md
## 2d Graphics using Matplotlib (like Matlab, but better)

- matplotlib is an easy-to-install standard Python plotting library (which Sage uses extensively).
- examples/docs at the gallery: <http://matplotlib.org/gallery.html>
- how to get them to appear in SageMathCloud worksheets


︡fb58afb9-dd81-4056-941b-3175629d29ab︡{"html":"<h2>2d Graphics using Matplotlib (like Matlab, but better)</h2>\n\n<ul>\n<li>matplotlib is an easy-to-install standard Python plotting library (which Sage uses extensively).</li>\n<li>examples/docs at the gallery: <a href=\"http://matplotlib.org/gallery.html\">http://matplotlib.org/gallery.html</a></li>\n<li>how to get them to appear in SageMathCloud worksheets</li>\n</ul>\n"}︡
︠31912936-5a5b-4fa2-af1b-378be771f9aa︠

︠a2af332e-03ba-4d3d-a05f-df65f262c5ae︠

︠911f2611-6347-47d2-9452-16e0240c9a53︠

︠1ca1a9a8-bd5c-42e6-8244-89392507c1bd︠

︠39f1730c-df2e-4549-8f2b-90771196a083︠

︠52f9ee55-a7e2-4464-bed6-6da2ec0bf570︠
# from http://matplotlib.org/examples/mplot3d/lorenz_attractor.html

import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


def lorenz(x, y, z, s=10, r=28, b=2.667) :
    x_dot = s*(y - x)
    y_dot = r*x - y - x*z
    z_dot = x*y - b*z
    return x_dot, y_dot, z_dot


dt = 0.01
stepCnt = 10000

# Need one more for the initial values
xs = np.empty((stepCnt + 1,))
ys = np.empty((stepCnt + 1,))
zs = np.empty((stepCnt + 1,))

# Setting initial values
xs[0], ys[0], zs[0] = (0., 1., 1.05)

# Stepping through "time".
for i in range(stepCnt) :
    # Derivatives of the X, Y, Z state
    x_dot, y_dot, z_dot = lorenz(xs[i], ys[i], zs[i])
    xs[i + 1] = xs[i] + (x_dot * dt)
    ys[i + 1] = ys[i] + (y_dot * dt)
    zs[i + 1] = zs[i] + (z_dot * dt)

fig = plt.figure()
ax = fig.gca(projection='3d')

_ = ax.plot(xs, ys, zs)
_ = ax.set_xlabel("X Axis"), ax.set_ylabel("Y Axis"), ax.set_zlabel("Z Axis"), ax.set_title("Lorenz Attractor")

plt.show()
︡70435b69-a79d-4916-a383-000df2b05209︡{"once":false,"file":{"show":true,"uuid":"84d26219-1513-4449-8fd1-b797f9656c1e","filename":"3ce8a8f9-bae8-4811-8063-9d3be86ab046.png"}}︡
︠45bb8974-6d7b-40a8-83e4-e0ab369ff3b6︠

︠e84e3324-50f9-41a8-a3b9-61a3f77d30e4︠

︠49be06dd-a479-4446-8178-403e230013db︠

︠4e87bea6-7f45-459c-a2f6-9fc109144065i︠
%md
## 3d Sage Graphics (like Mathematica)

- function of two variables (surface)
- regular polyhedra
- sphere
- implicit plot of surface
- text

︡57b8a223-3805-4052-bd69-96bc2bf03186︡{"html":"<h2>3d Sage Graphics (like Mathematica)</h2>\n\n<ul>\n<li>function of two variables (surface)</li>\n<li>regular polyhedra</li>\n<li>sphere</li>\n<li>implicit plot of surface</li>\n<li>text</li>\n</ul>\n"}︡
︠05f3f9e5-758e-4d5c-b9cd-24e7f0dfb814︠

︠d3610716-6fd5-468f-b0a3-187eaa629d93︠

︠4f66cd38-c6e2-4584-af3a-c664126cf0b1︠

︠6aa9ff7e-c8fb-4107-93e4-bdb875df58f9︠

︠58ea5398-e9e9-4527-89f5-a67d7bd0b7db︠

︠2e56f7a3-9da8-4d37-b85a-8c8e7a0d074e︠

︠50e4e26c-0713-4e3a-a972-3c6f7e50be26︠
T = RDF(golden_ratio)
%var x,y,z
p = 2 - (cos(x + T*y) + cos(x - T*y) + cos(y + T*z) + cos(y - T*z) + cos(z - T*x) + cos(z + T*x))
r = 4.77
implicit_plot3d(p, (x, -r, r), (y, -r, r), (z, -r, r), plot_points=30)
︡5b130400-3ec7-4b5a-818b-01770d1d2adc︡{"html":"<div id=29f52290-44fa-41ae-99b3-784e011919d3 style='border:1px solid grey'></div>"}︡{"obj":"{\"foreground\": null, \"camera_distance\": 9.54, \"height\": null, \"width\": null, \"renderer\": null, \"background\": null}","javascript":{"coffeescript":false,"code":"$('#29f52290-44fa-41ae-99b3-784e011919d3').salvus_threejs(obj)"},"once":false}︡
︠f858cb7d-e0e6-430b-b60e-a25636ae75b1︠

︠f6fbccef-f12b-4fdc-bcf8-3dbbc807da8ci︠
%md
## Other -- You can also draw plots using R

To draw a plot (or do anything) using R, put %r at the beginning of a cell.
︡9dbbaee6-ffc9-431f-9731-38c93462b59e︡{"html":"<h2>Other &#8211; You can also draw plots using R</h2>\n\n<p>To draw a plot (or do anything) using R, put %r at the beginning of a cell.</p>\n"}︡
︠d06b317d-019e-4038-a253-fafb1cf5f553︠
%r

# Define 2 vectors
cars <- c(1, 3, 6, 4, 9)
trucks <- c(2, 5, 4, 5, 12)

# Calculate range from 0 to max value of cars and trucks
g_range <- range(0, cars, trucks)

# Graph autos using y axis that ranges from 0 to max
# value in cars or trucks vector.  Turn off axes and
# annotations (axis labels) so we can specify them ourself
plot(cars, type="o", col="blue", ylim=g_range,
   axes=FALSE, ann=FALSE)

# Make x axis using Mon-Fri labels
axis(1, at=1:5, lab=c("Mon","Tue","Wed","Thu","Fri"))

# Make y axis with horizontal labels that display ticks at
# every 4 marks. 4*0:g_range[2] is equivalent to c(0,4,8,12).
axis(2, las=1, at=4*0:g_range[2])

# Create box around plot
box()

# Graph trucks with red dashed line and square points
lines(trucks, type="o", pch=22, lty=2, col="red")

# Create a title with a red, bold/italic font
title(main="Autos", col.main="red", font.main=4)

# Label the x and y axes with dark green text
title(xlab="Days", col.lab=rgb(0,0.5,0))
title(ylab="Total", col.lab=rgb(0,0.5,0))

# Create a legend at (1, g_range[2]) that is slightly smaller
# (cex) and uses the same line colors and points used by
# the actual plots
legend(1, g_range[2], c("cars","trucks"), cex=0.8,
   col=c("blue","red"), pch=21:22, lty=1:2);
︡2303ad3d-1565-44c0-9d07-a3b13eeea8af︡{"stdout":"\n"}︡{"once":false,"file":{"show":true,"uuid":"3762dddb-668e-4a34-9011-a972f97296ad","filename":"/tmp/bb6d3f0b-15be-40d4-8eb1-afe49bf6dd59.png"}}︡{"stdout":"\n"}︡
︠3d7151d2-2919-45bb-ada6-eea57701c5ddi︠
%md
## Or even plot with octave...
︡134e2dab-54f1-447a-9018-e36804ac67dc︡{"html":"<h2>Or even plot with octave&#8230;</h2>\n"}︡
︠35da99e8-90bd-4110-b147-1c3d8a9dcfaf︠
%octave
cd('/tmp')
M = rand(10);
h = figure('visible', 'off');
plot(M);
saveas(h,"figure2.png");
︡1f339e08-8178-4e80-8f79-63984544ff1f︡{"stdout":"\n\n\n\n"}︡
︠911041e8-4200-4fe3-9b89-9c5d1c203566︠
salvus.file('/tmp/figure2.png')
︡ae218805-64e7-46f0-86a6-028680fd0582︡{"once":false,"file":{"show":true,"uuid":"9217c5dd-4af8-47bf-9421-9d8620f207cb","filename":"/tmp/figure2.png"}}︡
︠dc0988af-1fe3-42a6-9821-043cf750dae7︠










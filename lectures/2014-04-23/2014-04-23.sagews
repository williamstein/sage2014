︠39853aaf-87ec-44d5-a645-6cc5dd0837e6i︠
%md

# Math 480b -- Sage Course
## More Graphics

## April 23, 2014

Screencast: <http://youtu.be/Q9NitcAoRb4>

**Plan**

- Questions?

- Including a plot in a LaTeX document: step-by-step tutorial

- 2D matplotlib graphics in Sage

- 3D graphics in Sage

- NEXT topic (starting Friday): git, the command line terminal, sage development.  (We'll delay Cython.)
︡a25f45f3-533e-4255-a9e8-fcf2305f9e0c︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>More Graphics</h2>\n\n<h2>April 23, 2014</h2>\n\n<p>Screencast: <a href=\"http://youtu.be/Q9NitcAoRb4\">http://youtu.be/Q9NitcAoRb4</a></p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions?</p></li>\n<li><p>Including a plot in a LaTeX document: step-by-step tutorial</p></li>\n<li><p>2D matplotlib graphics in Sage</p></li>\n<li><p>3D graphics in Sage</p></li>\n<li><p>NEXT topic (starting Friday): git, the command line terminal, sage development.  (We&#8217;ll delay Cython.)</p></li>\n</ul>\n"}︡
︠19dd830e-6939-48a3-aeff-a4eeca98ec4f︠

︠f29a552c-cddf-4b91-8b8a-6bc1506e8824i︠
%md
## Including a plot in a LaTeX document: step-by-step tutorial
︡cee42161-aa53-48f2-80c5-458e339adc9c︡{"html":"<h2>Including a plot in a LaTeX document: step-by-step tutorial</h2>\n"}︡
︠4b586aba-3987-4a1f-82f6-c2045cb5f03c︠
g = plot(arctanh)
g
︡33935641-7c0f-4b3a-af21-9b0713d3854d︡{"once":false,"file":{"show":true,"uuid":"e02bf1c8-dad8-4aad-94b1-e1bf1fc94dfc","filename":"/projects/74af30b7-ad25-4308-a02e-c71fcd84de6e/.sage/temp/compute19dc0/29276/tmp_XSIAjX.png"}}︡
︠78d66288-062f-4ed6-80e7-55187be57de4︠
g.save('arctanh.pdf')
︡f94f7139-8ee3-4c6d-890b-0d989093f2fa︡
︠f8a3afc4-d12d-4aeb-8db2-d8190a8a401f︠

︠a7d761b2-4353-452e-8250-88e82acce8fe︠

︠aa4393fd-d445-4474-afaf-d4414578aba9︠

︠83568660-5bab-4d3e-ac80-83ac1346343ai︠
%md
## 2d Graphics using Matplotlib (like Matlab, but better)

- matplotlib is an easy-to-install standard Python plotting library (which Sage uses extensively).
- examples/docs at the gallery: <http://matplotlib.org/gallery.html>
- how to get them to appear in SageMathCloud worksheets


︡fb58afb9-dd81-4056-941b-3175629d29ab︡{"html":"<h2>2d Graphics using Matplotlib (like Matlab, but better)</h2>\n\n<ul>\n<li>matplotlib is an easy-to-install standard Python plotting library (which Sage uses extensively).</li>\n<li>examples/docs at the gallery: <a href=\"http://matplotlib.org/gallery.html\">http://matplotlib.org/gallery.html</a></li>\n<li>how to get them to appear in SageMathCloud worksheets</li>\n</ul>\n"}︡
︠32be4a67-40ff-42f7-9c6a-0b13f896486c︠
v = [3,4,7]]
w = [1,9,18]
[(3,1), (4,9), (7,18)]
[(v[i],w[i]) for i in range(len(v))]
zip(v,w)
︡510babbc-6a5e-4fac-a3cb-b2039b4fa082︡{"stdout":"[(3, 1), (4, 9), (7, 18)]\n"}︡{"stdout":"[(3, 1), (4, 9), (7, 18)]\n"}︡{"stdout":"[(3, 1), (4, 9), (7, 18)]\n"}︡
w = [1,9,18]
[(3,1), (4,9), (7,18)]
[(v[i],w[i]) for i in range(len(v))]
zip(v,w)
︡510babbc-6a5e-4fac-a3cb-b2039b4fa082︡{"stdout":"[(3, 1), (4, 9), (7, 18)]\n"}︡{"stdout":"[(3, 1), (4, 9), (7, 18)]\n"}︡{"stdout":"[(3, 1), (4, 9), (7, 18)]\n"}︡
︠31912936-5a5b-4fa2-af1b-378be771f9aa︠
import numpy as np
import matplotlib
from matplotlib.patches import Circle, Wedge, Polygon
from matplotlib.collections import PatchCollection
import matplotlib.pyplot as plt


fig, ax = plt.subplots()

resolution = 50 # the number of vertices
N = 3
x       = np.random.rand(N)
y       = np.random.rand(N)
radii   = 0.1*np.random.rand(N)
patches = []
for x1,y1,r in zip(x, y, radii):
    circle = Circle((x1,y1), r)
    patches.append(circle)

x       = np.random.rand(N)
y       = np.random.rand(N)
radii   = 0.1*np.random.rand(N)
theta1  = 360.0*np.random.rand(N)
theta2  = 360.0*np.random.rand(N)
for x1,y1,r,t1,t2 in zip(x, y, radii, theta1, theta2):
    wedge = Wedge((x1,y1), r, t1, t2)
    patches.append(wedge)

# Some limiting conditions on Wedge
patches += [
    Wedge((.3,.7), .1, 0, 360),             # Full circle
    Wedge((.7,.8), .2, 0, 360, width=0.05), # Full ring
    Wedge((.8,.3), .2, 0, 45),              # Full sector
    Wedge((.8,.3), .2, 45, 90, width=0.10), # Ring sector
]

for i in range(N):
    polygon = Polygon(np.random.rand(N,2), True)
    patches.append(polygon)

colors = 100*np.random.rand(len(patches))
p = PatchCollection(patches, cmap=matplotlib.cm.jet, alpha=0.4)
p.set_array(np.array(colors))
ax.add_collection(p)
plt.colorbar(p)

plt.show()
︡9ed0cad5-51be-4a6e-9577-e99e7a696ca5︡{"stdout":"<matplotlib.collections.PatchCollection object at 0xafbb650>\n"}︡{"stdout":"<matplotlib.colorbar.Colorbar instance at 0xa79f758>\n"}︡{"once":false,"file":{"show":true,"uuid":"75c58843-a70c-4699-9539-0bb8f54ad84b","filename":"c2558f26-49df-4563-b001-fd5304d14abb.png"}}︡
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
︠d01e7021-2839-48a4-90a5-c07c686e0507︠
f(x,y) = x+y^2*sin(x*y)
g = plot3d(f, (x, -5,2), (y,-1,1), color='purple')
g += plot3d(x-y, (x, -5, 2), (y,-1,1), color='red')
g
︡cc4dec6a-4a35-4668-a844-33990b34b5c0︡{"html":"<div id=9b5420ac-29d2-4ff5-acc0-304b5720d5e1 style='border:1px solid grey'></div>"}︡{"obj":"{\"foreground\": null, \"camera_distance\": 12.0, \"height\": null, \"width\": null, \"renderer\": null, \"background\": null}","javascript":{"coffeescript":false,"code":"$('#9b5420ac-29d2-4ff5-acc0-304b5720d5e1').salvus_threejs(obj)"},"once":false}︡
︠9804b736-6532-4e4c-ab6a-d4f000d66e5a︠

︠1f3a5fe8-ee78-41fa-8703-ec08d20eebe1︠
f(x,y) = x+y
g = plot3d(f, (x, -1,1), (y,-1,1), color='red')

︠05f3f9e5-758e-4d5c-b9cd-24e7f0dfb814︠

︠d3610716-6fd5-468f-b0a3-187eaa629d93︠

︠4f66cd38-c6e2-4584-af3a-c664126cf0b1︠

︠6aa9ff7e-c8fb-4107-93e4-bdb875df58f9︠
sphere(opacity=.5, color='green', mesh=2) + icosahedron(color='red', opacity=.7, size=2).translate((1,0,0))

︡31a6a0b8-db09-49f8-8826-9767316ab41e︡{"html":"<div id=dbd35b8b-4283-4cf5-a39d-d2f0bb7324fa style='border:1px solid grey'></div>"}︡{"obj":"{\"foreground\": null, \"camera_distance\": 5.122187715333165, \"height\": null, \"width\": null, \"renderer\": null, \"background\": null}","javascript":{"coffeescript":false,"code":"$('#dbd35b8b-4283-4cf5-a39d-d2f0bb7324fa').salvus_threejs(obj)"},"once":false}︡
︠88b36520-d20b-40e9-a8de-3520cd30c56b︠

︠50e4e26c-0713-4e3a-a972-3c6f7e50be26︠
T = RDF(golden_ratio)
%var x,y,z
p = 2 - (cos(x + T*y) + cos(x - T*y) + cos(y + T*z) + cos(y - T*z) + cos(z - T*x) + cos(z + T*x))
r = 4.77
implicit_plot3d(p, (x, -r, r), (y, -r, r), (z, -r, r), plot_points=50, color='orange')
︡1a61c0bb-3b95-418c-b60e-b5cb76b70adb︡{"html":"<div id=1ec56e69-b363-4603-8fd0-c8226168dc4b style='border:1px solid grey'></div>"}︡{"obj":"{\"foreground\": null, \"camera_distance\": 9.54, \"height\": null, \"width\": null, \"renderer\": null, \"background\": null}","javascript":{"coffeescript":false,"code":"$('#1ec56e69-b363-4603-8fd0-c8226168dc4b').salvus_threejs(obj)"},"once":false}︡
︠f858cb7d-e0e6-430b-b60e-a25636ae75b1︠
reset('r')
︡76bc0030-ca59-4c11-a641-c7c5b45a99cf︡
︠dacd7d2f-2484-4703-810c-7005a190c835︠
%r
cars <- c(1,3,6,4,9)
︡51f1c9ef-8b86-47be-b27e-07632e5a036d︡
︠15a623b7-73a9-45f6-b7a3-e3d84c321c1a︠
%r
cars
︡88e6aa9d-2a7d-407e-8811-04a667c49aaf︡{"stdout":"[1] 1 3 6 4 9"}︡
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
title(main="Autos - n stuff", col.main="red", font.main=4)

# Label the x and y axes with dark green text
title(xlab="Days", col.lab=rgb(0,0.5,0))
title(ylab="Total", col.lab=rgb(0,0.5,0))

# Create a legend at (1, g_range[2]) that is slightly smaller
# (cex) and uses the same line colors and points used by
# the actual plots
legend(1, g_range[2], c("cars","trucks"), cex=0.8,
   col=c("blue","red"), pch=21:22, lty=1:2);
︡08103c2d-3961-48de-99ae-55c794ff87f9︡{"stdout":"\n"}︡{"once":false,"file":{"show":true,"uuid":"9253f63b-d654-49f8-9b40-f0b8cbe4f16e","filename":"/tmp/f37b179c-b002-43dd-a58d-c35974a28bc4.png"}}︡{"stdout":"\n"}︡
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
︡92aff075-dd2a-42cb-967c-caab91bd9dee︡{"stdout":"\n\n\n\n"}︡
︠911041e8-4200-4fe3-9b89-9c5d1c203566︠
salvus.file('/tmp/figure2.png')
︡11693e78-0600-448e-9668-264a7862b514︡{"once":false,"file":{"show":true,"uuid":"c350219c-ad3d-4dcd-830b-9fb4bc0284db","filename":"/tmp/figure2.png"}}︡
︠dc0988af-1fe3-42a6-9821-043cf750dae7︠













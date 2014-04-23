︠39853aaf-87ec-44d5-a645-6cc5dd0837e6i︠
%md

# Math 480b -- Sage Course
## More Graphics

## April 23, 2014

Screencast: REMEMBER!

**Plan**

- Questions?

- Including a plot in a LaTeX document: step-by-step tutorial

- 2D matplotlib graphics in Sage

- 3D graphics in Sage

- NEXT topic (starting Friday): git, the command line terminal, sage development.  (We'll delay Cython.)
︡3aa558a6-d95e-4e54-b79f-64e80de0f162︡{"html":"<h1>Math 480b &#8211; Sage Course</h1>\n\n<h2>More Graphics</h2>\n\n<h2>April 23, 2014</h2>\n\n<p>Screencast: REMEMBER!</p>\n\n<p><strong>Plan</strong></p>\n\n<ul>\n<li><p>Questions?</p></li>\n<li><p>Including a plot in a LaTeX document: step-by-step tutorial</p></li>\n<li><p>2D matplotlib graphics in Sage</p></li>\n<li><p>3D graphics in Sage</p></li>\n<li><p>NEXT topic (starting Friday): git, the command line terminal, sage development.  (We&#8217;ll delay Cython.)</p></li>\n</ul>\n"}︡
︠19dd830e-6939-48a3-aeff-a4eeca98ec4f︠

︠f29a552c-cddf-4b91-8b8a-6bc1506e8824i︠
%md
## Including a plot in a LaTeX document: step-by-step tutorial
︡cee42161-aa53-48f2-80c5-458e339adc9c︡{"html":"<h2>Including a plot in a LaTeX document: step-by-step tutorial</h2>\n"}︡
︠4b586aba-3987-4a1f-82f6-c2045cb5f03c︠

︠78d66288-062f-4ed6-80e7-55187be57de4︠

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


︠50e4e26c-0713-4e3a-a972-3c6f7e50be26︠
T = RDF(golden_ratio)
%var x,y,z
p = 2 - (cos(x + T*y) + cos(x - T*y) + cos(y + T*z) + cos(y - T*z) + cos(z - T*x) + cos(z + T*x))
r = 4.77
implicit_plot3d(p, (x, -r, r), (y, -r, r), (z, -r, r), plot_points=30, color='orange')
︠f858cb7d-e0e6-430b-b60e-a25636ae75b1︠

︠15a623b7-73a9-45f6-b7a3-e3d84c321c1a︠

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













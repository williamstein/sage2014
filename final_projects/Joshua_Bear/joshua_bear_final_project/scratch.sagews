︠24b3cd1e-56a2-4b39-9922-6c2c716eae29︠
###
### Pi approximation
###

#initialize
points_in = []
points_out = []
n = 1000
inside = 0

#place random points
for i in range(0,n):
    [x,y]=[random(),random()]

    if (y <= sqrt(1-(x^2))):
        inside += 1
        points_in.append([x,y])
    else:
        points_out.append([x,y])

# calculate approximation
a = RR(4*(inside / n))
ans = "pi is approximately: %s"%(a)
print ans

#graph solution
circle = []
for i in range(0,1000):
    x = i/1000
    y = sqrt(1-(i/1000)^2)
    circle.append([x,y])

graph = list_plot(points_in, color="blue")
graph += list_plot(points_out, color="red")
graph += list_plot(circle,color="black",figsize=[5,4],plotjoined=true)
show(graph)
︡a6b22495-3ca4-4f97-8664-f18f2ca8ddcd︡{"stdout":"pi is approximately: 3.13200000000000\n"}︡{"once":false,"file":{"show":true,"uuid":"70612d25-7b9f-4e0e-b161-fdf6a80c0987","filename":"/projects/cc96c0e6-8daf-467d-b8d2-354f9c5144a5/.sage/temp/compute6dc2/12514/tmp_5mE4I_.png"}}︡
︠db295bf4-cc63-4e1c-85f6-c58aa32eba07︠
###
### Rolling Dice
###

import random
from sage.plot.bar_chart import BarChart

#initialize
dice_throws = []
totals = []
final = []
n = 1000

#roll
for i in range(n):
    [x,y] = [random.randint(1,6),random.randint(1,6)]
    dice_throws.append([x,y])
    totals.append(x+y)
for i in range(2,13):
    final.append(totals.count(i))

prob = [RR(i/n).n(digits=3) for i in final]; prob

#graph
g = bar_chart(final)
g.show()
︡7c3ad6a0-1d43-4978-9392-c7562139d8c3︡{"stdout":"[0.0210, 0.0520, 0.0830, 0.127, 0.148, 0.159, 0.156, 0.0970, 0.0900, 0.0470, 0.0200]\n"}︡{"once":false,"file":{"show":true,"uuid":"ca560955-3e90-4ec1-ade1-6250c7975d1c","filename":"/projects/cc96c0e6-8daf-467d-b8d2-354f9c5144a5/.sage/temp/compute6dc2/12514/tmp_l2US9Q.png"}}︡
︠f26b0b6d-b7cf-4e4f-8f0a-1e8deeba4036︠










︠c13985f6-4ae4-4714-a51b-13c06b2ee76b︠
import numpy as np
load("cranknic.sage")
var('x t u dudt dudx du2dx2')
D = 1
R = 0
equation = du2dx2*D + R - dudt

t = np.linspace(0,10,num = 1000)
x = np.linspace(0,10,num = 100)
ic = [5 for i in range(0,100)]
##IC needs to be m,1 dimension, not 1d array
ic = np.array(ic)
ic.resize(len(ic),1)

obj = cranknic(t,x,ic,equation)
%timeit
sol = obj.cranknic()

︡4a4bc7d4-d3f1-4d34-b899-856e532e361b︡{"stdout":"(x, t, u, dudt, dudx, du2dx2)\n"}︡{"stdout":"5 loops, best of 3: 472 ms per loop"}︡{"stdout":"\n"}︡
︠fc2a856d-171f-49ab-a86d-f3c4a9589672︠
import numpy as np
load("cranknic_Opt.sage")
var('x t u dudt dudx du2dx2')
D = 1
R = 0
equation = du2dx2*D + R - dudt

t = np.linspace(0,10,num = 1000)
x = np.linspace(0,10,num = 100)
ic = [5 for i in range(0,100)]
##IC needs to be m,1 dimension, not 1d array
ic = np.array(ic)
ic.resize(len(ic),1)

obj = cranknic_Opt(t,x,ic,equation)
%timeit
sol = obj.cranknic()
︡4dac309a-706c-44aa-b6fe-95942e6fb758︡{"stdout":"(x, t, u, dudt, dudx, du2dx2)\n"}︡
︠a460045c-4506-4a1c-800f-089af82058f8︠










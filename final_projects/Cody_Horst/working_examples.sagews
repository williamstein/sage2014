︠c13985f6-4ae4-4714-a51b-13c06b2ee76b︠
import numpy as np
import pylab as py
load("cranknic.sage")
var('x t u dudt dudx du2dx2')
D = 1
R = 0
#Equation passed needs to be solved so == 0. This way like terms are auto combined
equation = du2dx2*D + R - dudt

t = np.linspace(0,10,num = 100)
x = np.linspace(0,10,num = 100)
ic = [5 for i in range(0,100)]
##IC needs to be m,1 dimension, not 1d arrayadd_axes
ic = np.array(ic)
ic.resize(len(ic),1)

obj = cranknic(t,x,ic,equation)

sol = obj.cranknic()
hm1 = obj.heat_map(sol)
cm1 = obj.contour_map(sol)
print type(hm1)
hm1.savefig("hm1.png")
cm1.savefig("cm1.png")


︡b4dca026-9ba3-4d74-8c95-2fea8a0afd47︡{"stdout":"(x, t, u, dudt, dudx, du2dx2)\n"}︡{"once":false,"file":{"show":true,"uuid":"8e2376df-1539-45d6-b625-e58e7bbd1bb8","filename":"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sage/temp/compute7dc2/3646/tmp_hfgtly.png"}}︡{"once":false,"file":{"show":true,"uuid":"7b6fab83-9c57-46d6-ac0e-6a9939decb18","filename":"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sage/temp/compute7dc2/3646/tmp_npcia3.png"}}︡{"stdout":"<class 'matplotlib.figure.Figure'>\n"}︡
︠59cd061e-7cb7-4225-aa4a-1304c4f14a1b︠

︠b7a749ec-cc82-405e-b113-02a5623a7fff︠
import numpy as np
import pylab as py
load("cranknic.sage")

var('x t u dudt dudx du2dx2')
D = 0.07
R = 0.5

equation = du2dx2*D + R*u - dudt

t = np.linspace(0,10,num = 100)
x = np.linspace(0,1,num = 100)
ic = [i/10 for i in range(0,100)]
ic = np.array(ic)
ic.resize(len(ic),1)

solobj = cranknic(t,x,ic,equation)
sol = solobj.cranknic()

hm2 = solobj.heat_map(sol)
cm2 = solobj.contour_map(sol)
py.savefig("hm2.png")
py.savefig("cm2.png")


︡67598f10-1ec0-4a22-b3ea-1c7d6b7dfa1c︡{"stdout":"(x, t, u, dudt, dudx, du2dx2)\n"}︡{"once":false,"file":{"show":true,"uuid":"ffb78911-1ccd-4290-84a2-1ca9b9a1787c","filename":"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sage/temp/compute7dc2/3646/tmp_clrDD2.png"}}︡{"once":false,"file":{"show":true,"uuid":"b054c4b2-5925-48dc-a982-fe9ba02dec73","filename":"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sage/temp/compute7dc2/3646/tmp_XjENjW.png"}}︡
︠09dce566-4e05-4cb0-83ba-b5ccef189f9e︠
import numpy as np
import pylab as py
var('x t u dudt dudx du2dx2')
vel = 0.01
vis = 0.07

equation = vel*du2dx2 - vis*dudx - dudt

t = np.linspace(0,10,num = 100)
x = np.linspace(0,1,num = 100)
ic = [10 for i in range(0,100)]
ic = np.array(ic)
ic.resize(len(ic),1)

solobj = cranknic(t,x,ic,equation)
sol = solobj.cranknic()

hm3 = solobj.heat_map(sol)
cm3 = solobj.contour_map(sol)
py.savefig("hm3.png")
py.savefig("cm3.png")

︡d5948c83-7bf0-4b83-b94d-aab82554a572︡{"stdout":"(x, t, u, dudt, dudx, du2dx2)\n"}︡{"once":false,"file":{"show":true,"uuid":"02b53464-5145-469a-9f41-b33e7ea9bbe5","filename":"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sage/temp/compute7dc2/3646/tmp_BB6uqN.png"}}︡{"once":false,"file":{"show":true,"uuid":"61ed078c-5918-4d99-bc21-e2855674ae3b","filename":"/projects/549a2b7f-7ecc-4d07-8a22-83ea5cbd3d68/.sage/temp/compute7dc2/3646/tmp_MhYhWt.png"}}︡
︠97428732-5001-458e-921e-cb91d5f5c4b2︠










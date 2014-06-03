︠5381f4ad-bd5e-45ad-a7de-021dca1278f5︠
def ODE_graph(deq1,deq2,window):
    x,y = var('x,y')
    eq1 = deq1 
    eq2 = deq2 
    p = implicit_plot(deq1==0,(x,-1*window,window),(y,-1*window,window))
    p += plot_slope_field(deq1, (x,-1*window,window),(y,-1*window,window), headlength=1e-8)
    p.show(aspect_ratio=1)
    
    p = implicit_plot(deq2==0,(x,-1*window,window),(y,-1*window,window))
    p += plot_slope_field(deq2, (x,-1*window,window),(y,-1*window,window), headlength=1e-8)
    p.show(aspect_ratio=1)
︡482d17c5-8716-4e03-95b2-8304fbf8986f︡
︠c8582758-20e9-4906-8f0e-5cc1de075143︠
x,y = var('x,y')
ODE_graph(x^2, y^2+2*y-4,10)
︡31ead002-f8d8-4acd-974e-03cab72b181e︡{"once":false,"file":{"show":true,"uuid":"c313b6ae-96a8-4c25-801f-b774b10dbcf3","filename":"/projects/a46969fe-7903-4920-af5c-3fe72a7148d8/.sage/temp/compute18dc0/12415/tmp_1KRxAa.png"}}︡{"once":false,"file":{"show":true,"uuid":"664160e0-745e-4452-b6f3-156209d729da","filename":"/projects/a46969fe-7903-4920-af5c-3fe72a7148d8/.sage/temp/compute18dc0/12415/tmp_psMmAb.png"}}︡
︠468cbd31-a326-4864-af28-7972de60697d︠
x,y = var('x,y')
v = plot_slope_field(x*(2-x-y),(x,-10,10),(y,-10,10), headlength=1e-8)
y = plot_slope_field(x-y,(x,-10,10),(y,-10,10), headlength=1e-8)

show(y+v)
︡5d082bc5-f99e-465c-83fa-ab1424c498d7︡{"once":false,"file":{"show":true,"uuid":"5a6e3a58-8cc7-4a28-83f6-7ba76cf58291","filename":"/projects/a46969fe-7903-4920-af5c-3fe72a7148d8/.sage/temp/compute18dc0/11928/tmp_vAVryE.png"}}︡
︠5c044029-45e5-4505-a28c-86b71a2387e6︠
x,y = var('x y')
eq1 = x*(3-x)-2*x*y
eq2 = y*(2-y) - x*y
f=[eq1,eq2]
#sol=desolve_odeint(f,[5,-5],srange(0,10,0.1),[x,y])
sol=desolve_odeint(f,[1,-5],srange(0,10,0.01),[x,y])
p=line(zip(sol[:,0],sol[:,1]))
p += plot_vector_field((eq1, eq2), (x,-5,25), (y,-13,5))
#p += implicit_plot(eq1==0,(x,-5,5),(y,-5,5))
#p += implicit_plot(eq2==0,(x,-5,5),(y,-5,5))
p.show(aspect_ratio=1)
︡a7517fbb-b69b-4a36-a364-1e44e19d4e20︡{"once":false,"file":{"show":true,"uuid":"51bb52ad-cb75-44d6-92b2-356716d4ca1e","filename":"/projects/a46969fe-7903-4920-af5c-3fe72a7148d8/.sage/temp/compute18dc0/11928/tmp_2pD3gw.png"}}︡
︠647258ee-6ea5-4c02-a0c0-22f1ebd1ee06︠
from sage.calculus.desolvers import desolve_odeint
x,y=var('x,y')
f=[x*(1-y),-y*(1-x)]
sol=desolve_odeint(f,[0.5,2],srange(0,10,0.1),[x,y])
p=line(zip(sol[:,0],sol[:,1]))
p.show()
︡4c04d27e-4021-4779-ab1a-c7795f425c94︡{"once":false,"file":{"show":true,"uuid":"23afa99e-a404-4612-aac3-ece74c627964","filename":"/projects/a46969fe-7903-4920-af5c-3fe72a7148d8/.sage/temp/compute18dc0/11928/tmp_FYLUxT.png"}}︡
︠3435f35d-34b4-41f7-8510-d11ca2e678a2︠










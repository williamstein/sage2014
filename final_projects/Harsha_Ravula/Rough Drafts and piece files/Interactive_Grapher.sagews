︠aa7523b3-c747-4ff8-ae9b-3944203a52e6i︠
@interact
def f(ix = ("Initial x", 15), iy = ("Initial y", 15)):
    x,y = var('x y')
    eq1 = x*(3-x)-2*x*y
    eq2 = y*(2-y) - x*y
    window = max(ix,iy) + 5
    f=[eq1,eq2]
    sol=desolve_odeint(f,[ix,iy],srange(0,10,0.01),[x,y])
    p=line(zip(sol[:,0],sol[:,1]))
    p += plot_vector_field((eq1, eq2), (x,-1*window,window), (y,-1*window,window))
    p.show(aspect_ratio=1)
    
︡73762a3a-cd83-428f-ac4a-2404e2a8ef41︡{"interact":{"style":"None","flicker":false,"layout":[[["ix",12,null]],[["iy",12,null]],[["",12,null]]],"id":"06e5e376-e3a9-4259-9e8c-b5ccf5c1bfe6","controls":[{"control_type":"input-box","default":15,"label":"Initial x","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"ix","type":null},{"control_type":"input-box","default":15,"label":"Initial y","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"iy","type":null}]}}︡
︠a16723ca-c533-4faa-8935-5e160a68a800︠
︡8b31b06d-d21b-4b04-a775-fca68fefdd68︡
︠8b3cf318-d980-4dbd-b573-c3179ec0ff7e︠










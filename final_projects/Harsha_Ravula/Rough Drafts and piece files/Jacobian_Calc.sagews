︠84ae073b-da8f-488c-9723-126e34e6eab6︠
def Jacobian_Solve(deq1,deq2):
    x,y = var('x,y')
    eq1 = deq1 
    eq2 = deq2 
    Jacobian = matrix([[eq1.diff(x),eq1.diff(y)],[eq2.diff(x),eq2.diff(y)]])
    print Jacobian
    det = Jacobian.determinant()
    trac = Jacobian.trace()
    print det
    print trac
    
︡0b7ddf32-9ab2-45ac-8675-a1f48efb9b0a︡
︠e9fbd048-5774-4824-a43b-76fbcec42934︠
x,y = var('x,y')
Jacobian_Solve(x^2, y^2+2*x-4)

︡e6b52539-3cc4-4a50-b63b-41d80966b414︡{"stdout":"[2*x   0]\n[  2 2*y]\n4*x*y\n2*x + 2*y\n"}︡
︠94a31c2c-b12e-4f04-bf83-a991b906b696︠










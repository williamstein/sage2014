︠9ff1a897-366e-4258-9d15-51158aeceea6︠
def FPsolve(deq1,deq2):
    x,y = var('x,y')
    eq1 = deq1 
    eq2 = deq2 
    fixedpts = solve([eq1==0, eq2==0], x, y)
    
    xcoords = []
    ycoords = []
    
    for a in fixedpts:
        xcoords.append(a[0])
        ycoords.append(a[1])
    
    print "Fixed Points:"
    for i in range(0,len(xcoords)):
        c = [xcoords[i],ycoords[i]]
        print c
︡bdd91d72-26aa-4367-9118-310da5b4f805︡
︠19fdd47e-d227-4065-b981-627e4d731edc︠
x,y = var('x,y')
FPsolve(x*(3-x)-2*x*y , y*(2-y) - x*y)
︡d37fe18e-e4dd-4781-90df-efc89534eb73︡{"stdout":"Fixed Points:\n[x == 0, y == 0]\n[x == 3, y == 0]\n[x == 0, y == 2]\n[x == 1, y == 1]\n"}︡
︠5ae9d325-efba-4c2d-b667-b6e77671884e︠
x,y = var('x,y')
solve([x+y==0, 4*x-2*y==0], x, y)
︡6d62233c-d4a2-424f-8992-edc52e21abff︡{"stdout":"[[x == 0, y == 0]]\n"}︡
︠057e89a0-deef-4cfc-99e0-2c68335c7bc8︠
solve([x-y==0], x, y)
︡881b45f3-0020-43c5-8815-519e9174b0e7︡{"stdout":"([x == y], [1])\n"}︡
︠af1b651e-af97-4a27-862b-1c70aeea1266︠
x,y = var('x,y')
FPsolve(x-y,1-e^x)
︡50624208-2dc6-48a6-a2f6-a5e266239eb3︡{"stdout":"Fixed Points:\n[x == 2*I*pi*z36, y == 2*I*pi*z36]\n"}︡
︠691a706b-f7aa-4d17-9b33-63df95ebad33︠

︠4b157018-d4f6-409b-ac3a-697a7981e13c︠
e^2.numerical
︡a05c486d-0f4a-42aa-83cd-a7446348a2a4︡{"stdout":"e^2\n"}︡
︠8e5f81ae-1388-413c-b0c7-216b635412e6︠
x,y = var('x,y')
FPsolve(x,x+y+1)
︡66f517a4-fcc7-470a-9975-ff24ab263e4f︡{"stdout":"Fixed Points:\n[x == 0, y == -1]\n"}︡
︠8439df6b-3f76-4712-a198-271458cc558d︠
x,y = var('x,y')
FPsolve(x*(2 - x - y),x-y)
︡5ac7d944-97bd-4507-9ea3-b9caec3e8af0︡{"stdout":"Fixed Points:\n[x == 0, y == 0]\n[x == 1, y == 1]\n"}︡
︠92b756be-ebe5-4dbd-ad3d-37fb8ce23aa2︠










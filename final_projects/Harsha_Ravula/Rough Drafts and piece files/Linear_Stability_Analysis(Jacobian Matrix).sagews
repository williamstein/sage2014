︠6e3bd248-0ff2-4e9b-95e5-4b1cb5ac57ee︠
def Find_Stability(eq1,eq2,xcoords,ycoords):
    Jacobian = matrix([[eq1.diff(x),eq1.diff(y)],[eq2.diff(x),eq2.diff(y)]])
    print Jacobian
    detet = Jacobian.determinant()
    trace = Jacobian.trace()
    eigs = Jacobian.eigenvalues()
    print detet
    #print eigs
    print trace
    #print det.subs(x=2,y=2)
    for i in range(0,len(xcoords)):
        det = detet.subs(x=xcoords[i], y =ycoords[i])
        trac = trace.subs(x=xcoords[i], y =ycoords[i])
        print det
        print trac
        det = det.numerical_approx(32)
        trac = trac.numerical_approx(32)
        print det
        print trac
# Check for Stability and possibly the orientation
        if (det > 0):
            if (trac > 0):
                if (trac^2 > 4*det):
                    print 'unstable node'
                    #unstable node
                elif (trac^2 < 4*det):
                    print 'unstable spiral'
                    #unstable spiral
                elif(trac^2 == 4*det):
                    print 'semi-stable'
                    #semi-stable : Star or degenerate Node
            
            elif (trac < 0):
                if (trac^2 > 4*det):
                    print 'stable node'
                    #stable Node
                elif (trac^2 < 4*det):
                    print 'stable spiral'
                    #stable spiral
                elif(trac^2 == 4*det):
                    print 'semi-stable'
                    #semi-stable : unknown
                    
            elif (trac == 0):
                print 'stable Center'
                #Centers - Stable
                # orientation of the center can only be determined by eigenvalues
        elif (det < 0):
            print 'unstable saddle node'
            #saddle Node: Unstable
            
        elif (det == 0):
            print 'unstablea'
            #Non-isolated fixed points"""
︡ecbe8cef-33e3-4084-a5d1-53f95a38e731︡
︠26be5af8-3910-4ba2-8766-1c8ad9c69b20︠
x,y = var('x,y')
Find_Stability(x+y,4*x - 2*y,[0],[0])
︡a0d5c0af-1bc5-4153-9618-a59c7c0b1a99︡{"stdout":"[ 1  1]\n[ 4 -2]\n-6\n-1\n-6\n-1\n-6.00000000\n-1.00000000\nunstable saddle node\n"}︡
︠54cd479e-1be8-4610-9294-52c0d2fd5e63︠
x,y = var('x,y')
Find_Stability(x*(3-x)-2*x*y , y*(2-y) - x*y,[0,3,0,1],[0,0,2,1])
︡e1910797-f524-4cde-ac78-825fce1a43a3︡{"stdout":"[-2*x - 2*y + 3           -2*x]\n[            -y   -x - 2*y + 2]\n(2*x + 2*y - 3)*(x + 2*y - 2) - 2*x*y\n-3*x - 4*y + 5\n6\n5\n6.00000000\n5.00000000\nunstable node\n3\n-4\n3.00000000\n-4.00000000\nstable node\n2\n-3\n2.00000000\n-3.00000000\nstable node\n-1\n-2\n-1.00000000\n-2.00000000\nunstable saddle node\n"}︡
︠65a2c68a-4e6e-4ca9-b033-66c2d9b827b6︠
x,y = var('x,y')
Find_Stability(y,-4*x,[0],[0])
︡84c34dfa-b8df-4f40-8ea4-3bedfcef8495︡{"stdout":"[ 0  1]\n[-4  0]\n4\n0\n4\n0\n4.00000000\n0.000000000\nstable Center\n"}︡
︠fd5f13f8-3021-4e2c-aceb-2451b66021f0︠
x,y = var('x,y')
Find_Stability(y-x^3,-x-y^3,[0],[0])
︡fcc8d1ab-5858-4cf1-9b8a-b4f9bf268808︡{"stdout":"[-3*x^2      1]\n[    -1 -3*y^2]\n9*x^2*y^2 + 1\n-3*x^2 - 3*y^2\n1\n0\n1.00000000\n0.000000000\nstable Center\n"}︡
︠c48cf1e3-9b08-422a-8210-933d3cb34d6d︠




















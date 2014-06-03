︠a8b6d031-31c1-493d-8b80-782dcce2d0c5︠
x,y = var('x y')
@interact
def analyze(x_prime = ("x' = ", x*(3-x)-2*x*y) ,y_prime = ("y' = ",  y*(2-y) - x*y),ix = ("Initial x", 15), iy = ("Initial y", 15)):
    """
    Analyze uses the interact decorator to dynamically solve the given system of differential equations and provides 
    1)The real fixed points of the system
    2)Orientation of each fixed point      
    3)Vector field of the system 
    4)Trajectory of initial point on the vector field.
    
    INPUT:
    
    * "x'" -- A differential equation that represents x' and contains either only x or both x and y as its varibles. 
    
    * "y'" -- A differential equation that represents y' and contains either only x or both x and y as its varibles. 
    
    * "initial x value'" -- The x location of the initial point, contains only a single real number. 
    
    * "initial y value'" -- The y location of the initial point, contains only a single real number. 
    
    OUTPUT:
    
    * "List of fixed points along with orientation and plot of vector field" – displays an array of fixed points respective to the given differential equations. Additionally draws the vector field and the trajectory of the initial conditions. Fixed points represented by red dots and trajectory represented by blue line.
    
    EXAMPLES:
    
    sage: analyze( x*(3-x)-2*x*y , y*(2-y) - x*y, 15, 15)
    Fixed Points:
    [0, 0]
    [3, 0]
    [0, 2]
    [1, 1]
    The Fixed Point [0,0] is:
    unstable node
    The Fixed Point [3,0] is:
    stable node
    The Fixed Point [0,2] is:
    stable node
    The Fixed Point [1,1] is:
    unstable saddle node
    
    *** Vector field Diagram with fixed points and inital condition trajectory.*** 
    
    sage: analyze( sin(x)^2 , cos(y)*x , 15, 15)
    Fixed Points:
    There are no fixed points
    
    *** Vector field Diagram with fixed points and inital condition trajectory.*** 
    """
    x,y = var('x y')
    eq1 = x_prime
    eq2 = y_prime
    # Here we are utilizing the solve function to solve the system of equations
    fixedpts = solve([eq1==0, eq2==0], x, y, solution_dict=True)
    xcoords = []
    ycoords = []
    
    # We eliminate any complex solutions to the system of equations.
    for a in fixedpts:
        if a[x].imag() == 0: 
            if a[y].imag() == 0:
                xcoords.append(a[x])
                ycoords.append(a[y])
    
    # Here we print the fixed points accordingly and print 'there are no fixed points' if none exist          
    print "Fixed Points:"
    for i in range(0,len(xcoords)):
        c = [xcoords[i],ycoords[i]]
        print c
    if (len(xcoords) == 0):
        print 'There are no fixed points'
    
    # In order to find the stability we first must calculate the jacobian matrix
    # we utilize the partial differential function to create our jacobian matrix
    Jacobian = matrix([[eq1.diff(x),eq1.diff(y)],[eq2.diff(x),eq2.diff(y)]])
    
    #Uncomment To check the jocobian 
    #print Jacobian
    
    #We utilize the inbuilt determinent, trace, and eigenvalue commands
    detet = Jacobian.determinant()
    trace = Jacobian.trace()
    eigs = Jacobian.eigenvalues()
    
    #uncomment to view any of these properties
    #print detet
    #print eigs
    #print trace
    #print xcoords
    #print ycoords
    
    #Now we evaulate the determinent and trace at each fixed point to yield its stability
    for i in range(0,len(xcoords)):
        det = detet.subs(x = xcoords[i],y = ycoords[i])
        trac = trace.subs(x = xcoords[i],y = ycoords[i])
        
        #uncomment to view any of these properties
        #print det
        #print trac
        
        det = det.numerical_approx(32)
        trac = trac.numerical_approx(32)
        
        #uncomment to view any of these properties
        #print det
        #print trac
        
        s = 'The Fixed Point [' + repr(xcoords[i]) + ',' + repr(ycoords[i]) + "] is:"
        print s
        
        # Check for Stability and orientation of each fixed point
        if (det > 0):
            if (trac > 0):
                if (trac^2 > 4*det):
                    print 'Unstable Node'
                    #unstable node
                elif (trac^2 < 4*det):
                    print 'Unstable Spiral'
                    #unstable spiral
                elif(trac^2 == 4*det):
                    print 'Semi-Stable'
                    #semi-stable : Star or degenerate Node
            
            elif (trac < 0):
                if (trac^2 > 4*det):
                    print 'Stable Node'
                    #stable Node
                elif (trac^2 < 4*det):
                    print 'Stable Spiral'
                    #stable spiral
                elif(trac^2 == 4*det):
                    print 'Semi-Stable'
                    #semi-stable : unknown
                    
            elif (trac == 0):
                print 'Stable Center'
                #Centers - Stable
                #orientation of the center can only be determined by eigenvalues
        elif (det < 0):
            print 'Unstable Saddle Node'
            #saddle Node: Unstable
            
        elif (det == 0):
            print 'Non-isolated fixed points'
            #Non-isolated fixed points""" 
    
    #Now we use the graph function to plot the vector field of the system
    window = max(ix,iy) + 5
    f=[eq1,eq2]
    sol=desolve_odeint(f,[ix,iy],srange(0,10,0.001),[x,y])
    p=line(zip(sol[:,0],sol[:,1]))
    p += plot_vector_field((eq1, eq2), (x,-1*window,window), (y,-1*window,window))
    for i in range(0,len(xcoords)):
        p += circle((xcoords[i],ycoords[i]), window/40, rgbcolor=(1,0,0), linestyle='-.',fill = true)
    p.show(aspect_ratio=1)
︡24bc28ab-e583-4f7b-b048-15c9bfeccce6︡{"interact":{"style":"None","flicker":false,"layout":[[["x_prime",12,null]],[["y_prime",12,null]],[["ix",12,null]],[["iy",12,null]],[["",12,null]]],"id":"f7e4052f-7eee-4eba-be4b-f7c142803a69","controls":[{"control_type":"input-box","default":"-(x - 3)*x - 2*x*y","label":"x' = ","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"x_prime","type":null},{"control_type":"input-box","default":"-x*y - (y - 2)*y","label":"y' = ","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"y_prime","type":null},{"control_type":"input-box","default":15,"label":"Initial x","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"ix","type":null},{"control_type":"input-box","default":15,"label":"Initial y","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"iy","type":null}]}}︡
︠a4d030c0-bd44-4edb-bdef-acc12602239c︠
︡3719af5b-7e3d-4bd7-9306-df6442fe4b27︡
︠5ca760e4-34db-4012-bbd8-2c4935c2413e︠










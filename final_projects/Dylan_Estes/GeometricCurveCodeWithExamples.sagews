︠83e42cdc-0ba7-419a-bb3e-c988791a40ac︠
class GeometricCurve:
    """
    Used as an educational tool for Maath 442. Shows, as well as gives values, for the Tangent, Normal and Binormal Vectors
    for a curve of one variable. This class is useable with any variable, but must be specified.
    
    The class has multiple functions that can be called upong to return various properties of a curve of one variable. 
    They include: Tangent, Normal and Binormal Vectors, Torsion, Curvature and the Frenet Frame. Finally, it has a
    color coordinated plot function that shows the curve itself as well as the Tangent, Normal and Binormal Vectors 
    at a specified point.
    
    Examples: 
    sage: f = GeometricCurve(cos(x),sin(x),1,x,0,2*pi)
    sage: f.tangent()
    (-sin(x), cos(x), 0)
    
    sage: f.normal()
    (-cos(x), -sin(x), 0)
    
    sage: f.binormal()
    (0, 0, 1)
    
    sage: f.torsion()
    0
    
    sage: f.curvature()
    1
    
    f.plot(pi)  
    
    Another variable can be used, as well as symbolic evaluation. Use %var or a = var('a')
    The plot function will no longer work in symbolic evaluation
    
    sage: a,b,c,y = var('a','b','c','y')
    sage: f = GeometricCurve(a*cos(y/c),a*sin(y/c),b*y/c,y,0,2*pi)
    sage: f.torsion()
    -b/c^2
    
    sage: f.curvature()
    sqrt(a^2/c^4)
    """
    
    def __init__ (self, f,g,h,s,start,end):
        import numpy as np
        f = SR(f); g = SR(g); h = SR(h); s = SR(s)
        self.s = s; self.f = f; self.g = g; self.h = h; self.start = start; self.end = end
        v = []
        def u(t):
            v = (self.f.subs({s:t}), self.g.subs({s:t}), self.h.subs({s:t}))
            return v
        for i in np.linspace(start, end, 35*(end-start)):
            v.append(u(i))
        self.v = v
        tan = vector([derivative(f, s).simplify_full(),derivative(g, s).simplify_full(),derivative(h, s).simplify_full()])
        self.tan = tan
        norm = vector([derivative(f, s,s),derivative(g, s,s),derivative(h, s,s)]).simplify_full()
        k = (sqrt(norm[0]**2 + norm[1]**2 + norm[2]**2)).simplify_full()
        self.k = k
        if k != 0:    
            norm = (norm/k).simplify_full()
            self.norm = norm
            binorm = tan.cross_product(norm).simplify_full()
            self.binorm = binorm

    
    def plot(self,t):
        if t > self.end or t < self.start:
            return str('Endpoint Out of Bounds') 
        s = self.s
        curve = line(self.v, color='black')
        if self.k == 0:
            return curve
        else:
            def u(t):
                v = (self.f.subs({s:t}), self.g.subs({s:t}), self.h.subs({s:t}))
                return v           
            p = u(t)
            p_tangent = ([(self.tan[i]).subs({s:t}) + p[i] for i in range(3)])
            tangent_plot = line([p, p_tangent], color='red', legend_label = 'Tangent Vector', legend_color = 'red')
            p_normal = ([(self.norm[i]).subs({s:t}) + p[i] for i in range(3)])
            normal_plot = line([p, p_normal], color='blue', legend_label = 'Normal Vector', legend_color = 'blue')
            p_binormal = ([(self.binorm[i]).subs({s:t}) + p[i] for i in range(3)])
            binormal_plot = line([p, p_binormal], color = 'darkgreen', legend_label = 'Binormal Vector', legend_color = 'darkgreen')
            print 'The Tangent Vector is Red'
            print 'The Normal Vector is Blue'
            print 'The Binormal Vector is Green'
            return curve+tangent_plot+normal_plot+binormal_plot
             
    def tangent(self):
        return self.tan

    def normal(self):
        if self.k ==0:
            print "This function has no Normal Vector"
        else:
            return self.norm

    def binormal(self):
        if self.k ==0:
            print "This function has no Binormal Vector"
        else:
            return self.binorm

    def Frenet_Frame(self):
       if self.k ==0:
            print "Curvature is zero, this function has no Frenet Frame"
       else:  
            t_prime = self.k*self.norm
            n_prime = derivative(self.norm, self.s)
            b_prime = (self.tan).cross_product(n_prime)
            self.tau = b_prime/self.norm
            return 't_prime:'+str(t_prime), 'n_prime:' +str(n_prime), 'b_prime:' + str(b_prime)

    def torsion(self):
        if self.k ==0:
            print "Curvature is zero, this function has no Torsion"
        else:
            if not 'tau' in locals():
                self.Frenet_Frame()
            return self.tau

    def curvature(self):
        return self.k


︡c52f9c15-6a5d-4fe1-a252-1e5ab0246589︡
︠7edfd1a0-4527-4e7e-b2e3-11cd6085805a︠
#Basic Example of using this class. This plots the Helix.
g = GeometricCurve(cos(x),sin(x),x,x,0,2*pi)
g.tangent()
g.normal()
g.binormal()
g.Frenet_Frame()
g.torsion()
g.curvature()
g.plot(pi)
︡7577b1fa-daf2-4233-9dd6-7ff0dad399d4︡{"stdout":"(-sin(x), cos(x), 1)\n"}︡{"stdout":"(-cos(x), -sin(x), 0)\n"}︡{"stdout":"(sin(x), -cos(x), 1)\n"}︡{"stdout":"('t_prime:(-cos(x), -sin(x), 0)', 'n_prime:(sin(x), -cos(x), 0)', 'b_prime:(cos(x), sin(x), 0)')\n"}︡{"stdout":"-1\n"}︡{"stdout":"1\n"}︡{"stdout":"The Tangent Vector is Red\nThe Normal Vector is Blue\nThe Binormal Vector is Green\n"}︡{"html":"<div id=ae6f1ba4-aa27-4596-b084-2170bb4b2d03 style='border:1px solid grey'></div>"}︡{"obj":"{\"foreground\": null, \"camera_distance\": 12.566370614359172, \"height\": null, \"width\": null, \"renderer\": null, \"background\": null}","javascript":{"coffeescript":false,"code":"$('#ae6f1ba4-aa27-4596-b084-2170bb4b2d03').salvus_threejs(obj)"},"once":false}︡
︠64176f62-2c6c-4565-9198-e8cbc65a9e1b︠
#A more complex function modeled. For this one, however, note that the Frenet Frame does not work but it is still able to be plotted. 
#Most functions can be plotted, but some will result in an invalid Frenet Frame (Division by Zero), which is expected.
g = GeometricCurve(cos(x)*sin(x),sin(x)*x^2,x*x,x,0,2*pi)
g.tangent()
g.normal()
g.binormal()
g.curvature()
g.plot(pi)
︡e8382062-caf9-4068-9ad8-3936d785b54e︡{"stdout":"(2*cos(x)^2 - 1, x^2*cos(x) + 2*x*sin(x), 2*x)\n"}︡{"stdout":"(-4*cos(x)*sin(x)/sqrt(-16*sin(x)^4 - 8*(x^3 - 2*x)*cos(x)*sin(x) + (x^4 - 20*x^2 + 20)*sin(x)^2 + 16*x^2 + 4), (4*x*cos(x) - (x^2 - 2)*sin(x))/sqrt(-16*sin(x)^4 - 8*(x^3 - 2*x)*cos(x)*sin(x) + (x^4 - 20*x^2 + 20)*sin(x)^2 + 16*x^2 + 4), 2/sqrt(-16*sin(x)^4 - 8*(x^3 - 2*x)*cos(x)*sin(x) + (x^4 - 20*x^2 + 20)*sin(x)^2 + 16*x^2 + 4))\n"}︡{"stdout":"(-2*(x^3*sin(x) - 3*x^2*cos(x))*sqrt(-16*sin(x)^4 - 8*(x^3 - 2*x)*cos(x)*sin(x) + (x^4 - 20*x^2 + 20)*sin(x)^2 + 16*x^2 + 4)/(16*sin(x)^4 + 8*(x^3 - 2*x)*cos(x)*sin(x) - (x^4 - 20*x^2 + 20)*sin(x)^2 - 16*x^2 - 4), 2*sqrt(-16*sin(x)^4 - 8*(x^3 - 2*x)*cos(x)*sin(x) + (x^4 - 20*x^2 + 20)*sin(x)^2 + 16*x^2 + 4)*(4*x*cos(x)*sin(x) + 2*cos(x)^2 - 1)/(16*sin(x)^4 + 8*(x^3 - 2*x)*cos(x)*sin(x) - (x^4 - 20*x^2 + 20)*sin(x)^2 - 16*x^2 - 4), (2*(x^2 + 2)*sin(x)^3 - 4*x*cos(x) - (3*x^2 + 2)*sin(x))*sqrt(-16*sin(x)^4 - 8*(x^3 - 2*x)*cos(x)*sin(x) + (x^4 - 20*x^2 + 20)*sin(x)^2 + 16*x^2 + 4)/(16*sin(x)^4 + 8*(x^3 - 2*x)*cos(x)*sin(x) - (x^4 - 20*x^2 + 20)*sin(x)^2 - 16*x^2 - 4))\n"}︡{"stdout":"sqrt(-16*sin(x)^4 - 8*(x^3 - 2*x)*cos(x)*sin(x) + (x^4 - 20*x^2 + 20)*sin(x)^2 + 16*x^2 + 4)\n"}︡{"stdout":"The Tangent Vector is Red"}︡{"stdout":"\nThe Normal Vector is Blue\nThe Binormal Vector is Green\n"}︡{"html":"<div id=ca79c501-3fe4-4c3f-93a9-012022ecbd7c style='border:1px solid grey'></div>"}︡{"obj":"{\"foreground\": null, \"camera_distance\": 78.95683520871486, \"height\": null, \"width\": null, \"renderer\": null, \"background\": null}","javascript":{"coffeescript":false,"code":"$('#ca79c501-3fe4-4c3f-93a9-012022ecbd7c').salvus_threejs(obj)"},"once":false}︡
︠a952d34c-c414-4c6a-b4cc-3c365a4d8082︠
#This is an exampels showing that it can take any variable as long as it is defined.
%var y
g = GeometricCurve(cos(y),sin(y),y, y, 0,2*pi)
g.tangent()
g.normal()
g.binormal()
g.Frenet_Frame()
g.torsion()
g.curvature()
g.plot(pi)
︡fa08116c-6075-40fc-8f7f-3d47a442ef95︡{"stdout":"(-sin(y), cos(y), 1)\n"}︡{"stdout":"(-cos(y), -sin(y), 0)\n"}︡{"stdout":"(sin(y), -cos(y), 1)\n"}︡{"stdout":"('t_prime:(-cos(y), -sin(y), 0)', 'n_prime:(sin(y), -cos(y), 0)', 'b_prime:(cos(y), sin(y), 0)')\n"}︡{"stdout":"-1\n"}︡{"stdout":"1\n"}︡{"stdout":"The Tangent Vector is Red\nThe Normal Vector is Blue\nThe Binormal Vector is Green\n"}︡{"html":"<div id=d66e58e2-bb56-4e99-a4c8-8d83a55c34fc style='border:1px solid grey'></div>"}︡{"obj":"{\"foreground\": null, \"camera_distance\": 12.566370614359172, \"height\": null, \"width\": null, \"renderer\": null, \"background\": null}","javascript":{"coffeescript":false,"code":"$('#d66e58e2-bb56-4e99-a4c8-8d83a55c34fc').salvus_threejs(obj)"},"once":false}︡
︠ce03b96c-34f0-4533-9b1d-f1a7ee331492︠
#This is the Final Example showing the symbolic calculations that can be made. Note that the plot function 
#will no longer work in this instance.
%var y
a,b,c = var('a','b','c')
g = GeometricCurve(a*cos(y/c),a*sin(y/c),b*y/c,y,0,2*pi)
g.tangent()
g.normal()
g.binormal()
g.Frenet_Frame()
g.torsion()
g.curvature()
︡35bde861-cb6d-4d54-8e5c-1518d76977f1︡{"stdout":"(-a*sin(y/c)/c, a*cos(y/c)/c, b/c)\n"}︡{"stdout":"(-a*cos(y/c)/(c^2*sqrt(a^2/c^4)), -a*sin(y/c)/(c^2*sqrt(a^2/c^4)), 0)\n"}︡{"stdout":"(a*b*sin(y/c)/(c^3*sqrt(a^2/c^4)), -a*b*cos(y/c)/(c^3*sqrt(a^2/c^4)), a^2/(c^3*sqrt(a^2/c^4)))\n"}︡{"stdout":"('t_prime:(-a*cos(y/c)/c^2, -a*sin(y/c)/c^2, 0)', 'n_prime:(a*sin(y/c)/(c^3*sqrt(a^2/c^4)), -a*cos(y/c)/(c^3*sqrt(a^2/c^4)), 0)', 'b_prime:(a*b*cos(y/c)/(c^4*sqrt(a^2/c^4)), a*b*sin(y/c)/(c^4*sqrt(a^2/c^4)), 0)')\n"}︡{"stdout":"-b/c^2\n"}︡{"stdout":"sqrt(a^2/c^4)\n"}︡
︠4b5ee0d2-08bb-4599-a111-99232881af8e︠











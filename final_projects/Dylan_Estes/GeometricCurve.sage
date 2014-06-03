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














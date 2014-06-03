︠787d7d34-ed6f-443b-8fac-044bba165128︠
class Surface_Revolution:
    """
    Used as an educational tool for Math 442. This class works specifically with surfaces off revolution and will symbolically solve many relevent equations to the course. The class includes: Mean, Gaussian, and Principle curvatures, the first fundamental form, and the second fundamental form. Finally, it has a
    color coordinated plot function that plots specific types of points different colors. It also has a function that returns the type of point for a specified v value.
    

    Use of the form: Surface_Revolution(f, g), where both f and g must be functions of the single variable 'v'.
    
    Examples: 
    sage: s = Surface_Revolution(3+cos(v),sin(v))
    sage: s.FundForm_1()
    [cos(v)^2 + 6*cos(v) + 9                       0]
    [                      0                       1]
    
    sage: s.PointType(pi/2)
    'parabolic'
    
    sage: s.Mean_Curvature()
    -1/2*((cos(v)^2 + sin(v)^2)*cos(v) + (cos(v)^2 + sin(v)^2)*sin(v))/((cos(v)^2 + sin(v)^2)^(3/2)*abs(sin(v)))
    
    sage: s.Principal_Curvature()
    [                                                 -1                                                   0]
    [                                                  0 (sin(v)^2 - 3*cos(v) - 1)/(cos(v)^2 + 6*cos(v) + 9)]
    
    """    
    def __init__(self,f,g):
        self.f = f
        self.g = g
        v = var('v')
        u = var('u')
        
        E = (f**2).full_simplify()
        F = 0
        G = (diff(f, v)**2+diff(g, v)**2).full_simplify()
        fundform1 = matrix(SR,2,[E, F, F, G])
        self.FundForm_1 = fundform1
        
        le = (-abs(f)*diff(g, v)/sqrt(diff(f, v)**2+diff(g, v)**2)).full_simplify()
        lf = 0
        lg = (sgn(f)*(diff(f, v, 2)*diff(g, v)-diff(g, v, 2)*diff(f, v))/sqrt(diff(f, v)**2+diff(g, v)**2)).full_simplify()
        fundform2 = matrix(SR,2,[le, lf, lf, lg])
        
        self.FundForm_2 = fundform2
        k2 = (fundform2()[0, 0]/fundform1()[0, 0]).full_simplify()
        k1 = (fundform2()[1, 1]/fundform1()[1, 1]).full_simplify()
        self.k2 = k2
        self.k1 = k1
        PrincipalCurvature = matrix(SR,2,[k1, 0, 0, k2])
        
        self.Principal_Curvature = PrincipalCurvature
        
        Gaussian_Curvature = (diff(f,v,2)*(-diff(g,v)**2)+diff(f,v)*diff(g,v)*diff(g,v,2))/(g*(diff(g,v)**2+diff(f,v)**2))**2
        self.Gaussian_Curvature = Gaussian_Curvature
        
        Mean_Curvature = (g*(diff(f,v,2)*diff(g,v)-diff(f,v)*diff(g,2))-diff(g,v)*(diff(f,v)**2+diff(g,v)**2))/(2*abs(g)*(diff(f,v)**2+diff(g,v)**2)**(3/2))
        self.Mean_Curvature = Mean_Curvature
        
    def Parametric(self):
        return (self.f*cos(u),self.f*sin(u),self.g)
    
    def FundForm_1(self):
        return self.FundForm_1
    
    def FundForm_2(self):
        return self.FundForm_2
    
    def Gaussian_Curvature(self):
        return self.Gaussian_Curvature
    
    def Mean_Curvature(self):
        return self.Mean_Curvature   
    
    def Principal_Curvature(self):
        return self.Principal_Curvature
    
    def PointType(self,x):
        se = self.Principal_Curvature()
        if self.Principal_Curvature()[0,0] == 0 and  self.Principal_Curvature()[1,1] == 0:
            return "planar"
        elif det(se(v = x)) > 0:
            return "elliptic" 
        elif det(se(v = x)) < 0:
            return "hyperbolic"
        else:
            return "parabolic"
        
    def PlotPoints(self,n):
        import numpy as np
        UU = np.linspace(0,2*pi,n)
        VV = [x*(2*pi)/n for x in range(n)]

        hyper = []
        para = []
        ellip = []
        plan = []
        for i in VV:
            if s.PointType(i) == 'planar':
                plan.append(i)
            elif s.PointType(i) == 'hyperbolic':
                hyper.append(i)
            elif s.PointType(i) == 'elliptic':
                ellip.append(i)
            else:
                para.append(i)
        points = point3d((0,0,0), color = 'white')
        if ellip != []:
            f1 = [self.f(v = x) for x in ellip]
            g1 = [self.g(v = x) for x in ellip]
            z1 = [cos(x) for x in UU]
            x1 = [sin(x) for x in UU]
            list1 = [(f1[i]*z1[j],f1[i]*x1[j],g1[i]) for i in range(len(ellip)) for j in range(len(UU))]

            for x in range(len(list1)):
                points += point3d(list1[x], color = 'blue')
        if hyper != []:
            f2 = [self.f(v = x) for x in hyper]
            g2 = [self.g(v = x) for x in hyper]
            z2 = [cos(x) for x in UU]
            x2 = [sin(x) for x in UU]
            list2 = [(f2[i]*z2[j],f2[i]*x2[j],g2[i]) for i in range(len(hyper)) for j in range(len(UU))]
            for x in range(len(list2)):
                points += point3d(list2[x], color = 'green')
        if para != []:
            f3 = [self.f(v = x) for x in para]
            g3 = [self.g(v = x) for x in para]
            z3 = [cos(x) for x in UU]
            x3 = [sin(x) for x in UU]
            list3 = [(f3[i]*z3[j],f3[i]*x3[j],g3[i]) for i in range(len(para)) for j in range(len(UU))]
            for x in range(len(list3)):
                points += point3d(list3[x], color = 'red')
        if plan != []:
            f4 = [self.f(v = x) for x in plan]
            g4 = [self.g(v = x) for x in plan]
            z4 = [cos(x) for x in UU]
            x4 = [sin(x) for x in UU]
            list3 = [(f4[i]*z4[j],f4[i]*x4[j],g4[i]) for i in range(len(plan)) for j in range(len(UU))]
            for x in range(len(list4)):
                points += point3d(list4[x], color = 'grey')
        print 'Elliptic points are blue'
        print 'Hyperbolic points are green'
        print 'Parabolic points are red'
        print 'Planar points are grey'
        return points
︡bba83820-fefc-4c75-afe0-2c2155385a6a︡
︠6ab6e67b-eb2f-46d2-815e-eeded0e6f5cf︠
%var v
s = Surface_Revolution(3+cos(v),sin(v))
s.PlotPoints(100)
︡3914eb93-9590-4aa7-abf1-5108e2462807︡{"stdout":"Elliptic points are blue"}︡{"stdout":"\nHyperbolic points are green\nParabolic points are red\nPlanar points are grey\n"}︡{"html":"<div id=4bf85e7e-9e03-4efe-a86a-79996486b06d style='border:1px solid grey'></div>"}︡{"obj":"{\"foreground\": null, \"camera_distance\": 8.0, \"height\": null, \"width\": null, \"renderer\": null, \"background\": null}","javascript":{"coffeescript":false,"code":"$('#4bf85e7e-9e03-4efe-a86a-79996486b06d').salvus_threejs(obj)"},"once":false}︡
︠61f7d13a-2a70-4101-b969-6b0eab87f0be︠










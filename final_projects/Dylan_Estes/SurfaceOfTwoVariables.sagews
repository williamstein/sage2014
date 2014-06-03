︠75da112e-3021-41fb-be95-9227470d617b︠
class Surface_Two_Variables:
    """
    Used as an educational tool for Math 442. This class works specifically with surfaces of two variables and will symbolically solve many relevent equations to the course. The class includes: Mean, Gaussian, and Principle curvatures, the first fundamental form, and the second fundamental form. It also has a function that returns the type of point for a specified x and y value.
    

    Use of the form:
        x,y = var('x','y')
        Surface_Revolution(h), where h is a function of both x and y.
        
    
    Examples: 
    sage: s = Surface_Two_Variables(x^3-3*(y**2)*x)
    sage: s.FundForm_1()
    [9*(x^2 - y^2)^2 + 1 -18*(x^2 - y^2)*x*y]
    [-18*(x^2 - y^2)*x*y      36*x^2*y^2 + 1]
    
    sage: s.PointType(0,0)
    'planar'
    
    sage: s.Mean_Curvature()
    -6*(36*(x^2 - y^2)*x*y^2 - (36*x^2*y^2 + 1)*x + (9*(x^2 - y^2)^2 + 1)*x)/(36*x^2*y^2 + 9*(x^2 - y^2)^2 + 1)^(3/2)
    
    sage: s.Principal_Curvature()
    [ sqrt(36*(36*(x^2 - y^2)*x*y^2 - (36*x^2*y^2 + 1)*x + (9*(x^2 - y^2)^2 + 1)*x)^2/(36*x^2*y^2 + 9*(x^2 - y^2)^2 + 1)^3 + 36*(x^2 + y^2)/(36*x^2*y^2 + 9*(x^2 - y^2)^2 + 1)^2) - 6*(36*(x^2 - y^2)*x*y^2 - (36*x^2*y^2 +       1)*x + (9*(x^2 - y^2)^2 + 1)*x)/(36*x^2*y^2 + 9*(x^2 - y^2)^2 + 1)^(3/2) 0]
    [0 -sqrt(36*(36*(x^2 - y^2)*x*y^2 - (36*x^2*y^2 + 1)*x + (9*(x^2 - y^2)^2 + 1)*x)^2/(36*x^2*y^2 + 9*(x^2 - y^2)^2 + 1)^3 + 36*(x^2 + y^2)/(36*x^2*y^2 +       9*(x^2 - y^2)^2 + 1)^2) - 6*(36*(x^2 - y^2)*x*y^2 -             (36*x^2*y^2 + 1)*x + (9*(x^2 - y^2)^2 + 1)*x)/(36*x^2*y^2 + 9*(x^2 - y^2)^2 + 1)^(3/2)]  
    """
    def __init__(self,h):
        x = var('x')
        y = var('y')
        self.h = h      
        
        K = (diff(h,x,2)*diff(h,y,2)-diff(diff(h,y), x)**2)/(1 + diff(h,x)**2 + diff(h,y)**2)**2        
        self.Gaussian_Curvature = K

        H =((1+diff(h,x)**2)*diff(h,y,2)-2*diff(h,x)*diff(h,y)*diff(diff(h,x),y)+(1+diff(h,y)**2)*diff(h,x,2))/(1 + diff(h,x)**2 + diff(h,y)**2)**(3/2)
        self.Mean_Curvature = H
     
        k1 = H + sqrt(H**2-K)
        k2 = H - sqrt(H**2-K)
        self.k1 = k1
        self.k2 = k2
        Principal_Curvature = matrix(SR,2,[self.k1,0,0,self.k2])
        self.Principal_Curvature = Principal_Curvature       
        
        Xu = vector([1, 0, diff(h,x)])
        Xv = vector([0, 1, diff(h,y)])
        E = Xu.dot_product(Xu)
        F = Xu.dot_product(Xv)
        G = Xv.dot_product(Xv)
        fundform1 = matrix(SR,2,[E, F, F, G])
        self.FundForm_1 = fundform1
        
        e = diff(h, x, 2)/(1+diff(h, x)**2+diff(h, y)**2)**(1/2)
        f = diff(diff(h, x), y)/(1+diff(h, x)**2+diff(h, y)**2)**(1/2)
        g = diff(h, y, 2)/(1+diff(h, x)**2+diff(h,  y)**2)^(1/2)
        fundform2 = matrix(SR,2,[e, f, f,  g])
        self.FundForm_2 = fundform2
        
    def Parametric(self):
        return (x,y,self.h)
    
    def Gaussian_Curvature(self):
        return self.Gaussian_Curvature
    
    def Mean_Curvature(self):
        return self.Mean_Curvature
    
    def PointType(self,u,v):
        if self.k1(x = u,y = v) == 0 and self.k2(x = u, y = v) == 0:
            return 'planar'
        elif det(matrix(SR,2,[self.k1(x = u,y = v),0,0,self.k2(x = u, y = v)])) > 0:
            return 'elliptic' 
        elif det(matrix(SR,2,[self.k1(x = u,y = v),0,0,self.k2(x = u,y = v)])) < 0:
            return 'hyperbolic'
        else:
            return 'parabolic'     
        
    def Principal_Curvature(self):
        return self.Principal_Curvature
    
    def FundForm_1(self):
        return self.FundForm_1
    
    def FundForm_2(self):
        return self.FundForm_2
︡bba48818-1f72-4471-8d01-4457c759bc8e︡
︠6fa1e14d-29a3-4097-bac8-8254e5b7eda3︠
x,y = var('x','y')
m = Surface_Two_Variables(x^3-3*(y**2)*x)
m.PointType(0,0)
︡74f54950-2b07-40e0-90c8-646bd26a7e11︡{"stdout":"'planar'\n"}︡
︠0054e028-6c97-4705-b01f-af372dc0cdd5︠










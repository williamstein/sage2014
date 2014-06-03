︠1d73e65f-33e7-4829-ac5d-8350d74bcbf9︠
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

︡9036f08f-86dc-4ee6-9df5-8b5cd60ed11b︡
︠4a92d5f6-d8c4-4bd7-a5ad-dcb98bc7b8c8︠
x,y = var('x','y')
m = Surface_Two_Variables(x^3-3*(y**2)*x)
︡6c10f378-4e13-4bd9-bf77-f7c7f1dca7bc︡
︠c661a0f7-5aef-4416-8784-b0db3b2f0979︠
m.PointType(0,0)
︡0912ba9f-850e-4c39-94bc-94261377559e︡{"stdout":"'planar'\n"}︡
︠7b09f91f-128c-4707-ba05-373d43ed7e86︠

︠bc2c0839-0846-406a-bf13-4bb59b876da0︠













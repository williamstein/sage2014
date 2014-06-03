class parse_eq:

    def __init__(self,eq,h,k):
    
        self.eq = eq
        self.h = h
        self.k = k
    
    def parse(self):
        
        #Manipulate equation
        var('uin','uipn','uimn','uinp','uimnp','uipnp')
        
        #Define approx.
        approx = {
        u: (uin + uinp)/2, 
        dudt: (uinp - uin)/self.k,
        dudx: (uipn - uimn)/self.h,
        du2dx2: ((uipn - 2*uin + uimn)+(uipnp - 2*uinp + uimnp))/(2*(self.h**2))
        }
        
        eq_approx = self.eq(approx) #Make the approximations
        
        
        #extract the coefficients
        A = eq_approx.coefficient(uipnp)
        B = eq_approx.coefficient(uinp)
        C = eq_approx.coefficient(uimnp)
        D1 = eq_approx.coefficient(uimn)
        D2 = eq_approx.coefficient(uin)
        D3 = eq_approx.coefficient(uipn)
        
        return [A,B,C,D1,D2,D3]
import numpy as np
from scipy import linalg
import matplotlib.pyplot as plt
'''
This needs filling out

input equation must be symbolic sage variables and must follow the syntax for a function u(x,t)
    --> u, dudt, dudx, du2dx2
    
Additionally it must be solved for zero. 

initial conditions must be posed in Dirichlet form (value of the function at the boundary)

'''
class cranknic:
    
    def __init__(self,t_range,x_range,ic,eq):
        #flush figures, since too many were opening? could fuck up other stuff outside this class... 
        plt.close('all')
        
        self.t_range = t_range
        self.x_range = x_range
        self.ic = ic
        self.eq = eq
    
        if len(x_range) != len(ic):
           raise Exception('Initial conditions and boundary range do not match')
            
    def cranknic(self):
        
        #Grab step sizes
        k = self.t_range[1] - self.t_range[0]
        h = self.x_range[1] - self.x_range[0]
        
        #grab x length
        xlen = len(self.x_range)
        
        #Manipulate equation
        var('uin','uipn','uimn','uinp','uimnp','uipnp')
        
        #Define approx.
        approx = {
        u: (uin + uinp)/2, 
        dudt: (uinp - uin)/k,
        dudx: (uipn - uimn)/h,
        du2dx2: ((uipn - 2*uin + uimn)+(uipnp - 2*uinp + uimnp))/(2*(h**2))
        }
        
        eq_approx = self.eq(approx) #Make the approximations
        
        
        #extract the coefficients
        A = eq_approx.coefficient(uipnp)
        B = eq_approx.coefficient(uinp)
        C = eq_approx.coefficient(uimnp)
        D1 = eq_approx.coefficient(uimn)
        D2 = eq_approx.coefficient(uin)
        D3 = eq_approx.coefficient(uipn)
        
        #Pre-define matrices
        self.ic = np.array(ic)
        leftcoeff = np.zeros((xlen,xlen))
        rightcoeff = np.zeros((xlen,xlen))
        d = np.zeros((xlen,1))
        sol = np.zeros((xlen,1))
           
        #populate first column of solution with ICs
        for i in range(xlen):
            sol[i] = ic[i]
        
        #populate the leftside coeff matrix
        leftcoeff[0][0] = B
        leftcoeff[0][1] = C
        r = xlen-1
        for i in range(1,r):
            leftcoeff[i][i] = B
            leftcoeff[i][i-1] = A
            leftcoeff[i][i+1] = C
        leftcoeff[r][r-1] = A
        leftcoeff[r][r] = B
            
        #populate rightside coeff matrix, make things negative
        rightcoeff[0][0] = -D2
        rightcoeff[0][1] = -D3
        s = xlen-1
        for j in range(1,s):
            rightcoeff[j][j] = -D2
            rightcoeff[j][j-1] = -D1
            rightcoeff[j][j+1] = -D3
        rightcoeff[s][s-1] = -D1
        rightcoeff[s][s] = -D2
            
        #Thomas Algorithm wants a, b, c
        
        #m,n = leftcoeff.shape
        #a = [leftcoeff[i][j] for i in range(m) for j in range(n) if i == j+1]
        #b = [leftcoeff[i][j] for i in range(m) for j in range(n) if i == j]
        #c = [leftcoeff[i][j] for i in range(m) for j in range(n) if i == j-1]
        
        d = np.dot(rightcoeff,ic)
        
        #using LU decomp in numpy
        nextsol = linalg.solve(leftcoeff, d)
        #print 'linalg sol',nextsol
        
        #using the Thomas Algo
        #test = self.thomas(a,b,c,d)
        #print 'thomas sol',test
        
        #add solution to solution matrix
        sol = np.append(sol,nextsol, axis=1)
        
        #replace d with nextsol
        
        #--------------> Begin loop
        for k in range(1,len(self.t_range)-1):
            
            d = np.dot(rightcoeff,nextsol)
            nextsol = linalg.solve(leftcoeff,d)
            #nextsol = thomas(a,b,c,d)
            sol = np.append(sol,nextsol,axis=1)
            
        #--------------> End loop?
        
        return sol

    def show_eq(self):
        show(self.eq == 0)
    
    def heat_map(self,sol):
        fig = plt.figure()
        the_plot = plt.contourf(self.t_range,self.x_range,sol)
        fig.show()
        
        return fig
        
    def contour_map(self,sol):
        fig = plt.figure()
        the_plot = plt.contour(self.t_range,self.x_range,sol)
        plt.clabel(the_plot, inline=1, fontsize=int(12))
        fig.show()

        return fig
        
    def animate(self):
        pass
        
    def thomas(self,a,b,c,d):
        n = len(d) - 1 
        c[0] /= b[0]
        d[0] /= b[0]
        for i in range(1, n): 
            c[i] /= b[i] - a[i] * c[i-1]
            d[i] = (d[i] - a[i] * d[i-1]) / (b[i] - a[i] * c[i-1])
        
        #Final interation, one past where c stops.
        d[n] = (d[n] - a[n-1] * d[n-1]) / (b[n] - a[n-1] * c[n-1])
        
        #Backwards substitution for solution.
        for i in reversed(range(n)):
            d[i] = d[i] - c[i] * d[i+1]
            
        return d

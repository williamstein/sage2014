import numpy as np
import matplotlib.pyplot as plt
load('cranknicC.spyx')
load('parse_eq.sage')

class cranknic_Opt:
    
    def __init__(self,t_range,x_range,ic,eq):
        
        self.t_range = t_range
        self.x_range = x_range
        self.ic = ic
        self.eq = eq
    
        if len(x_range) != len(ic):
           raise Exception('Initial conditions and x_range do not match')
            
    def cranknic(self):
        #needed for the approx
        k = self.t_range[1] - self.t_range[0]
        h = self.x_range[1] - self.x_range[0]
        
        #separate the symbolic math that cython can't deal with
        parseobj = parse_eq(self.eq,h,k)
        approx_coeffs = parseobj.parse()
        
        #use the Cython file
        solobj = cranknicC(self.t_range,self.x_range,self.ic)
        sol = solobj.crankC(approx_coeffs)
        return sol

    def show_eq(self):
        show(self.eq == 0)
    
    def heat_map(self,sol):
        fig = plt.figure()
        the_plot = plt.contourf(self.t_range,self.x_range,sol)
        fig.show()
        
        return the_plot
        
    def contour_map(self,sol):
        fig = plt.figure()
        the_plot = plt.contour(self.t_range,self.x_range,sol)
        plt.clabel(the_plot, inline=1, fontsize=int(12))
        fig.show()
        
        return the_plot
        
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

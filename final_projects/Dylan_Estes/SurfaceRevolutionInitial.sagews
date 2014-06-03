class surfrev:
    
    #variable v? Also, might clean up function names
    #might consider "compressing" everything excpet PlotPoints
    #look at my code, msot eveything is run in init and the important parts  afterwards
    #are saved in self.names  and then the actualy functions jsut call the self values
    #this reduces all the self values and should speed up cade, since it savess the valeus alrready in 
    #the self.names and then with the run, it wont run again. There probably is a cache thing
    #runnign already, but I think it would still be better to do it that way.
    #DO NOT do this with plot though or PointType.
    def __init__(self,v,f,g):
        self.f = f
        self.g = g
        self.v = v
        u= var('u')
        parametric = (f*cos(u),f*sin(u),g)
        self.parametric = parametric
        
        E = (f**2).full_simplify()
        F = 0
        G = (diff(f, v)**2+diff(g, v)**2).full_simplify()
        self.E = E; self.F = F; self.G = G
        FundamentalForm_1 = matrix(SR,2,[E,F,F,G])
        self.FundamentalForm_1 = FundamentalForm_1
        
        e = -abs(self.f)*diff(self.g,self.v)/sqrt(diff(self.f, self.v)**2+diff(self.g, self.v)**2).full_simplify()
        ff = 0
        g = sgn(self.f)*(diff(self.f,self.v,2)*diff(self.g,self.v)-diff(self.g,self.v,2)*diff(self.f,self.v))/sqrt(diff(self.f, self.v)**2+diff(self.g, self.v)**2).full_simplify()
        self.e = e; self.ff = ff; self.g =g
        FundamentalForm_2 = matrix(SR,2,[e,f,f,g])
        self.FundamentalForm_2 = FundamentalForm_2
        
        k1 = (FundamentalForm_2()[1,1]/FundamentalForm_1()[1,1]).full_simplify()
        k2 = (FundamentalForm_2()[0,0]/FundamentalForm_1()[0,0]).full_simplify()
        Principal_Curvature = matrix(SR,2,[k1,0,0,k2])
        self.Principal_Curvature = Principal_Curvature    
    #what is u?
    def Parametric(self):
        return self.parametric
    
    def FundanmentalForm_1(self):
        return self.FundamentalForm_1
    
    def FundForm_2(self):
        return self.FundamentalForm_2
    
    def Principal_Curvature(self):
        return self.Principal_Curvature
   
    #use actual conditions for parabolic, just in case soemthing goes wrong and use the else for an error printout
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
    def PlotPoints(self, number):
        UU = [ x*2*pi/100 for x in range(101)]
        VV = [-pi + x*(2*pi)/100 for x in range(101)]

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
        f1 = [self.f(v = x) for x in ellip]
        g1 = [self.g(v = x) for x in ellip]
        z1 = [cos(x) for x in UU]
        x1 = [sin(x) for x in UU]
        list1 = [(f1[i]*z1[j],f1[i]*x1[j],g1[i]) for i in range(len(ellip)) for j in range(len(UU))]
        f2 = [self.f(v = x) for x in hyper]
        g2 = [self.g(v = x) for x in hyper]
        z2 = [cos(x) for x in UU]
        x2 = [sin(x) for x in UU]
        list2 = [(f2[i]*z2[j],f2[i]*x2[j],g2[i]) for i in range(len(hyper)) for j in range(len(UU))]
        f3 = [self.f(v = x) for x in para]
        g3 = [self.g(v = x) for x in para]
        z3 = [cos(x) for x in UU]
        x3 = [sin(x) for x in UU]
        list3 = [(f3[i]*z3[j],f3[i]*x3[j],g3[i]) for i in range(len(para)) for j in range(len(UU))]
        print len(hyper)
        return point3d(list1, color = 'blue')+point3d(list2, color = 'green')+point3d(list3, color = 'red') 










class DiscreteDistribution():
    
    """
    Represents various common Discrete Probability Distributions. Includes Binomial, Uniform, Poisson, Negative Binomial, Geometric, Hypergeometric, Logarithimic and Borel distributions distributions distributions. A;lows the user to represent, analyze, and interact with the distributions. View http://en.wikipedia.org/wiki/List_of_probability_distributions to see the parameters each distribution requires and what each of these methods do.
    
    EXAMPLES:
    
    Binomial Distribution with n trials, each with probability p::
    
        sage: n = 25
        sage: p = .7
        sage: dist = DiscreteDistribution("Binomial", [n,p])
        sage: dist.prob_func(12)
        0.011475752942239199
        sage: dist.distr_func(20)
        0.8065115579119349
        sage: dist.expectation()
        17.5
        sage: dist.variance()
        5.250000000000001
        
    Uniform Distribution over the value N]::
    
        sage: N = 12
        sage: dist = DiscreteDistribution("Uniform", [N])
        sage: dist.prob_func(6)
        1/12
        sage: dist.distr_func(10)
        3/4
        sage: dist.expectation()
        6
        sage: dist.variance()
        143/12
        
    Poisson Distribution with parameter 'lambda'::
    
        sage: lambda = 22.5
        sage: dist = DiscreteDistribution("Poisson", [lambda])
        sage: dist.prob_func(12)
        0.005946034304171468
        sage: dist.distr_func(18)
        0.1444739992980893
        sage: dist.expectation()
        22.5
        sage: dist.variance()
        22.5
        
    Negative Binomial Distribution with parameters r and probability p::
        
        sage: r = 7
        sage: p = .75
        sage: dist = DiscreteDistribution("Negative Binomial", [r,p])
        sage: dist.prob_func(5)
        0.060224175453186035
        sage: dist.distr_func(10)
        0.998355534626171
        sage: dist.expectation()
        2.3333333333333335
        sage: dist.variance()
        3.111111111111111
        
    Geometric Distribution with probaility p::
    
        sage: p = .2
        sage: dist = DiscreteDistribution("Geometric", [p])
        sage: dist.prob_func(4)
        0.08192000000000002
        sage: dist.distr_func(1)
        0.2
        sage: dist.expectation()
        4.0
        sage: dist.variance()
        19.999999999999996
        
    Hypergeometric Distribution with three parameters M, K, and n::
        
       sage: M = 12
       sage: K = 3
       sage: n = 4
       sage: dist = DiscreteDistribution("Hypergeometric", [M,K,n])
       sage: dist.prob_func(2)
       3/55
       sage: dist.distr_func(1)
       28/165
       sage: dist.expectation()
       1
       sage: dist.variance()
       6/11
       
    Logarithmic Distribution with probility p::
        
        sage: p = .6
        sage: dist = DiscreteDistribution("Logarithmic", [p])
        sage: dist.prob_func(3)
        0.07857768009148498
        sage: dist.distr_func(7)
        0.9906550054733817
        sage: dist.expectation()
        1.637035001905937
        sage: dist.variance()
        1.412703907299671
        
    Borel Distribution with parameter 'mu'::
        
        sage: m = .15
        sage: dist = DiscreteDistribution("Borel", [mu])
        sage: dist.prob_func(6)
        0.008486389449880376
        sage: dist.distr_func(3)
        0.9718307095273155
        sage: dist.expectation()
        1.637035001905937
        sage: dist.variance()
        1.412703907299671
        
    """
    
    def __init__(self, dist = "", p = []):
        """
        Initializes the Discrete Distribution if the parameters are valid.
        
        INPUT:
        
            dist - A String representation of the type of distribution.
            parameters - An array of numbers that varies for each distribution.
        
        
        OUPUT: 
        
            N/A
        
        EXAMPLES::
        
            sage: dist1 = DiscreteDistribution("Binomial", [25,.7])
            sage: dist2 = DiscreteDistribution("Uniform",[12])
            sage: dist3 = DiscreteDistribution("Negative Binomial", [7,.75])
        
        """
        if dist == "Binomial" or "Uniform" or "Poisson" or "Negative Binomial" or "Geometric" or "Hypergeometric" or "Logarithimic" or "Borel":
            self.dist = dist
            for i in range(len(p)):
                if isinstance(p[i],Integer) == false: ##sets up all non integers as float numbers
                    p[i] = float(p[i])
                    
            if dist == "Binomial":
                if len(p) == 2:
                    if (p[0] >= 0 and isinstance(p[0],Integer) and 0 <= p[1] <= 1):
                        self.p = p
                    else:
                        raise ValueError("n must be an interger greater than or equal to zero and p must be inbetween 0 and 1.")
                else:
                    raise ValueError("Binomial distributions require two parameters, n and p.")
            
            elif dist == "Uniform":
                if len(p) == 1:
                    if (p[0] > 0 and isinstance(p[0],Integer)):
                        self.p = p
                    else:
                        raise ValueError("N must be an integer greater than zero.")
                else:
                    raise ValueError("Uniform distributions require only one parameter, N.")
                
            elif dist == "Poisson":
                if len(p) == 1:
                    if (p[0] > 0):
                        self.p = p
                    else:
                        raise ValueError("lambda must be greater than zero.")
                else:
                    raise ValueError("Poisson distributions require only one parameter, lambda")
                 
            elif dist == "Negative Binomial":
                if len(p) == 2:
                    if (p[0] > 0 and 0 <= p[1] <= 1):
                        self.p = p
                    else:
                        raise ValueError("r must be greater than zero and p must be between 0 and 1.")
                else:
                    raiseValueError("Negative Binomial distributions require two parameters, r and p.")
                        
            elif dist == "Geometric":
                if len(p) == 1:
                    if (0 <= p[0] <= 1):
                        self.p = p
                    else:
                        raise ValueError("p must be between 0 and 1.")
                else: 
                    raise ValueError("Geometric distributions require only one parameter, p.")
        
            elif dist == "Hypergeometric":
                if len(p) == 3:
                    if (p[0] >= 0 and isinstance(p[0],Integer) and 0 <= p[1] <= p[0] and isinstance(p[1],Integer) and 1 <= p[2] <= p[0] and isinstance(p[2],Integer)):
                        self.p = p
                    else: 
                        raise ValueError("M must be an integer greater than zero, K must be an integer between 0 and M, and n must be between 1 and M")
                else:
                    raise ValueError("Hypergeometric distributions require three parameters, M,K and n")
                    
            elif dist == "Logarithmic":
                if len(p) == 1:
                    if 0 <= p[0] <= 1:
                        self.p = p
                    else:
                        raise ValueError("p was be between 0 and 1")
                else:
                    raise ValueError("Logarithmic distributions require only one parameter, p")
            
            elif dist == "Borel":
                if len(p) == 1:
                    if 0 <= p[0] <= 1:
                        self.p = p
                    else:
                        raise ValueError("mu was be between 0 and 1")
                else:
                    raise ValueError("Borel distributions require only one parameters, mu")
                    
        else:
            raise TypeError("Not a valid Discrete Distribution")
            
    def __repr__(self):
        """
        Represents a Strnig version of the chosen distribution.
        
        INPUT:
            N/A
        
        OUTPUT:
            A string naming the type of distribution and the parameters associated with it.
        
        EXAMPLES::
        
            sage: dist1 = DiscreteDistribution("Logarithmic", [.6])
            sage: dist1
            Logarithmic distribution with parameters [0.6]
            sage: dist2 = DiscreteDistribution("Poisson", [12])
            sage: dist2
            Poisson distribution with parameters [12]
        
        """
        return "%s distribution with parameters %s"%(self.dist,self.p)
    
    def prob_func(self,x):
        """
        Calculates the probability of x number events occuring.
        
        INPUT:
           x - An integer number representing the number of events that occur.
            
        OUTPUT:
            A probability between 0 and 1 of the x events occuring.
            
        EXAMPLES::
            sage: Dist1 = DiscreteDistribution("Geometric", [.8])
            sage: Dist1.prob_func(4)
            0.001279999999999999
            sage: Dist2 = DiscreteDistribution("Hypergeometric", [12,4,3)
            sage: Dist2.prob_func(2)
            42/55
            
        """
        
        if self.dist == "Binomial":
            if isinstance(x,Integer) and 0 <= x <= self.p[0]:
                return (binomial(self.p[0],x))*(self.p[1]^x)*(1-self.p[1])^(self.p[0]-x)
            else:
                raise ValueError("x must be an integer between 0 and n.")
        
        elif self.dist == "Uniform":
            if isinstance(x,Integer) and 1 <= x <= self.p[0]:
                return 1/self.p[0]
            else:
                return ValueError("x must be an integer between 1 and N.")
                
        elif self.dist == "Poisson":
            if isinstance(x,Integer) and x >= 0:
                return exp(-self.p[0])*(self.p[0]^x)/(factorial(x))
            else:
                raise ValueError("x must be an integer greater than or equal to zero.")
                
        elif self.dist == "Negative Binomial":
            if isinstance(x,Integer) and x >= 0:
                return (binomial((self.p[0]+x-1),x)*self.p[1]^self.p[0]*(1-self.p[1])^x)
            else:
                raise ValueError("x must be an integer greater than or equal to zero.")
                
        elif self.dist == "Geometric":
            if isinstance(x,Integer) and x >= 0:
                return (1-self.p[0])^x*self.p[0]
            else:
                raise ValueError("x must be an integer greater than or equal to zero.")
            
        elif self.dist == "Hypergeometric":
            if (self.p[2]-(self.p[0]-self.p[1])) <= x <= min(self.p[2],self.p[1]) and isinstance(x,Integer):
                return (binomial(self.p[1],x)*binomial((self.p[0]-self.p[1]),(self.p[1]-x)))/(binomial(self.p[0],self.p[2]))
            else:
                raise ValueError("x must be an integer between (n-(M-K)) and the minimum of (n,k).")
                
        elif self.dist == "Logarithmic":
            if isinstance(x,Integer) and x > 0:
                return (-1/ln(1-self.p[0]))*((self.p[0]^x)/x)
            else:
                raise ValueError("x must be an integer greater than zero")
                
        elif self.dist == "Borel":
            if isinstance(x,Integer) and x >= 0:
                return (exp(-self.p[0]*x)*((self.p[0]*x)^(x-1)))/factorial(x)
            else:
                raise ValueError("x must be an integer greater than or equal to zero")
    
    def distr_func(self,k):
        """
        Calculates the probability of all the events occuring up to and including k.
        
        INPUT:
            k - an integer number
            
        OUTPUT:
            a probability between 0 and 1
            
        EXAMPLES::
        
            sage: dist1 = DiscreteDistribution("Binomial", [4,.8])
            sage: dist1.distr_func(3)
            0.18079999999999993
            sage: dist2 = DiscreteDistribution("Logarithmic", [.3])
            sage: dist2.distr_func(10)
            0.9999977210858139
            
        """
        
        if self.dist == "Binomial":
            if isinstance(k,Integer) and 0 <= k <= self.p[0]:
                return self.prob_sum(0,k)
            else:
                raise ValueError("k must be an integer between 0 and n")
        elif self.dist == "Uniform":
            if isinstance(k,Integer) and 1 <= k <= self.p[0]:
                return self.prob_sum(1,k)
            else:
                raise ValueError("k must be an integer between 1 and n")
                
        elif self.dist == "Logarithmic" or "Borel":
            if isinstance(k,Integer) and k >= 1:
                return self.prob_sum(1,k)
            else:
                raise ValueError("k must be an integer greater than one")
        
        elif self.dist == "Poisson" or "Negative Binomial" or "Geometric":
            if isinstance(k,Integer) and k >= 0:
                return self.prob_sum(0,k)
            else:
                raise ValueError("k must be an integer greater than zero")
                
        elif self.dist == "Hypergeometric":
            if isinstance(k,Integer) and k <= min(self.p[1],self.p[2]):
                return self.prob_sum(0,k)
            else: 
                raise ValueError("k must be an integer less than the minimum of n and K")
            
    def prob_sum(self, min1, max1):
        """
        A method used for the distr_func method. Sums up the probability between two values for a DiscreteDistribution.
        
        INPUT:
            min - an integer
            max - an integer larger than min
            
        OUPUT: 
            The total probability of all the events between min and max happening.
            
        """
        
        prob = 0
        count = min1
        while count < max1:
            prob += self.prob_func(count)
            count += 1
        return prob
            
    def expectation(self):
        """
        Calculates the expected value a distribution would give.
        
        INPUT:
            N/A
            
        OUTPUT:
            A real number that is that expectation.
            
        EXAMPLES::
            sage: dist1 = DiscreteDistribution("Binomial", [200,.5])
            sage: dist1.expectation()
            100.0
            sage: dist2 = DiscreteDistribution("Borel", [.2])
            sage: dist2.expectation()
            1.25
        """
        
        if (self.dist == "Binomial"):
            return self.p[0]*self.p[1]
        
        elif (self.dist == "Uniform"):
            return (self.p[0]/2)
        
        elif (self.dist == "Poisson"):
            return self.p[0]
        
        elif (self.dist == "Negative Binomial"):
            return (self.p[0]*(1-self.p[1]))/self.p[1]
        
        elif (self.dist == "Geometric"):
            return (1-self.p[0])/self.p[0]
        
        elif (self.dist == "Hypergeometric"):
            return self.p[2]*self.p[1]/self.p[0]
        
        elif self.dist == "Logarithmic":
            return (-1/ln(1-self.p[0]))*(self.p[0]/(1-self.p[0]))
        
        elif self.dist == "Borel":
            return 1/(1-self.p[0])
        

        
    def variance(self):
        """
        Calculates the variance of the given distribution.
        
        INPUT:
            N/A
            
        OUTPUT:
            A real numbered value.
            
        EXAMPLES::
        
            sage: dist1 = DiscreteDistribution("Geometric", [.4])
            sage: dist1.variance()
            3.749999999999999
            sage: dist2 = DiscreteDistribution("Uniform", [13])
            sage: dist2.variance()
            14
        """
        
        if self.dist == "Binomial":
            return self.p[0]*self.p[1]*(1-self.p[1])
        
        elif self.dist == "Uniform":
            return ((self.p[0]^2-1)/12) 
            
        elif self.dist == "Poisson":
            return self.p[0]
        
        elif self.dist == "Negative Binomial":
            return (self.p[0]*(1-self.p[1]))/(self.p[1])^2
        
        elif self.dist == "Geometric":
            return (1-self.p[0])/(self.p[0])^2
            
        elif self.dist == "Hypergeometric":
            return (self.p[2]*self.p[1]*(self.p[0]-self.p[1])*(self.p[0]-self.p[2]))/(self.p[0]^2*(self.p[0]-1))
        
        elif self.dist == "Logarithmic":
            return (-self.p[0])*(self.p[0]+ln(1-self.p[0]))/((1-self.p[0])^2*ln(1-self.p[0])^2)
            
        elif self.dist == "Borel":
            return self.p[0]/((1-self.p[0])^2)
            
    def stand_dev(self):
        """
        Calculates the standard deviation of the DiscreteDistribution.
        
        INPUT:
            
            N/A
            
        OUTPUT:
            
            The value calculated by the square root of the variance.
            
        EXAMPLES::
        
            sage: dist1 = DiscreteDistribution("Hypergeometric", [12,7,2])
            sage: dist1.stand_dev()
            5/6*sqrt(7/11)
            sage: dist2 = DiscreteDistribution("Poisson", [36])
            sage: dist2.stand_dev()
            6
            
        """
        return self.variance()^(1/2)

    def coeff_of_variation(self):
        """
        Calculates the coefficient of variation of the given DiscreteDistribution.
        
        INPUT:
        
            N/A
            
        OUTPUT:
        
            The value calculated by the standard deviation divided by the expectation.
            
        EXAMPLES::
        
            sage: dist1 = DiscreteDistribution("Uniform", [45])
            sage: dist1.coeff_of_variation()
            2/45*sqrt(506/3)
            sage: dist2 = DiscreteDistribution("Binomial", [3,.7])
            sage: dist2.coeff_of_variation()
            0.3779644730092273
            
        """
        return self.stand_dev()/self.expectation()
    
    def mgf(self,t):
        
        """
        Calculates the value of the moment generating function at number t.
        
        INPUT:
        
            t - an number to evaluate the mgf at.
        
        OUTPUT:
        
            the value of the mgf evaluate at t.
            
        EXAMPLES::
        
            sage: dist1 = DiscreteDistribution("Poisson", [6.2])
            sage: dist1.mgf(3)
            e^(6.2*e^3 - 6.2)
            sage: dist2 = DIscreteDistribution("Binomial", [20,.3])
            sage: dist2.mgf(4)
            (0.3*e^4 + 0.7)^20
            
        """
        if self.dist == "Binomial":
            return (1-self.p[1]+self.p[1]*exp(t))^self.p[0]
        
        elif self.dist == "Uniform":
            return (exp(t)*(exp(self.p[0]*t)-1)/(self.p[0]*exp(t)-1))
        
        elif self.dist == "Poisson":
            return exp(self.p[0]*(exp(t)-1))
        
        elif self.dist == "Negative Binomial":
            return (self.p[1]/(1-(1-self.p[1])*exp(t)))^self.p[0]
        
        elif self.dist == "Geometric":
            return self.p[0]/(1-(1-self.p[0])*exp(t))
        
        elif self.dist == "Hypergeometric":
            raise TypeError("Hypergeometric Distributions do not have Moment Generating Functions")
            
        elif self.dist == "Logarithmic":
            return ln(1-self.p[0]*exp(t))/ln(1-self.p[0])
        
        elif self.dist == "Borel":
            raise TypeError("Borel Distributions do not have Moment Generating Functions")
            
    def n_moment(self, n):
        """
        Calculates the n-th moment of a DiscreteDistribution.
        
        INPUT:
        
            An integer n representing which moment is desired.
            
        OUTPUT:
        
            A real number value.
            
        EXAMPLES::
            
            sage: dist1 = DiscreteDistribution("Binomial", [22,.1])
            sage: dist.n_moment(2)
            6.82
            sage: dist2 = DiscreteDistribution("Geometric", [.5])
            sage: dist2.n_moment(3)
            13.0
            
        """
        t = var('t')
        mgf = self.mgf(t)
        deriv = diff(mgf,t,n)
        return deriv(t=0)
 
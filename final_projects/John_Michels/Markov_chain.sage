class Markov_chain:
    def __init__(self, T, state_names=None):
        """
        Accepts a matrix or a list that can be made into a matrix using matrix() and creates a markov chain. Also accepts an optional list to assign names to the states in the state space specified by the markov chain
        
        INPUT:
        
            * "T" - T must be an nxn matrix whose rows sum to 1, or a list that creates such a matrix. Raises TypeError if either is not true
        
            * "state_names" - a list of strings for naming states, must be of length n (the number of rows/columns of T)
        
        EXAMPLES:
        
            sage:a = matrix([[.3,.7,0],[1,0,0],[0,.5,.5]]); c = Markov_chain(a,["bobby","joe", "tammy"])
            
            sage:c = Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe","tammy"]) 
            
            sage:c = Markov_chain([[1/3,1/3,1/6,1/6],[1/2,1/2,0,0],[0,0,1/2,1/2],[0,1,0,0]])
        """
        if isinstance(T, sage.matrix.matrix_generic_dense.Matrix_generic_dense):
            self.T = T
            self.n = self.T.dimensions()[0]
        else:
            try:
                self.T = matrix(RR,T)
                self.n = self.T.dimensions()[0]
            except ValueError:
                raise ValueError("Invalid matrix constructor. Type matrix? for help")
        if not self.T.is_square():
            raise TypeError("Not a Markov chain: Not a square matrix")
        if state_names is None:
            self.has_name = False
        elif state_names is not None and len(state_names) == self.n:
            self.has_name = True
        else: 
            raise TypeError("Invalid input: State names, you might not have enough")
        self.state_names = state_names
    def __repr__(self):
        """
        returns a list of states (if given) and the transitional matrix as a string
        
        EXAMPLES:
            
            sage: Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"])
            [0.300000000000000 0.700000000000000 0.000000000000000]
            [ 1.00000000000000 0.000000000000000 0.000000000000000]
            [0.000000000000000 0.500000000000000 0.500000000000000]
        """
        return str(self.T)
    def states(self, state_names = None):
        """
        returns the list of strings used as names for states by the markov chain, returns None if the chain has none. Can also be used to add state names to a chain that was created without them, or to reset the names if it does. 
        
        INPUT:
        
            * "state_names" - (optional) a list of strings, each corresponding to a state, Value error if the number of states and the number of names dont match
        
        EXAMPLES:
            
            sage:Markov_chain([[.5,.4,.1,0],[0,0,.1,.9],[.3,.2,0,.5],[.5,0,0,.5]],["a", "b", "c", "d"]).states()
            ['a', 'b', 'c', 'd']
            
            sage:Markov_chain([[1/3,1/3,1/6,1/6],[1/2,1/2,0,0],[0,0,1/2,1/2],[0,0,0,1]]).states()
            
        """
        if state_names is not None:
            if len(state_names) != self.n:
                raise 
            self.has_name = true
            self.state_names = state_names
        else:
            return self.state_names
        
    def steady_states(self,k = None):
        """
        returns a tuple of the steady state distributions of this markov chain, which correspond to the eventual probabilities of being in each state. Option for retrieving the steady state probability of a single state
        
        INPUT:
            
            * "k" - (optional) the index of the desired state, or the name of the state if the chain has names
        
        EXAMPLES:
            
            sage: Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).steady_states()
            (0.588235294117647, 0.411764705882353, 0.000000000000000)
            
            sage: Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).steady_states(1)
            0.411764705882353
            
            sage: Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).steady_states("joe")
            0.411764705882353
            
        """
        b = self.T.transpose()-1
        b[self.n-1] = [1 for i in range(self.n)]
        ss = b.solve_right(vector([1 if i == self.n-1 else 0 for i in range(self.n)]))
        if k is not None:            
            if self.has_name and k in self.state_names:
                return ss[self.state_names.index(k)]
            elif isinstance(k,sage.rings.integer.Integer):
                return ss[k]
            else:
                raise TypeError("Invalid input: must in the state space, or an integer less than its dimension")
        return ss
    def n_step(self, n, initial = None, frm = None, to = None):
        """
        returns the 'n'-step probability matrix of this Markov chain. The n-step matrix gives the probability of moving from state 'i' to state 'j' in 'n' transitions. Options to supply an initial distribution, or to recieve a specific entry in the matrix
        
        INPUT:
            
            * "initial" - (optional) a vector, list or tuple representing an initial distribution of states (must some to 1)
            
            * "from" - (optional) index of desired starting state, or its name (if it has one)
            
            * "to" - (optional) index of desired ending state, or its name (if applicable)
        
        EXAMPLES:
            
            sage:Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).n_step(5,(.2,.3,.5))
            (0.570436000000000, 0.413939000000000, 0.0156250000000000)
            
            sage:Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).n_step(5)
            [ 0.519030000000000  0.480970000000000  0.000000000000000]
            [ 0.687100000000000  0.312900000000000  0.000000000000000]
            [ 0.521000000000000  0.447750000000000 0.0312500000000000]
            
            sage:Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).n_step(5,frm="tammy",to="joe")
            0.447750000000000
            
            sage:Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).n_step(5,frm=2,to=1)
            0.447750000000000
        """
        if initial is None and frm is None and to is None:
            return self.T^n
        elif initial is not None:
            if to is not None:
                if self.has_name:
                    if to in self.state_names:
                        return (vector(initial)*self.T^n) [self.state_names.index(to)]
                    return (vector(initial)*self.T^n) [to]
            return vector(initial)*self.T^n
        elif frm is not None and to is not None:
            if self.has_name:
                if frm in self.state_names and to in self.state_names:
                    return (self.T^n) [self.state_names.index(frm), self.state_names.index(to)]
            return (self.T^n) [frm, to]
        else: 
            raise TypeError("Invalid input")
    def absorbing_states(self):
        """
        returns a list of states that return to themselves with probability = 1. Uses the indexes of the states, or their names, if possible 
        
        EXAMPLES:
            
            sage:Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).absorbing_states()
            []
            
            sage:Markov_chain([[1/3,1/3,1/6,1/6],[1/2,1/2,0,0],[0,0,1/2,1/2],[0,0,0,1]]).absorbing_states()
            [3]
        """
        astates = []
        for i in range(self.n):
            if self.T[i,i] == 1:
                if self.has_name:
                    astates.append(self.state_names[i])
                else:
                    astates.append(i)
        return astates
    def transient_states(self, by_name=True):
        """
        returns a list of states whose probabilities tend to 0 as we move successively through the markov chain. Will present states by their names if posssible, indexes otherwise
        
        INPUT:
            
            * "by_name" - (optional) boolean, default true, giving the list of states by their names instead of their indexes, only applicable if chain has names
        
        EXAMPLES:
            
            sage:Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).transient_states()
            ['tammy']
            
            sage:Markov_chain([[1/3,1/3,1/6,1/6],[1/2,1/2,0,0],[0,0,1/2,1/2],[0,0,0,1]]).transient_states()
            [0, 1, 2]
        """
        tstates = []
        for i in range(self.n):
            if self.steady_states()[i] == 0:
                if self.has_name and by_name:
                    tstates.append(self.state_names[i])
                else:
                    tstates.append(i)
        return tstates
    def recurrent_states(self):
        """
        returns a list of states whose probabilities do not tend to 0 as we move successively through the markov chain. Will present states by their names if posssible, indexes otherwise
        
        EXAMPLES:
            
            sage:Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).recurrent_states()
            ['bobby','joe']
            
            sage:Markov_chain([[1/3,1/3,1/6,1/6],[1/2,1/2,0,0],[0,0,1/2,1/2],[0,0,0,1]]).recurrent_states()
            [3]
        """
        if self.has_name:
            return [i for i in self.state_names if i not in self.transient_states()]
        else:
            return [i for i in range(self.n) if i not in self.transient_states()]
    def mean_first_passage(self, initial = None, final = None):
        """
        returns a matrix of mean first passage times, whose 'ij' entry corresponds to the average number of steps if takes to move from state 'i' to state 'j'. Options to receive only a single entry. WARNING: will be very slow for large matrices. By convention a mean first passage time of 0 means it is not always possible to reach state 'j' from state 'i'
        
        INPUT:
            
            * "initial" - (optional) index of desired initial state, or name if the chain has names
            
            * "final" - (optional) index of desired final state, or name if the chain has names, ValueError if given a 'final', but not and 'initial' or vice versa
        
        EXAMPLES:
            
            sage:Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).mean_first_passage()
            [ 1.70000000000000  1.42857142857143 0.000000000000000]
            [ 1.00000000000000  2.42857142857143 0.000000000000000]
            [ 3.00000000000000  2.00000000000000 0.000000000000000]
            
            sage:Markov_chain([[1/3,1/3,1/6,1/6],[1/2,1/2,0,0],[0,0,1/2,1/2],[0,0,0,1]]).mean_first_passage()
            [0.000000000000000 0.000000000000000 0.000000000000000  6.00000000000000]
            [0.000000000000000 0.000000000000000 0.000000000000000  8.00000000000000]
            [0.000000000000000 0.000000000000000 0.000000000000000  2.00000000000000]
            [0.000000000000000 0.000000000000000 0.000000000000000  1.00000000000000]
            
            sage:Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).mean_first_passage("bobby", "joe")
            1.42857142857143
            
            sage:Markov_chain([[1/3,1/3,1/6,1/6],[1/2,1/2,0,0],[0,0,1/2,1/2],[0,0,0,1]]).mean_first_passage(1,3)
            8.00000000000000
        """
        if initial is None != final is None:
            raise ValueError("Function requires either 0 or 2 inputs")
        if self.has_name:
            if initial in self.state_names:
                initial = self.state_names.index(initial)
            if final in self.state_names:
                final = self.state_names.index(final)
        A = []
        d = self.transient_states(False)
        for i in range(self.n):
            for j in range(self.n):
                o = [0]*self.n^2
                if i != j and j not in d:
                    for k in range(self.n):
                        if k != j:
                            o[k*self.n+j] = self.T[i,k]
                    o[i*self.n+j]-=1    
                else:
                    o[i*self.n+j] = 1
                A.append(o)
        b = []
        c = self.steady_states()
        for i in range(self.n):
            for j in range(self.n):
                if j in d:
                    b.append(0)
                elif i == j:
                    b.append(1/c[i])
                else:
                    b.append(-1)   
        mfp = matrix(self.n,list(matrix(A).solve_right(vector(b))))
        if initial is not None:
            return mfp[initial, final]
        return mfp
    def is_ergodic(self):
        """
        returns true if every state in the Markov chain is reachable by every other state (i.e. there are no transient states)
        
        EXAMPLES:
            
            sage:Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).is_ergodic()
            False
            
            sage:Markov_chain([[1/3,1/3,1/6,1/6],[1/2,1/2,0,0],[0,0,1/2,1/2],[0,1,0,0]]).is_ergodic()
            True
        """
        return len(self.transient_states()) == 0
    def first_passage(self, initial, final):
        """
        simulates the number of steps required to reach 'final' starting from 'initial'
        
        INPUT:
            
            * "initial" - index of desired initial state, or name if the chain has names
            
            * "final" - index of desired final state, or name if the chain has names 
        
        EXAMPLES:
            
            sage:Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).first_passage("bobby", "joe")
            1
            
            sage:Markov_chain([[1/3,1/3,1/6,1/6],[1/2,1/2,0,0],[0,0,1/2,1/2],[0,1,0,0]]).first_passage(0,3)
            6
        """
        if self.has_name:
            if initial in self.state_names:
                initial = self.state_names.index(initial)
            if final in self.state_names:
                final = self.state_names.index(final)
        if final in self.transient_states():
            raise ValueError("final state will not always be reachable")
        s = [initial]
        def sampler(initial):
            x = random()
            for i in range(self.n):
                if sum(self.T[initial][0:i]) <= x <= sum(self.T[initial][0:(i+1)]):
                    return i
        while s[len(s)-1] != final or len(s) == 1:
            s.append(sampler(s[len(s)-1]))
        return len(s)-1
    def sample(self, n, initial = None):
        """
        returns a sample of 'n' movements within the state space as a list. Option for starting from an initial state, otherwise starting state is uniformly sampled from the available state space. Will present list of states by their names, if possible, by indexes otherwise
        
        INPUT:
            
            * "initial" - (optional) specifies a starting state, randomly (uniformly) determined otherwise
        
        EXAMPLES:
            
            sage:Markov_chain([[.3,.7,0],[1,0,0],[0,.5,.5]],["bobby","joe", "tammy"]).sample(10,'tammy')
            ['tammy', 'joe', 'bobby', 'joe', 'bobby', 'joe', 'bobby', 'joe', 'bobby', 'bobby']
            
            sage:Markov_chain([[1/3,1/3,1/6,1/6],[1/2,1/2,0,0],[0,0,1/2,1/2],[0,1,0,0]]).sample(10)
            [3, 1, 1, 0, 0, 1, 0, 1, 1, 1]
            
            sage:Markov_chain([[1/3,1/3,1/6,1/6],[1/2,1/2,0,0],[0,0,1/2,1/2],[0,0,0,1]]).sample(10,3)
            [3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
        """
        def sampler(initial):
            x = random()
            for i in range(self.n):
                if sum(self.T[initial][0:i]) <= x <= sum(self.T[initial][0:(i+1)]):
                    return i
        if initial is None:
            initial = sample(range(self.n),1)[0]
        elif self.has_name and initial in self.state_names:
            initial = self.state_names.index(initial)
        s = []
        while n > 0:
            initial = sampler(initial)
            if self.has_name:
                s.append(self.state_names[initial])
            else:
                s.append(initial)
            n -= 1
        return s
︠17d0a799-754e-4827-8eee-348fc740fc8a︠
%python
from sage.symbolic.integration.integral import definite_integral
from sage.calculus.calculus import *

#inputs are equation, and main variable, type of the test
def seriestest(equation, test):
    a_n = equation
    tot = test.lower() #tot stands for type of test
    #input must be string and in format of  a*r**n where a and r  are positive or negative number
    if tot == 'gst':
        a = a_n(0)
        r = a_n(1)/a
        if abs(r) < 1:
            limit_gst = a/(1-r)
            print(str(equation) + ' converges to ' + str(limit_gst))
            return True
        else:
            print(str(equation) + ' diverges becuause r >= 1' )
            return False
    
    #equation must be in format of a\(n**p) where p is positive number that is greater 0, a is any constant value
    elif tot == 'pst':
        a = a_n(1)
        p = -log((a/(a/a_n(10))),10)
        if p < 0:
            raise ValueError, "p is not positive value"
        if p > 1:
            print(str(equation) + ' converges because p > 1')
            return True
        else:
            print(str(equation) + ' diverges because p <= 1')
            return False
    
    elif tot == 'dt':
        if limit(a_n, x=+Infinity) == 0:
            print(str(a_n) + ' Divergence Test fails because lt\'s limit equals to 0 while n approaches ifinity')
            return True
        else:
            print(str(a_n) + ' diverges because it\'s limit does not equal to 0 while n approaches infinity')
            return False
    
    #provided equation must be positive continuous
    elif tot == 'it':
        integralvalue = definite_integral(a_n,n,1,+Infinity)
        if integralvalue < 0:
            raise ValueError, "function must be positive continuous"
        if abs(integralvalue) != +Infinity:
            print('Integral is finite, thus ' + str(equation) + ' converges')
            return True
        else:
            print('Integral is not finite, thus ' + str(equation) + ' diverges')
            return False
        
    #limit of both a_n+1 and a_n must exists    
    elif tot == 'rt':
        a_n1 = a_n(x+1)
        lim1 = limit(a_n1, x=+Infinity)
        lim0 = limit(a_n, x=+Infinity)
        if abs(lim1) == +Infinity:
            raise ValueError, "a_n+1 has no limit"
        if abs(lim0) == +Infinity:
            raise ValueError, "a_n has no limit"
        if abs(lim0) == 0:
            raise ValueError, "division is zero"
        lim = abs(lim1/lim0)
        if lim < 1:
            print('limit of a_n+1/a_n approaches value L that is less than 1: ' + str(lim) +' thus ' + equation + ' absolutely converges hence converges')
            return True
        elif lim == 1:
            print('limit of a_n+1/a_n approaches value L that is equal to 1 thus Ration Test fails, nothing can be said')
            return False
        else:    
            print('limit of a_n+1/a_n approaches value L that is greater than 1: ' + str(lim) + ' thus ' + equation + ' diverges')
            return False
    
    elif tot == 'root':
        a_new = abs((a_n)**(1/x))
        lim_new = limit(a_new, x=+Infinity)
        if lim_new < 1:
            print('limit of ' + a_new + ' approaches ' + str(lim_new) + ' which is less than 1 thus it converges absolutely hence converges')
            return True
        elif lim_new == 1:
            print('limit of ' + str(a_new) + ' approaches 1 thus nothing can be said according to root test')
            return False
        else:
            print('limit of ' + str(a_new) + ' approaches ' + str(lim_new) + ' which is greater 1 thus it diverges')
        
# limit of both equatino must exists        
def seriescomp(equation1, equation2, testtype):
    a_x = equation1
    b_x = equation2
    tot_comp = testtype.lower()
    if tot_comp == 'lct':
        lim_eq1 = limit(a_x, x=+Infinity)
        lim_eq2 = limit(b_x, x=+Infinity)
        if lim_eq2 == 0:
            raise ValueError, "Division is zero"
        lct_val = lim_eq1/lim_eq2
        if lct_val > 0:
            print( str(equation1) + ' and ' + str(equation2) + ' are either both converge or diverge because LCT values is equal to ' + str(lct_val))
        else:
            print( 'can not be said anthing about convergence or divergence between two equations: ' + str(equation1) + ', ' + str(equation2))
        
    if tot_comp == 'ct':
        len1 = len(solve(a_x==0,abs(x)))
        len2 = len(solve(b_x==0,abs(x)))
        if (len1>0) or (len2>0):
            raise ValueError, 'one of provided equation has output less than 0'
        if (len(solve(a_x <= b_x,x)) > 0):
            if seriestest(b_x, 'dt'):
                print( str(b_x) + ' converges and ' + str(a_x) + '<=' + str(b_x) + ' for all inputs thus both equation converges')
                return True
            else:
                print( str(b_x) + ' does not converge hence nothing can be said about ' + str(a_x) + ' because ' + str(a_x) + '<=' + str(b_x) + ' for all inputs')
                return False
        elif (len(solve(a_x >= b_x,x)) > 0):
            if seriestest(b_x, 'dt'):
                print( str(b_x) + ' diverges and ' + str(a_x) + '>=' + str(b_x) + ' for all inputs thus both equation diverges')
                return True
            else:
                print( str(b_x) + ' does converges but ' + str(a_x) +  '>=' + str(b_x) + ' for all inputs thus nothing can be said')
                return False
︡a5420cf2-1786-41dd-b89a-1c5f25922dcf︡
︠943dae4f-ef60-4d8b-8a6e-b0af8e9bb811︠
seriestest(1/(x**(3)), 'pst')
︡17c60d37-2509-47c8-957d-76e188d1ce2c︡{"stdout":"x^(-3) converges because p > 1\nTrue\n"}︡
︠9313c72f-448c-4026-910a-163f7fc2fca9︠
seriestest((7/4)**(x),'gst')
︡42ccd4fe-16dd-4cbf-988b-1e0f25a7b29a︡{"stdout":"(7/4)^x diverges becuause r >= 1\nFalse\n"}︡
︠eb353014-d800-4f3e-9050-19693c965a90︠
seriestest((1/2)**(x), 'gst')
︡2175d30a-7e70-4ba7-bbe9-fe5431e41f53︡{"stdout":"(1/2)^x converges to 2\nTrue\n"}︡
︠f9e983e6-f560-449d-8956-4e4379e1e01a︠
(1/x**(2))*cos(9/(x*pi+(n**(2)*pi**(2)-9)**(1/2)))
︠3644bf53-93da-4644-ab0d-3d2827933637︠
seriestest((1/(x**(2))*cos(9/(x*pi+(x**(2)*pi**(2)-9)**(1/2)))), 'root')
︡cd149746-2c9a-48be-9535-575a1786c999︡{"stdout":"limit of abs((cos(9/(pi*x + sqrt(pi^2*x^2 - 9)))/x^2)^(1/x)) approaches und which is greater 1 thus it diverges"}︡{"stdout":"\n"}︡
︠16c57924-dbe4-4c2a-b7a6-554a68f0889a︠










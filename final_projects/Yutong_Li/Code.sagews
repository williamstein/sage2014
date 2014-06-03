︠52e11de0-57da-4b65-9115-e1aa543ec377︠

︠b0cfd467-5a81-496b-86b7-050f3a989323︠
from sympy.solvers import solve
from sympy import Symbol

def fixed_points(a_function):
    """
    Finds the fixed points of any given function, computes their respective eigenvalue
    and reports the corresponding stability according to the eigenvalue. 

    INPUT:

        A properly formatted Sage function.

    OUTPUT:

        A string that contains the value of the fixed points, their respective
        eigenvalue and stability.

    Examples:

        sage: fixed_points(x**2 - 1)
        1/2 + sqrt(5)/2, eigenvalue = abs(sqrt(5) + 1), repelling
        -sqrt(5)/2 + 1/2, eigenvalue = abs(-sqrt(5) + 1), repelling

        sage: fixed_points(x - x**2)
        0, eigenvalue = 1, neutral

        sage: fixed_points(0.05*x**2+0.25*x+1)
        1.47920271060385, eigenvalue = 0.397920271060385, attracting
        13.5207972893961, eigenvalue = 1.60207972893961, repelling

    """
    points = solve(a_function - x, x)
    f_prime = derivative(a_function, x)
    for i in points:
        eigenvalue = abs(f_prime(i))
        if eigenvalue > 1:
            print "%s, eigenvalue = %s, repelling"%(i, eigenvalue) 
        elif eigenvalue == 1:
            print "%s, eigenvalue = %s, neutral"%(i, eigenvalue)
        else:
            print "%s, eigenvalue = %s, attracting"%(i, eigenvalue)





︡8d639136-b718-41f6-b7d4-7e5bb5745abf︡
︠cd08dcf1-412c-487a-a84b-751f22efa36c︠

︡516081a4-9144-4bc9-ab2c-b5be4f084618︡
︠b923984b-02c7-453a-9fcd-d0717844ef3a︠
fixed_points(x**2 - 2*x + 2)
︡64d8681b-95c2-4c7d-91ba-2f94b00021ca︡{"stdout":"1, eigenvalue = 0, attracting\n2, eigenvalue = 2, repelling\n"}︡
︠68586ae6-c674-47de-a641-0170a2845be8︠
fixed_points(x-x**2)
︡e7a30356-8d89-43f9-8cf5-af3acae83110︡{"stdout":"0, eigenvalue = 1, neutral\n"}︡
︠345ebf41-80de-4dad-a7a2-0e5d6bdc0f95︠

︡5226421b-bf5a-4a29-880e-2a5c915922aa︡
︠034dfa5f-6393-4809-b78c-6dc717bc51eb︠
def graphical_analysis(a_function, start, iterations, xmin = 0, xmax = 1, mask = 0):
    """
    Returns a graphics object of a plot of the function and a cobweb trajectory starting from the value start.

    INPUT:
        a_function: a function of one variable
        start: the starting value of the iteration
        mask: (optional) the number of initial iterates to ignore
        iterations: (optional) the number of iterations to draw, following the masked iterations
        xmin: (optional) the lower end of the plotted interval
        xmax: (optional) the upper end of the plotted interval
        
    OUTPUT:
        A interactive plot of the input function and cobweb orbit initializing from the default starting
        value.
    
    EXAMPLES:
        sage: f = lambda x: x**2 - x + 1
        sage: show(cobweb(f,.5,iterations=200), xmin = 0, xmax = 1, ymin=0)
    """
    
    iter_list = []
    iter_list.append([start, 0])
    current = start
    for i in range(mask):
        current = a_function(current)
    for i in range(iterations): #calculate the fixed points and append them to a list
        maxmax, minmin = current, current
        if(maxmax > xmax):
            xmax = maxmax
        if(minmin < xmin):
            xmin = minmin
        iter_list.append([current,a_function(current)])
        current = a_function(current)
        iter_list.append([current,current])
    endp = iter_list.pop()
    if(xmax < endp[0]):
        xmax = endp[0]
    if(xmin > endp[0]):
        xmin = endp[0]
    basic_plot = plot(a_function,(x, xmin, xmax),color='green', legend_label = "F(x)") 
    id_plot = plot(x,(x, xmin, xmax),color='red', legend_label = "y = x")
    end_plot = point(endp, rgbcolor = 'black', pointsize=20, legend_label = endp[0])
    iter_list.append(endp)
    cobweb = line(iter_list, color = 'blue')
    return basic_plot + id_plot + cobweb + end_plot
    
@interact
def interactive_plot(f_text = input_box(default = "x**2 - 1",label = "function", type=str), start_val = slider(-2, 2,.05,.5, label = 'start value'), its = slider([i for i in range(0,20)],default = 8, label="iterations")):
    def f(x):
        return eval(f_text)
    show(graphical_analysis(f, start_val, iterations = its))
︡e4169dec-49c1-4275-9bf7-e98c4b6691f3︡{"interact":{"style":"None","flicker":false,"layout":[[["f_text",12,null]],[["start_val",12,null]],[["its",12,null]],[["",12,null]]],"id":"1926ea9b-5701-49e3-adc7-eace5e0b2f5b","controls":[{"control_type":"input-box","default":"x**2 - 1","label":"function","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"f_text","type":"<type 'str'>"},{"control_type":"slider","default":50,"var":"start_val","width":null,"vals":["-2.00000000000000","-1.95000000000000","-1.90000000000000","-1.85000000000000","-1.80000000000000","-1.75000000000000","-1.70000000000000","-1.65000000000000","-1.60000000000000","-1.55000000000000","-1.50000000000000","-1.45000000000000","-1.40000000000000","-1.35000000000000","-1.30000000000000","-1.25000000000000","-1.20000000000000","-1.15000000000000","-1.10000000000000","-1.05000000000000","-0.999999999999999","-0.949999999999999","-0.899999999999999","-0.849999999999999","-0.799999999999999","-0.749999999999999","-0.699999999999999","-0.649999999999999","-0.599999999999999","-0.549999999999999","-0.499999999999999","-0.449999999999999","-0.399999999999999","-0.349999999999999","-0.299999999999999","-0.249999999999999","-0.199999999999999","-0.149999999999999","-0.0999999999999988","-0.0499999999999988","1.20736753927986e-15","0.0500000000000012","0.100000000000001","0.150000000000001","0.200000000000001","0.250000000000001","0.300000000000001","0.350000000000001","0.400000000000001","0.450000000000001","0.500000000000001","0.550000000000001","0.600000000000001","0.650000000000001","0.700000000000001","0.750000000000001","0.800000000000001","0.850000000000002","0.900000000000002","0.950000000000002","1.00000000000000","1.05000000000000","1.10000000000000","1.15000000000000","1.20000000000000","1.25000000000000","1.30000000000000","1.35000000000000","1.40000000000000","1.45000000000000","1.50000000000000","1.55000000000000","1.60000000000000","1.65000000000000","1.70000000000000","1.75000000000000","1.80000000000000","1.85000000000000","1.90000000000000","1.95000000000000","2.00000000000000"],"animate":true,"label":"start value","display_value":true},{"control_type":"slider","default":8,"var":"its","width":null,"vals":["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"],"animate":true,"label":"iterations","display_value":true}]}}︡
︠476a2759-4cc7-4ead-b6c1-57583cc4034a︠

︡f7f17a5e-dd4e-4563-8137-5392f3f6f7d5︡
︠82b27e55-ad09-4440-ae5c-c9d51a706921︠










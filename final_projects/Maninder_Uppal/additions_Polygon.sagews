︠4d4bb524-ae11-49f8-83b6-ef2b7c93860c︠

︠a4fc5fb8-fbd0-4e75-8f69-961ab6d31dbb︠
#All of these methods are an addition to the polygon class. You can use the graphics from the polygon class and use these methods to alter the polygons in the different transformations such as rotation, translation, reflection, scale, and shear. 
︠30d9686c-ff55-428e-8d81-4a13e7fec12b︠

︠4a5a3f79-267e-4a01-995f-c18b762f0d64︠

from math import sin, cos, radians
def rotate(P, angle):
    angle = radians(angle)
    """
    This allows you to rotate the 2d polygon to whichever theta desired.
    Example:
    sage: p = polygon([(1,5),(2,2),(6,7)])
    sage: P = p[0]
    sage: rotate(p, 90)
    
    The output is graph of polygon p rotated 90 degrees clockwise.
    Equation for rotation: (x, y) --> (xcos(theta) - ysin(theta), sin(theta)x + ycos(theta))
                           
    """    
    new_points = [ ((P.xdata[i]*cos(angle) + P.ydata[i]*sin(angle)), ((P.ydata[i]*cos(angle)) - (P.xdata[i]*sin(angle)))) for i in range(len(P.xdata)) ]

    return polygon(new_points)
︡aed54db5-8178-4646-8ed9-db11866e3f76︡
︠614ccde2-4a7f-4e95-88ac-01666e011c8e︠
    
def translation(P, a, b):
    """
    This allows you to move the 2d polygon to whichever units, up or down, depending on what your a and b are.
    Example:
    sage: p = polygon([(1,5),(2,2),(6,7)])
    sage: P = p[0]
    sage: Translation(p, 5, -4)
    
    The output is a graph of polygon p moved 5 units to the right and 4 units down. The new points for the graph become (1+5,5+-4),(2+5,2+-4), (6+5,7+-4)...i.e (6,1), (7,-2), (11,3). 
    Equation for translation: (x, y) --> (x + a, y + b)
    """
    new_points = [ (P.xdata[i]+a, P.ydata[i]+b) for i in range(len(P.xdata)) ]
    new_points = polygon(new_points)
   
    
    return new_points
︡ff672f23-9b68-482a-a7e7-1a5a4384fa72︡
︠097aa249-4a51-4dac-8f17-4986f9c13699︠
    
from math import sin, cos, radians
def reflection(P, angle):
    angle = radians(angle)
        """
    This allows you to reflect the 2d polygon on any arbitrary point with the choice of angle.
    Example:
    sage: p = polygon([(1,5),(2,2),(6,7)])
    sage: P = p[0]
    sage: reflection(p, 90)
    
    The output is graph of polygon p reflected 90 degrees clockwise. 
    Equation for reflection: (x, y) --> (x*cos(2*angle) + y*sin(2*angle), x*sin(2*angle) - y*cos(2*angle))
    """
    new_points = [ ((P.xdata[i]*cos(2*angle) + P.ydata[i]*sin(2*angle)), (P.xdata[i]*sin(2*angle) - P.ydata[i]*cos(2*angle))) for i in range(len(P.xdata)) ]  
    
        
    return polygon(new_points)
︡7625e34c-6166-4bf8-8002-3281a643d8a9︡
︠67adbbe0-7776-4d9f-9c5b-82b5de579a9f︠

def scale(P, a, b):  
    """
    This allows you to make the the 2d polygon bigger or smaller in scale/size.
    Example:
    sage: p = polygon([(1,5),(2,2),(6,7)])
    sage: P = p[0]
    sage: scale(p, 2, 3)
    
    The output is a graph of polygon p bigger in scale by 2 units on the x-axis and 3 units on the y-axis. The new points for the graph become (1*2,5*3),(2*2,2*3), (6*2,7*3)...i.e (2,15), (4,6), (12,21). 
    Equation for scale: (x, y) --> (x*a, y*b)
    """       
    new_points = [ (P.xdata[i]*a, P.ydata[i]*b) for i in range(len(P.xdata)) ]
   
    return polygon(new_points)
︡9a8024c7-a2df-4a32-9352-66a219fa990b︡
︠68efc147-8b22-4e18-9bc1-d97cd052a1d5︠

def shear(P, a, b):
    """
    This allows you to distort the 2d polygon graph to whatever x and y units depending on what you choose a and b to be.
    Example:
    sage: p = polygon([(1,5),(2,2),(6,7)])
    sage: P = p[0]
    sage: shear(p, 2, 3)
    
    The output is a graph of polygon translated along an x and y-axis but is a distorted. The new points for the graph become (1+5*2,5+1*3),(2+2*2,2+2*3), (6+7*2,7+6*3)...i.e (11,8), (6,8), (20,25). 
    Equation for shear: (x, y) --> (x + y*a, y + x*b)
    """
    new_points = [ (P.xdata[i]+P.ydata[i]*a, P.ydata[i]+P.xdata[i]*b) for i in range(len(P.xdata)) ]

    return polygon(new_points)
︡fa9d0732-dbb9-4266-9ada-252e0c0597ec︡
︠738693ca-7f1f-466f-a795-44deab61ab4d︠










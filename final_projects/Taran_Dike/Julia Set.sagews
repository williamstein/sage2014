︠ea0204e1-0932-4663-804f-1a4d9b14a472︠
def julia_set_pgm(a, b):
    """
    This function plots the Julia Set of an initial complex number.  This complex number comes from the input a and b real values, where a becomes the real part of     the complex number and b the imaginary part.  It uses the quadratic function z = z^2 + c where c is the complex number that a and b forms for its iterations.       It creates a .pgm file in the same directory which can then be converted into another format for viewing. 
    
    To convert it, type "convert JuliaXXX.pgm JuliaXXX.png" into a terminal (such as the one at the top of the Sage file directory or a new terminal), where XXX is     the complex input number and .png (or another of your choosing) is the new file extension.
    
    Because of the limitations of the .pgm format, the output image is relatively small and pixelated.  However, it is a relatively quick and easy to follow             method to creating Julia Sets.
    """
    
    #Set up a range of values
    realaxis = [-2, -1.98,.., 1.98]
    imagaxis = [-2, -1.98,.., 1.98]
    
    #Create the complex number from user input
    c = complex(a, b)
    
    #For file saving purposes
    cstr = str(c)
    newstr = cstr.replace("(", "")
    name = 'Julia' + newstr + '.pgm'
    
    #Image Size
    w = 200
    h = 200
    
    #Open a file to write
    f = open(name, 'w')
    f.write('P2\n') #Signifies file type
    f.write('Julia Set Image \n')
    f.write(str(w) + ' ' + str(h) + '\n') #Image Size
    f.write('255\n') #Color Intensity
    
    for imag in imagaxis:
        for real in realaxis:
            z = complex(real, imag)
            cycle = 255
            
            while abs(z) < 10 and cycle >= 5:
                z = z*z + c
                cycle -= 5
            f.write(str(cycle) + ' ')
        f.write('\n')
    f.close()
  
  


︡ebaa7a37-d99e-4aeb-a17c-ca1186044395︡
︠e2200927-2c4d-43e2-876a-20b3ef48624b︠
#Calling the function example - creates a new file in the same directory
#julia_set_pgm(0.01, 0.57)



︡8e1f4132-f987-46b5-8b9f-a323bf138d44︡
︠f7e60884-a793-45ec-aa39-3052ae28160e︠

︠347d4591-ae7d-46a1-9b59-17f7b8a97208︠










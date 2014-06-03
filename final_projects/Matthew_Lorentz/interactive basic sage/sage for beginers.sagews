
︠f587cea7-570a-46a4-8bf4-aab133bcd478︠
def vectorDisplay(vec):
    """
    For retrieving  and displaying the information in tuples returned from vectors methods.
    """
    displayString = "<"
    count = 1
    for i in vec:
        displayString += str(i)
        if count != len(vec):
            displayString += ", "
        count += 1
    displayString += ">"
    return displayString

@interact
def __(Start = text_control("What would you like to do?"), Selections = selector(['Linear Algebra','Integrate','Differentiate',                           'Functions', 'Systems of equations', 'nothing'], default='nothing', nrows=2, ncols=3,label = "Sections",buttons=False)):
    """
    Creates startup menu.
    """

    if Selections == 'Linear Algebra':
        """
        Creates linear algebra menu.
        """
        @interact
        def __(Start = text_control("What would you like to do?"), Selections_la = selector(['Vectors','Matrix information',
                 'Matrix functions', 'nothing'], default='nothing', nrows=1, ncols=4,label = "Sections",buttons=False)):
            if Selections_la == 'Vectors':
                """
                Creates vector menu.
                """
                @interact
                def __(Start = text_control("What would you like to do?"), Selections_Vec = selector(['Vector information',
                         'Vector functions', 'nothing'], default='nothing', nrows=1, ncols=3,label = "Sections",buttons=False)):
                    if Selections_Vec == 'Vector information':
                        @interact
                        def __(a=input_box(3, label= 'What is the dimension of the vector?')):
                            @interact
                            def __(Enter_vector = input_grid(nrows=1, ncols=a, default=1,
                                    label='Enter vector. Click the green button to evaluate')):
                                vecL = Enter_vector[0]
                                vec = vector(QQ, vecL)
                                @interact
                                def __(show_code_vector = checkbox(False,
                                        label='How do I enter a vector directly in a sage worksheet?')):
                                    """
                                    Shows the code for entering a vector.
                                    """
                                    if show_code_vector == True:
                                       log1 = open('strings/enterAVectorString',mode='r')
                                       html(log1.read())
                                """
                                Allows user to enter vector
                                """
                                @interact
                                def __(Vector_information = text_control("What would you like to do?"), vec_lenght =
                                       checkbox(False, label='Vector lenght') ,
                                       normalized_vec = checkbox(False, label='Normalize vector'),
                                       vec_plot = checkbox(False, label='plot')):
                                    """
                                    Creates vector information menu.
                                    """
                                    if vec_lenght == True:
                                        """
                                        Displays the magnitude of a vector.
                                        """
                                        show(vec.norm())
                                        @interact
                                        def __(show_code_magnitude = checkbox(False,
                                                label='How do I calculate the magnitude of a vector in a sage worksheet?')):
                                            """
                                            Shows the code for calculating the magnitude of a vector.
                                            """
                                            if show_code_magnitude == True:
                                                log2 = open('strings/vecLengthString',mode='r')
                                                html(log2.read())
                                    if normalized_vec == True:
                                        """
                                        Displays the normalized vector.
                                        """
                                        print vectorDisplay(vec.normalized())
                                        @interact
                                        def __(show_code_normalized = checkbox(False,
                                                label='How do I calculate a normalized vector in a sage worksheet?')):
                                            """
                                            Shows the code for calculating a normalized vector.
                                            """
                                            if show_code_normalized == True:
                                                log3 = open('strings/normalized_vector_string',mode='r')
                                                html(log3.read())
                                    if vec_plot == True:
                                        """
                                        Plots vector.
                                        """
                                        print "Be patent, this may take a minute"
                                        if len(vec) == 2:
                                            a = tuple(vec)
                                            show(arrow2d((0, 0), a))
                                            @interact
                                            def __(show_code_2d = checkbox(False,
                                                    label='How do I plot a 2D vector in a sage worksheet?')):
                                                """
                                                Shows the code for ploting a 2D vector.
                                                """
                                                if show_code_2d == True:
                                                    log4 = open('strings/plot_vector_2d_string',mode='r')
                                                    html(log4.read())
                                        elif len(vec) == 3:
                                            b = tuple(vec)
                                            p = arrow3d((0, 0, 0), b)
                                            show(p)
                                            @interact
                                            def __(show_code_3d = checkbox(False,
                                                    label='How do I plot a 3D vector in a sage worksheet?')):
                                                """
                                                Shows the code for plotting a 3D vector.
                                                """
                                                if show_code_3d == True:
                                                    log5 = open('strings/plot_vector_3d_string',mode='r')
                                                    html(log5.read())
                                        else:
                                            print"Cannot plot dimensions larger then R^3."
                    if Selections_Vec == 'Vector functions':
                        @interact
                        def __(a=input_box(3, label= 'What are the dimensions of the vectors?')):
                            @interact
                            def __(Enter_vectorL = input_grid(nrows=1, ncols=a, default=1,
                                    label='Enter left vector. Click the green button to evaluate')):
                                """
                                Allows user to enter vectors.
                                """
                                vecL = Enter_vectorL[0]
                                vecLeft = vector(QQ, vecL)
                                show(vecLeft)
                                @interact
                                def __(Enter_vectorR = input_grid(nrows=1, ncols=a, default=1,
                                        label='Enter right vector. Click the green button to evaluate')):
                                    vecR = Enter_vectorR[0]
                                    vecRight = vector(QQ, vecR)
                                    show(vecRight)
                                    @interact
                                    def __(Vector_functions = text_control("What would you like to do?"), vec_addition =
                                           checkbox(False, label='Addition') ,
                                           dot_prod = checkbox(False, label='Dot product'),
                                           cross_prod = checkbox(False, label='Cross product'),
                                           vec_progection = checkbox(False, label='projection'),
                                           ang = checkbox(False, label='angle between vectors')):
                                        """
                                        Creates vector function menu.
                                        """
                                        if vec_addition == True:
                                            """
                                            Adds vectors
                                            """
                                            print vectorDisplay(vecLeft + vecRight)
                                            @interact
                                            def __(show_code_addVec = checkbox(False,
                                                    label='How do I add vectors in a sage worksheet?')):
                                                """
                                                Shows the code for adding vectors.
                                                """
                                                if show_code_addVec == True:
                                                    log1 = open('strings/vector_addition_string',mode='r')
                                                    html(log1.read())
                                        if dot_prod == True:
                                            """
                                            Calculates dot product.
                                            """
                                            print vecLeft.dot_product(vecRight)
                                            @interact
                                            def __(show_code_dot = checkbox(False,
                                                    label='How do I compute the dot product of two vectors in a sage worksheet?')):
                                                """
                                                Shows the code for computing the dot product of two vectors.
                                                """
                                                if show_code_dot == True:
                                                    log2 = open('strings/vector_dot_product_string',mode='r')
                                                    html(log2.read())
                                        if cross_prod == True:
                                            """
                                            Calculates cross product.
                                            """
                                            print vectorDisplay(vecLeft.cross_product(vecRight))
                                            @interact
                                            def __(show_code_cross = checkbox(False,
                                                    label='How do I compute the cross product of two vectors in a sage worksheet?')):
                                                """
                                                Shows the code for computing the cross product of two vectors.
                                                """
                                                if show_code_cross == True:
                                                    log3 = open('strings/vector_cross_product_string',mode='r')
                                                    html(log3.read())
                                        if vec_progection == True:
                                            """
                                            Calculates vector projection.
                                            """
                                            prog = (vecLeft.dot_product(vecRight)/(vecRight.norm())^2) * vecRight
                                            print "The vector projection of the left vector onto the right vector is"
                                            print vectorDisplay(prog)
                                            @interact
                                            def __(show_code_proj = checkbox(False,
                                                    label='How do I calculate The vector projection of the left vector onto the right vector in a sage worksheet?')):
                                                """
                                                Shows the code for calculating The vector projection of the left vector onto the
                                                right vector.
                                                """
                                                if show_code_proj == True:
                                                    log4 = open('strings/vector_projection_string',mode='r')
                                                    html(log4.read())
                                        if ang == True:
                                            """
                                            Calculates the angle between vectors.
                                            """
                                            print "The angle between the two vectors is"
                                            print (arccos(vecLeft.dot_product(vecRight) / (vecRight.norm() * vecLeft.norm())))
                                            print float(arccos(vecLeft.dot_product(vecRight) / (vecRight.norm() * vecLeft.norm())))
                                            print "Radians"
                                            @interact
                                            def __(show_code_eigenvalue = checkbox(False,
                                                    label='How do I find the angle between two vectors in a sage worksheet?')):
                                                """
                                                Shows the code for finding the angle between two vectors.
                                                """
                                                if show_code_eigenvalue == True:
                                                    log5 = open('strings/angle_between_vectors_string',mode='r')
                                                    html(log5.read())
            if Selections_la == 'Matrix information':
                @interact
                def __(m = input_grid(1, 2, default=3, label='Matrix size: rows, columns. Click the green button to evaluate',
                        width=2)):
                    """
                    Allows user to designate matrix size using an input grid.
                    """
                    v = m[0]
                    @interact
                    def __(Enter_matrix = matrix(QQ, v[0], v[1], range(v[0] * v[1]))):
                        """
                        Allows user to enter matrix entries using an input grid.
                        """
                        show(Enter_matrix)
                        @interact
                        def __(show_code_matrix = checkbox(False, label='How do I enter a matrix directly in a sage worksheet?')):
                            """
                            Displays the code for entering a matrix.
                            """
                            if show_code_matrix == True:
                               log1 = open('strings/enterAMatrixString',mode='r')
                               html(log1.read())
                        @interact
                        def __(Matrix_information = text_control("What would you like to do?"), solve_right =
                               checkbox(False, label='Solve right') , ker = checkbox(False, label='Null-space'), eigenvalue =
                               checkbox(False, label='Eigenvalues'), eigenvec = checkbox(False, label='Eigenvectors'),
                               echelonForm = checkbox(False, label='Echelon form'), det = checkbox(False, label='Determinant'),
                               invert = checkbox(False, label='Inverse')):
                            """
                            Displays options for matrix information.
                            """
                            if solve_right == True:
                                @interact
                                def __(Enter_vector = matrix(QQ, v[1], 1, range(v[1]))):
                                    """
                                    Interactive solve right method.
                                    """
                                    @interact
                                    def __(show_code_vector = checkbox(False,
                                            label='How do I enter a vector directly in a sage worksheet?')):
                                        """
                                        Shows the code for entering a vector.
                                        """
                                        if show_code_vector == True:
                                           log2 = open('strings/enterAVectorString',mode='r')
                                           html(log2.read())
                                    try:
                                        x = Enter_matrix\Enter_vector
                                        html('$$ %s %s = %s$$' %(latex(Enter_matrix), latex(x), latex(Enter_vector)))
                                    except:
                                        html('no solution to $$ %s x = %s$$' %(latex(Enter_matrix), latex(Enter_vector)))
                                    finally:
                                        @interact
                                        def __(show_code_solve_right = checkbox(False,
                                                label='How do I solve right in a sage worksheet?')):
                                            """
                                            Shows the code for solving right.
                                            """
                                            if show_code_solve_right == True:
                                               log3 = open('strings/solveRightString',mode='r')
                                               html(log3.read())
                            if ker == True:
                                print Enter_matrix.right_kernel()
                                @interact
                                def __(show_code_kernel = checkbox(False,
                                        label='How do I find the Null-space of a matrix in a sage worksheet?')):
                                    """
                                    Shows the code for finding the kernel of a matrix.
                                    """
                                    if show_code_kernel == True:
                                       log4 = open('strings/kernelString',mode='r')
                                       html(log4.read())
                            if eigenvalue == True:
                                """
                                Calculates eigenvalues of a matrix.
                                """
                                if v[0] != v[1]:
                                    print "Matrix must be square."
                                else:
                                    print 'Eigenvalues'
                                    print Enter_matrix.eigenvalues()
                                    @interact
                                    def __(show_code_eigenvalue = checkbox(False,
                                            label='How do I calculate eigenvalues in a sage worksheet?')):
                                        """
                                        Shows the code for finding the eigenvalues of a matrix.
                                        """
                                        if show_code_eigenvalue == True:
                                            log5 = open('strings/eigenvaluesString',mode='r')
                                            html(log5.read())
                            if eigenvec == True:
                                """
                                Calculates egenvectors of a matrix.
                                """
                                if v[0] != v[1]:
                                    print "Matrix must be square."
                                else:
                                    print 'Eigenvectors'
                                    w = (Enter_matrix.eigenvectors_left())
                                    count = 1
                                    for l in w:
                                        print "Eigenvector "+str(count)+" values:"
                                        eVec_Value = l[0]
                                        eVec_Vector = l[1][0]
                                        eVec_Multiplicity = l[2]
                                        for i in ["Eigenvalue:",eVec_Value,"Eigenvector:",vectorDisplay(eVec_Vector),
                                                  "Multiplicity of Eigenvector:",eVec_Multiplicity]:
                                            print i
                                        count +=1
                                    @interact
                                    def __(show_code_eigenvectors = checkbox(False,
                                            label='How do I find eigenvectors in a sage worksheet?')):
                                        """
                                        Shows the code for finding eigenvectors.
                                        """
                                        if show_code_eigenvectors == True:
                                           log6 = open('strings/eigenvectorString',mode='r')
                                           html(log6.read())
                            if echelonForm == True:
                                x = Enter_matrix.rref()
                                html('$$ %s ~~~ %s$$' %(latex(Enter_matrix), latex(x)))
                                @interact
                                def __(show_code_echelon = checkbox(False,
                                        label='How do I find the row reduced echelon form of a matrix in a sage worksheet?')):
                                    """
                                    Shows code for finding the reduced row echelon form of a matrix.
                                    """
                                    if show_code_echelon == True:
                                        log7 = open('strings/echelonString',mode='r')
                                        html(log7.read())
                            if det == True:
                                print Enter_matrix.determinant()
                                @interact
                                def __(show_code_determinate=checkbox(False,
                                        label='How do I calculate the determinate of a matrix in a sage worksheet?')):
                                    """
                                    Shows code for calculating the determinate of a matrix.
                                    """
                                    if show_code_determinate == True:
                                        log8 = open('strings/determinate_string',mode='r')
                                        html(log8.read())
                            if invert == True:
                                if Enter_matrix.det() == 0:
                                    print "The matrix is nonsingular. The inverse is undefined."
                                else:
                                    show(Enter_matrix.inverse())
                                    @interact
                                    def __(show_code_inverse  = checkbox(False,
                                            label='How do I calculate the inverse of a matrix in a sage worksheet?')):
                                        """
                                        Shows code for calculating the inverse of a matrix.
                                        """
                                        if show_code_inverse == True:
                                            log9 = open('strings/inverse_string',mode='r')
                                            html(log9.read())
            if Selections_la == 'Matrix functions':
                @interact
                def __(ml = input_grid(1, 2, default=3, label='Left matrix size: rows, columns. Click the green button to evaluate',
                        width=2)):
                    """
                    Allows user to designate left matrix size using an input grid.
                    """
                    vl = ml[0]
                    @interact
                    def __(Enter_matrix_left = matrix(QQ, vl[0], vl[1], range(vl[0] * vl[1]))):
                        """
                        Allows user to enter left matrix entries using an input grid.
                        """
                        show(Enter_matrix_left)
                        @interact
                        def __(mr = input_grid(1, 2, default=3,
                                label='right matrix size: rows, columns. Click the green buton to evaluate', width=2)):
                            """
                            Allows user to designate right matrix size using an input grid.
                            """
                            vr = mr[0]
                            @interact
                            def __(Enter_matrix_right = matrix(QQ, vr[0], vr[1], range(vr[0] * vr[1]))):
                                """
                                Allows user to enter right matrix entries using an input grid.
                                """
                                show(Enter_matrix_right)
                                @interact
                                def __(show_code_matrix = checkbox(False,
                                        label='How do I enter a matrix directly in a sage worksheet?')):
                                    """
                                    Displays the code for entering a matrix.
                                    """
                                    if show_code_matrix == True:
                                       log1 = open('strings/enterAMatrixString',mode='r')
                                       html(log1.read())
                                @interact
                                def __(Matrix_functions = text_control("What would you like to do?"), solve_right =
                                       checkbox(False, label='Solve right') , add = checkbox(False, label='Addition'), mult =
                                       checkbox(False, label='Matrix product')):
                                    if solve_right == True:
                                        if Enter_matrix_left.det() == 0:
                                            print "Since the matrix is nonsingular only one of the possible solutions will be shown"
                                        try:
                                            x = Enter_matrix_left\Enter_matrix_right
                                            html('$$ %s %s = %s$$' %(latex(Enter_matrix_left), latex(x), latex(Enter_matrix_right)))
                                        except:
                                            html('no solution to $$ %s x = %s$$' %(latex(Enter_matrix_left), latex(Enter_matrix_right)))
                                        finally:
                                            @interact
                                            def __(show_code_solve_right = checkbox(False,
                                                    label='How do I solve right in a sage worksheet?')):
                                                """
                                                Shows the code for solving right.
                                                """
                                                if show_code_solve_right == True:
                                                   log3 = open('strings/solveRightString2',mode='r')
                                                   html(log3.read())
                                    if add == True:
                                        x = Enter_matrix_left + Enter_matrix_right
                                        html('$$ %s + %s = %s$$' %(latex(Enter_matrix_left), latex(Enter_matrix_right), latex(x)))
                                        @interact
                                        def __(show_code_matrixAdd = checkbox(False,
                                                label='How do I add matrices in a sage worksheet?')):
                                            """
                                            Shows the code for adding matrices.
                                            """
                                            if show_code_matrixAdd == True:
                                               log4 = open('strings/matrix_addition',mode='r')
                                               html(log4.read())
                                    if mult == True:
                                        x = Enter_matrix_left * Enter_matrix_right
                                        html('$$ %s %s = %s$$' %(latex(Enter_matrix_left), latex(Enter_matrix_right), latex(x)))
                                        @interact
                                        def __(show_code_matrixMult = checkbox(False,
                                                label='How do I multiply matrices in a sage worksheet?')):
                                            """
                                            Shows the code for multipling matrices.
                                            """
                                            if show_code_matrixMult == True:
                                               log5 = open('strings/matrix_multiplication',mode='r')
                                               html(log5.read())

    elif Selections == 'Integrate':
        print 'Please use variables x, y, and z'
        x, y, z = var('x, y, z')
        @interact
        def __(integrals = selector(['Indefinite integral', 'Definite integral', 'nothing'], default='nothing', nrows=1, ncols=3,
                label = "Sections",buttons=False)):
            """
            Creates integration menu.
            """
            if integrals == 'Definite integral':
                @interact
                def __(Start = text_control("What would you like to do?"),
                        Selections_int = selector(['Single integral','Double integral','Triple integral', 'nothing'],
                        default='nothing', nrows=1, ncols=5,label = "Sections",buttons=False)):
                    if Selections_int == 'Single integral':
                        @interact
                        def __(a=input_box(e^x + 5*cos(pi*x), 'What would you like to integrate?'), c=input_box(0, 'From'),
                               d=input_box(5, 'To')):
                            """
                            Calculates definite integrals
                            """
                            b = a.integrate(x, c, d)
                            html('$$ \int_%s^%s (%s) dx = %s$$' %(c, d, latex(a), latex(b)))
                            aprx = float(b)
                            html('$$%s$$' %(aprx))
                            @interact
                            def __(show_code_defIntegrate = checkbox(False,
                                    label='How do I calculate a definite integral in a sage worksheet?')):
                                """
                                Shows the code for calculating a definite integral.
                                """
                                if show_code_defIntegrate == True:
                                    log1 = open('strings/defIntString',mode='r')
                                    html(log1.read())
                    if Selections_int == 'Double integral':
                        @interact
                        def __(a=input_box(y^2*e^(x*y), 'What would you like to integrate?'), Inner=text_control(' '),
                               c=input_box(1, 'From'), d=input_box(2, 'To'), e=input_box(x, 'with respect to'),
                               Outer=text_control(' '),
                               f=input_box(3, 'From'), g=input_box(4, 'To'), h=input_box(y, 'with respect to')):
                            """
                            Calculates definite double integrals
                            """
                            b = a.integrate(e, c, d)
                            html('$$ \int_%s^%s \int_%s^%s (%s) d%s d%s = \int_%s^%s (%s) d%s $$' %(f, g, latex(c), latex(d),
                                    latex(a), e, h, f, g, latex(b), h))
                            i = b.integrate(h, f, g)
                            html('$$ \int_%s^%s (%s) d%s = %s$$' %(f, g, latex(b), h, latex(i)))
                            aprx = float(i)
                            html('$$%s$$' %(aprx))
                            @interact
                            def __(show_code_defIntegrate = checkbox(False,
                                    label='How do I calculate a definite integral in a sage worksheet?')):
                                """
                                Shows the code for calculating a definite integral.
                                """
                                if show_code_defIntegrate == True:
                                    log1 = open('strings/defIntString',mode='r')
                                    html(log1.read())
                    if Selections_int == 'Triple integral':
                        @interact
                        def __(a=input_box(z*e^(-y^2), 'What would you like to integrate?'), Inner=text_control(' '),
                               c=input_box(0, 'From'), d=input_box(y, 'To'), e=input_box(x, 'with respect to'),
                               Middle=text_control(' '), f=input_box(0, 'from'), g=input_box(1, 'to'),
                               h=input_box(y, 'with respect to'), Outer=text_control(''), j=input_box(0, 'from'),
                               k=input_box(1, 'to'), l=input_box(z, 'with respect to') ):
                            """
                            Calculates definite triple integrals
                            """
                            aIn = a.integrate(e, c, d)
                            html('$$ \int_%s^%s \int_%s^%s \int_%s^%s (%s) d%s d%s d%s = \int_%s^%s \int_%s^%s (%s) d%s d%s $$' %(
                                  j, k, f, g, c, d, latex(a), e, h, l, j, k, f, g, latex(aIn), h, l))
                            aMid = aIn.integrate(h, f, g)
                            html('$$ \int_%s^%s \int_%s^%s (%s) d%s d%s = \int_%s^%s (%s) d%s $$' %(j, k, f, g, latex(aIn), h,
                                    l, j, k, latex(aMid), l))
                            aOut = aMid.integrate(l, j, k)
                            html('$$ \int_%s^%s (%s) d%s = %s$$' %(j, k, latex(aMid), l, latex(aOut)))
                            aprx = float(aOut)
                            html('$$%s$$' %(aprx))
                            @interact
                            def __(show_code_defIntegrate = checkbox(False,
                                    label='How do I calculate a definite integral in a sage worksheet?')):
                                """
                                Shows the code for calculating a definite integral.
                                """
                                if show_code_defIntegrate == True:
                                    log1 = open('strings/defIntString',mode='r')
                                    html(log1.read())
            elif integrals == 'Indefinite integral':
                @interact
                def __(a=input_box(e^x + x^2*log(x) + 5*cos(pi*x), 'What would you like to integrate?')):
                    """
                    Calculates indefinite integrals.
                    """
                    b = a.integrate(x)
                    html('$$ \int (%s) dx = %s$$' %(latex(a), latex(b)))
                    @interact
                    def __(show_code_inIntegrate = checkbox(False,
                            label='How do I calculate an indefinate integral in a sage worksheet?')):
                        """
                        Shows the code for calculating a indefinite integral.
                        """
                        if show_code_inIntegrate == True:
                            log2 = open('strings/indefIntString',mode='r')
                            html(log2.read())
                    @interact
                    def __(Integral = text_control("Would you like to see a plot?"), plotEq = checkbox(False,
                            label='<font color="blue">Function plot</font color>') , inter_Eq = checkbox(False,
                            label='<font color = "red">Integral plot</font color>')):
                        """
                        Plots the integral of a function, and the function.
                        """
                        if plotEq == True and inter_Eq == True:
                            Pa = plot(a)
                            Pb = plot(b, color='red')
                            show(Pa + Pb)
                        elif plotEq == True:
                            Pa = plot(a)
                            show(Pa)
                        elif inter_Eq == True:
                            Pb = plot(b, color='red')
                            show(Pb)
    elif Selections == 'Differentiate':
        print 'Please use variables x, y, and z'
        x, y, z = var('x, y, z')
        @interact
        def __(a=input_box(e^x + x^2*log(x) + 5*cos(pi*x), 'What would you like to differetiate?'), h=input_box(x, 'with respect to'),):
            """
            Calculates the derivative of a function.
            """
            b = a.diff(h)
            html('$$ d/d%s (%s) = %s$$' %(h, latex(a), latex(b)))
            c = b.diff(h)
            html('$$ d^2/d%s^2 (%s) = %s$$' %(h, latex(a), latex(c)))
            d = c.diff(h)
            html('$$ d^3/d%s^3 (%s) = %s$$' %(h, latex(a), latex(d)))
            e = d.diff(h)
            html('$$ d^4/d%s^4 (%s) = %s$$' %(h, latex(a), latex(e)))
            @interact
            def __(show_code_diferentiate = checkbox(False, label='How do I calculate a derivative in a sage worksheet?')):
                """
                Shows the code for calculating a derivative.
                """
                if show_code_diferentiate == True:
                    log1 = open('strings/derivativeString',mode='r')
                    html(log1.read())
            @interact
            def __(Derivative = text_control("Would you like to see a plot?"), plotEq = checkbox(False,
                    label='<font color="blue">Function plot</font color>') , inter_Eq = checkbox(False,
                    label='<font color = "red">Derivitive plot</font color>')):
                """
                Plots the derivitive of a function, and the function.
                """
                if plotEq == True and inter_Eq == True:
                    Pa = plot(a)
                    Pb = plot(b,color='red')
                    show(Pa + Pb)
                elif plotEq == True:
                    Pa = plot(a)
                    show(Pa)
                elif inter_Eq == True:
                    Pb = plot(b,color='red')
                    show(Pb)
    elif Selections == 'Functions':
        print 'Please use variables x, y, and z'
        x, y, z = var('x, y, z')
        @interact
        def __(a=input_box(x^2 - x - 6, 'Please enter your function')):
            show(a)
            @interact
            def __(Equations = text_control("What would you like to do?"), solve_eq =
                   checkbox(False, label='Solve equation') , fact = checkbox(False, label='Factor'),
                   graph = checkbox(False, label='Plot')):
                if solve_eq == True:
                   @interact
                   def __(c=input_box(0, 'The function equals'), b=input_box(x, "What would you like to solve for?")):
                        """
                        solves a single function
                        """
                        d = [a == c]
                        show(d)
                        m = solve(d, b)
                        html('$$ %s $$' %(latex(m)))
                        @interact
                        def __(show_code_solve1 = checkbox(False, label='How do I solve an equation in a sage worksheet?')):
                            """
                            Shows the code for solving an equation.
                            """
                            if show_code_solve1 == True:
                                log1 = open('strings/solve_function_string',mode='r')
                                html(log1.read())
                if fact == True:
                    """
                    Factors a function
                    """
                    b = factor(a)
                    html('$$ %s = %s $$' %(latex(a), latex(b)))
                    @interact
                    def __(show_code_fact = checkbox(False, label='How do I factor a function in a sage worksheet?')):
                        """
                        Shows the code for factoring a function.
                        """
                        if show_code_fact == True:
                            log2 = open('strings/factor_function_string',mode='r')
                            html(log2.read())
                if graph == True:
                    @interact
                    def __(Plot_equation = text_control("What dimension is the equation?"),
                           Selections_plot = selector(['2D', '3D', 'nothing'], default='nothing', nrows=1, ncols=3,
                           label = "Sections",buttons=False)):
                        """
                        plots a 2d function
                        """
                        if Selections_plot == '2D':
                            @interact
                            def __(xMin=input_box(-1, 'From x ='), xMax=input_box(1, 'To x =')):
                                P = plot(a, (x, xMin, xMax))
                                show(P)
                                @interact
                                def __(show_code_2d = checkbox(False, label='How do I plot a function in a sage worksheet?')):
                                    """
                                    Shows the code for plotting a function in sage.
                                    """
                                    if show_code_2d == True:
                                        log3 = open('strings/plot_2d_string',mode='r')
                                        html(log3.read())
                        elif Selections_plot == '3D':
                            @interact
                            def __(xMin=input_box(-1, 'From x ='), xMax=input_box(1, 'To x ='), yMin=input_box(-1, 'From y ='),
                                   yMax=input_box(1, 'To y ='), zMin=input_box(-1, 'From z ='),
                                   zMax=input_box(1, 'To z =')):
                                """
                                Plots a 3D function
                                """
                                P = plot3d(a, (x, xMin, xMax), (y, yMin, yMax), (z, zMin, zMax))
                                show(P)
                                @interact
                                def __(show_code_3d = checkbox(False, label='How do I make a 3D plot in a sage worksheet?')):
                                    """
                                    Shows the code for makeing a 3D plot.
                                    """
                                    if show_code_3d == True:
                                        log4 = open('strings/3d_plot_string',mode='r')
                                        html(log4.read())
    elif Selections == 'Systems of equations':
        x, y, z = var('x, y, z')
        @interact
        def __(System_of_equations = text_control("For how many variables?"),
                Selections_system = selector(['2', '3', 'nothing'], default='nothing', nrows=1, ncols=3,
                label = "Sections",buttons=False)):
            if Selections_system == '2':
                print 'Please use variables x and y'
                print "and use '==' for '='"
                @interact
                def __(a=input_box(x + y == 6, 'Please enter first equation'), b=input_box(x - y == 4, 'Please enter second equation')):
                    """
                    Solves a system of equations in two variables.
                    """
                    d = [a, b]
                    show(d)
                    m = solve(d, x, y)
                    html('$$ %s $$' %(latex(m)))
                    @interact
                    def __(show_code_system = checkbox(False, label='How do I solve a system of equations in a sage worksheet?')):
                        """
                        Shows the code for solving a system of equations.
                        """
                        if show_code_system == True:
                            log1 = open('strings/system_equations_string',mode='r')
                            html(log1.read())
            if Selections_system == '3':
                print 'Please use variables x, y, and z'
                print "and use '==' for '='"
                @interact
                def __(a=input_box(x + y + z == 10, 'Please enter first equation'),
                       b=input_box(x - y + z == 22, 'Please enter second equation'),
                       c=input_box(x - y - z == 0, 'Please enter third equation')):
                    """
                    Solves a system of equations in three variables.
                    """
                    d = [a, b, c]
                    show(d)
                    m = solve(d, x, y, z)
                    html('$$ %s $$' %(latex(m)))
                    @interact
                    def __(show_code_system = checkbox(False, label='How do I solve a system of equations in a sage worksheet?')):
                        """
                        Shows the code for solving a system of equations.
                        """
                        if show_code_system == True:
                            log1 = open('strings/system_equations_string',mode='r')
                            html(log1.read())

︡8af66a56-0811-475e-836f-df8efeac916d︡{"interact":{"style":"None","flicker":false,"layout":[[["Start",12,null]],[["Selections",12,null]],[["",12,null]]],"id":"462fa4f9-e907-45ce-b362-065610b4305e","controls":[{"default":"What would you like to do?","var":"Start","classes":null,"control_type":"text","label":"Start"},{"buttons":false,"control_type":"selector","ncols":3,"button_classes":null,"default":5,"lbls":["Linear Algebra","Integrate","Differentiate","Functions","Systems of equations","nothing"],"label":"Sections","nrows":2,"width":null,"var":"Selections"}]}}︡
︠802175cb-2306-4ffd-86ea-88aa81742225︠

︡66fdba46-c72d-430b-aa36-5cd72b1ba63d︡
︠8e0cc342-23ed-4c2b-945b-956155d10d37i︠
log2 = open('strings/vec_length_string',mode='r')
html(log2.read())
︡5346a549-bf95-40fb-87a4-61d148021207︡
︠9af804f2-3f2b-4453-aab5-09281b9a631b︠

︡93683923-b82e-449a-9541-b9829fb32ea5︡
︠86a39b62-a09e-4425-8520-52c300efd898︠

︠a258206c-74de-4316-af73-8adfbe5671af︠

︠0750fcf4-3838-4f51-99f5-f735871eb3bb︠

︠b38578f3-461e-40b2-b786-a260c687ff66︠

︠dc97dfc5-31f6-43c4-9f77-a1b90250de42︠

︠c22c69a8-be1a-4fa6-a766-62880f9c99f7︠










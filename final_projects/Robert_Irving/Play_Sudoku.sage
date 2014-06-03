def Play_Sudoku(Input):
    """
    This function allows you to create an interactive Sudoku puzzle. It checks for invalid Sudoku dimensions, invalid entries, conficting entries, and a valid solution on each turn. Each turn you are given a coice of selecting from 4 options. The first, 'Play', allows you to play normally. The second, 'How To Play', returns a discription of how to play Sudoku. The third, 'Hint', returns a random hint for the puzzle in the form of a cell location and the value that goes there. The fourth, 'Show Solution', returns a valid solution to the given puzzle. The dimension of the Sudoku must be a perfect square no larger than 16X16.
    
    INPUT:
    
    -Input-- An integer, a list, a string, a matrix, or a Sudoku. ('Puzzle1','Puzzle2','Puzzle3','Puzzle4', and 'Blank 9X9' yield example puzzles)
    
    OUTPUT:
    
    -A Sudoku as an interactive grid-- Filled with zeroes when Input is an Integer. A row dominant interpretation of a list of entries otherwise.
    """
    from sage.games.sudoku import sudoku
    from sage.matrix.matrix0 import Matrix
    DimensionError = TypeError('Invalid demensions. Please enter a dimension for a square or a Sudoku with a dimension that is a perfect square.')
    if Input == 'Puzzle1': # Example of a Matrix as Input.
        Input = matrix(ZZ,9,[5,0,0, 0,8,0, 0,4,9, 0,0,0, 5,0,0, 0,3,0, 0,6,7, 3,0,0, 0,0,1, 1,5,0, 0,0,0, 0,0,0,  0,0,0, 2,0,8, 0,0,0, 0,0,0, 0,0,0, 0,1,8, 7,0,0, 0,0,4, 1,5,0, 0,3,0, 0,0,2, 0,0,0, 4,9,0, 0,5,0, 0,0,3])
    elif Input == 'Puzzle2': # Example of a string as Input.
        Input = '5...8..49...5...3..673....115..........2.8..........187....415..3...2...49..5...3'
    elif Input == 'Puzzle3': #Example of a list as Input.
        Input = [1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 9, 0, 4, 0, 0, 0, 5, 0, 0, 0, 6, 0, 0, 0, 7, 0, 0, 0, 5, 0, 9, 0, 3, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 8, 5, 0, 0, 4, 0, 7, 0, 0, 0, 0, 0, 6, 0, 0, 0, 3, 0, 0, 0, 9, 0, 8, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1]
    elif Input == 'Puzzle4': #Example of a Sudoku puzzle as Input.
        Input = Sudoku('.4..32....14..3.')
    elif Input == 'Blank 9X9': #Example of an integer as Input.
        Input = 9
    if isinstance(Input, Integer): #If the input is an Integer, it tries it as a dimension. Creates a list of length Input^2 of 0's. A blank Sudoku.            
        Entry = []
        for i in range(Input^2):
            Entry.append(0)
        D = Input
    elif isinstance(Input, str): #If Input is a string, turn into a list.
        Entry = []
        for i in Input:
            if i=='.':
                i = 0
            Entry.append(Integer(i))
        D = sqrt(len(Entry))
    elif isinstance(Input, Matrix): #If Input is a Matrix, turn into a list.
        D = Input.nrows()
        if D!=Input.ncols():
            print DimensionError
        Entry = []
        for i in range(D):
            for j in range(D):
                Entry.append(Input[i,j])
    elif isinstance(Input,list): #If Input is a list, rename it.
        Entry = Input
        D = sqrt(len(Input))
    elif isinstance(Input, Sudoku): #If Input is a list, string, or Matrix, converts to a Sudoku then to a matrix.
        Entry = Input.to_list()
        D = sqrt(len(Entry))
    else: # If not any of the above cases, error.
        print 'Your input must be an Integer, str, list, Matrix or Sudoku.'
        raise TypeError
        Entry = 0
        D = 0
    d2 = sqrt(D)
    if d2!=floor(d2): #Dimension error if dimension is not a perfect square.
        print DimensionError
    if D > 16:
        raise ValueError('The demensions of your Sudoku are too large! It must be no larger than 16X16.')
    @interact
    def _(M = input_grid(D,D, default = Entry , label='Create a Sudoku!', to_value = matrix, width = 2),Options=selector(['Play','How To Play','Hint', 'Show Solution'], default = 'Play', buttons = True)):
        if Options == 'How To Play':
            print """The objective is to fill a D×D, where D is a perfect square (ie D = d^2 where d is an integer, most often D = 9), grid with digits so that each column, each row, and each of the D sqrt(D)×sqrt(D) sub-squares that compose the Sudoku grid contains all of the digits from 1 to D. 0's represent empty entries. After each turn press enter to update the puzzle. If you select an option other than 'Play', be sure to select 'Play' before moving forward by pressing enter. If you do not do this, it will perform another turn with the selected option.
            To see valid inputs, see DocString.
            The dimension of the Sudoku can only be 1X1, 4X4, 9X9, or 16X16.
            Generally a puzzle has a unique solution. For possible puzzles, please see http://www.pdfpad.com/sudoku/ select a difficulty and select print or copy and paste a puzzle below as input for Play_Sudoku.
            'Puzzle1'
            'Puzzle2'
            'Puzzle3'
            'Puzzle4'
            'Blank 9X9'"""
            sys.stdout.flush()
        invalid = []
        nonzero = []
        zero = []
        for i in range(D):
            for j in range(D):
                value = M[i,j]
                if value not in range(D+1):
                    invalid.append((i,j))
                    nonzero.append((i,j))
                elif value != 0:
                    nonzero.append((i,j))
                elif value == 0:
                    zero.append((i,j))
        if len(nonzero)==0: #Check that the Sudoku is not empty.
            print 'New Sudoku!'
            S = Sudoku(M)
        elif len(invalid)==0: #Check that there are no duplicates in any row, column or square
            conflicts = 0
            Len = len(nonzero)
            for i in range(Len-1): #Counts the number of conflicts.
                d = d2
                x = nonzero[i]
                value1 = M[x[0],x[1]]
                for y in nonzero[i+1:]:
                    value2 = M[y[0],y[1]]
                    if (x[0]==y[0] and value1==value2): #Checks for conflicts in each row.
                        print 'Conflict: too many %s\'s in row %s.'%(value1, x[0]+1)
                        sys.stdout.flush()
                        conflicts+=1
                    if (x[1] == y[1] and value1==value2): #Checks for conflicts in each column.
                        print 'Conflict: too many %s\'s in column %s.'%(value1,x[1]+1)
                        sys.stdout.flush()
                        conflicts+=1
                    if (floor(x[0]/d)==floor(y[0]/d) and floor(x[1]/d)==floor(y[1]/d) and value1==value2): #Checks for conflicts in each subsquare.
                        print 'Conflict: too many %s\'s in region %s' %(value1, (floor(x[0]/d)+1,floor(x[1]/d)+1))
                        sys.stdout.flush()
                        conflicts +=1
            if conflicts==0: #Make it into a Sudoku and check that there are solutions.
                S = Sudoku(M)
                try: 
                    Solution = S.solve().next()
                    if len(nonzero)==D*D:
                        print 'Your puzzle is complete!!'
                    elif Options == 'Show Solution':
                        print Solution                    
                    elif Options == 'Hint': #Gives a random hint!
                        import random
                        tuple_zero = tuple(zero)
                        l = len(tuple_zero)
                        pos = random.randint(0,l-1)
                        hint = tuple_zero[pos]
                        Sol = matrix(Solution)
                        val = Sol[hint[0],hint[1]]
                        
                        h1 = hint[0]+1
                        h2 = hint[1]+1
                        print "HINT:  There is a %s in square %s."%(val, (h1,h2))
                    else:
                        print('You have filled %s entries of %s out correctly.')%(D^2, Len)
                        print 'Good job! Please continue playing Sudoku.'
                except (StopIteration) as msg:
                    print 'There are no valid solutions to the given puzzle.'   
            else:
                print 'There are a total of %s conflicts. Please correct them to keep playing.' %conflicts
        else:
            invalid2 = []
            for i in invalid:
                i = (i[0]+1, i[1]+1)
                invalid2.append(i)
            print "Please correct your Sudoku. You have invalid entries at: %s" %(invalid2)
        salvus.javascript("$('.salvus-interact-control-grid').find('input').css('border','2px solid black')")
        salvus.javascript("$('.salvus-interact-control-grid').find('input').css('color','black')")
        









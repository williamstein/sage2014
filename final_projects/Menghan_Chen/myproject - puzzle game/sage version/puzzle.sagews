︠bb888893-a44c-4638-95de-a01899b17eabi︠
%md
Menghan Chen, MATH480B, 14sp, Project
︡614620e1-d457-4b81-b2b2-4452b6882e38︡{"html":"<p>Menghan Chen, MATH480B, 14sp, Project</p>\n"}︡
︠168b1a9a-c473-43d6-96d9-e8bb5aa1c67bi︠
%md
# Puzzle Class

︡6f204cbe-1fd0-4f01-98ee-6a99624eaf24︡{"html":"<h1>Puzzle Class</h1>\n"}︡
︠2e85a34a-1ffc-4ee2-930b-76d5440d4963︠
from random import shuffle

def make_list(self):
    """
    This function takes a Puzzle object as input, and returns a list in the original order of puzzle tiles.
    
    INPUT:
        - self -- Puzzle object
        
    OUTPUT:
        - a list
    
    EXAMPLES::
        sage: a = Puzzle(4)
        sage: make_list(a)
        ['1 ', '2 ', '3 ', '4 ', '5 ', '6 ', '7 ', '8 ', '9 ', '10', '11', '12', '13', '14', '15', '  ']
        
    """
    a = []
    for i in interval(1, self.grid^2-1):
        if (i<10):
           a.append(str(i)+' ')
        else:
           a.append(str(i))
    a.append('  ')
    return a

def make_shuffle_list(self):
    """
    This function takes a Puzzle object as input, and returns a list in random order of puzzle tiles.
    
    INPUT:
        - self -- Puzzle object
        
    OUTPUT:
        - a list
    
    EXAMPLES::
        sage: a = Puzzle(4)
        sage: make_shuffle_list(a)
        ['5 ', '13', '  ', '3 ', '12', '8 ', '15', '1 ', '2 ', '4 ', '7 ', '10', '9 ', '14', '11', '6 ']
        
    """
    shuffle(self.list)
    return self.list

def make_puzzle(self, list):
    """
    This function takes a Puzzle object and a list as input, and returns a string which represent the puzzle game.
    
    INPUT:
        - self -- Puzzle object
        - list -- a list in the order of puzzle tiles
        
    OUTPUT:
        - a string which represent the puzzle game
    
    EXAMPLES::
        sage: a = Puzzle(4)
        sage: print make_puzzle(a, a.list)
        +--+--+--+--+
        |1 |2 |3 |4 |
        +--+--+--+--+
        |5 |6 |7 |8 |
        +--+--+--+--+
        |9 |10|11|12|
        +--+--+--+--+
        |13|14|15|  |
        +--+--+--+--+
        
    """
    a = '+' + '--+'*self.grid 
    l = a + '\n|'
    i = 1
    for e in list:
        if ((i-1)%self.grid==0) and (i>1):
            l += '\n' + a + '\n|'
        l += e + '|'
        i += 1
    l += '\n' + a 
    return l

class Puzzle:   
    """
    An object representing a Puzzle game. 
    You can define the size of the puzzle. 
    You can move the tiles to the right, left, up and down.
    You can shuffle the puzzle.
    You can also check if the puzzle is solved or not.

    """
    
    def __init__(self, grid):
        """
        This function initialize the Puzzle object with the number of grid as input.
        The number of grid should be an integer between 2 and 9 inclusively.
    
        INPUT:
            - grid -- integer between 2 and 9 inclusively
        
        OUTPUT:
            - a Puzzle object
    
        EXAMPLES::
            sage: a = Puzzle(3.5)
            Error in lines 1-1
            Traceback (most recent call last):
              File "/projects/186493da-0eff-43fb-b64e-6bcc854b325b/.sagemathcloud/sage_server.py", line 733, in execute
                exec compile(block+'\n', '', 'single') in namespace, locals
              File "", line 1, in <module>
              File "", line 4, in __init__
            ValueError: The number of grid should be a integer!
            
            sage: a = Puzzle(1)
            Error in lines 1-1
            Traceback (most recent call last):
              File "/projects/186493da-0eff-43fb-b64e-6bcc854b325b/.sagemathcloud/sage_server.py", line 733, in execute
                exec compile(block+'\n', '', 'single') in namespace, locals
              File "", line 1, in <module>
              File "", line 4, in __init__
            ValueError: The number of grid should be greater than 1!
            
            sage: a = Puzzle(1)
            Error in lines 1-1
            Traceback (most recent call last):
              File "/projects/186493da-0eff-43fb-b64e-6bcc854b325b/.sagemathcloud/sage_server.py", line 733, in execute
                exec compile(block+'\n', '', 'single') in namespace, locals
              File "", line 1, in <module>
              File "", line 4, in __init__
            ValueError: The number of grid should be greater than 1!
            
            sage: a = Puzzle(4)
            <__builtin__.Puzzle instance at 0x80aa098>
            
        """
        if not(isinstance(grid, Integer)) :
            raise ValueError('The number of grid should be a integer!')
        elif (grid <= 1):
            raise ValueError('The number of grid should be greater than 1!')
        elif (grid >= 10):
            raise ValueError('The number of grid should be less than 10!')
        else:
            self.grid = grid 
            self.list = make_list(self)
            
    def __repr__(self):
        """
        Returns a concise description of a Puzzle game using a string representation.

        EXAMPLE::

            sage: a = Puzzle(4)
            sage: print a
            +--+--+--+--+
            |1 |2 |3 |4 |
            +--+--+--+--+
            |5 |6 |7 |8 |
            +--+--+--+--+
            |9 |10|11|12|
            +--+--+--+--+
            |13|14|15|  |
            +--+--+--+--+

        """
        return make_puzzle(self, self.list)
    
    def move_right(self):
        """
        This function moves the tile on the left of the blank tile to the right. 
        If the blank tile is at the left edge of the puzzle, raise ValueError('You cannot move to the right!').

        EXAMPLE::

            sage: a = Puzzle(4)
            sage: print a.move_right()
            +--+--+--+--+
            |1 |2 |3 |4 |
            +--+--+--+--+
            |5 |6 |7 |8 |
            +--+--+--+--+
            |9 |10|11|12|
            +--+--+--+--+
            |13|14|  |15|
            +--+--+--+--+

            sage: a = Puzzle(4)
            sage: print a.move_right()
            sage: print a.move_right()
            sage: print a.move_right()
            +--+--+--+--+
            |1 |2 |3 |4 |
            +--+--+--+--+
            |5 |6 |7 |8 |
            +--+--+--+--+
            |9 |10|11|12|
            +--+--+--+--+
            |  |13|14|15|
            +--+--+--+--+
            sage: print a.move_right()
            Error in lines 5-5
            Traceback (most recent call last):
              File "/projects/186493da-0eff-43fb-b64e-6bcc854b325b/.sagemathcloud/sage_server.py", line 733, in execute
                exec compile(block+'\n', '', 'single') in namespace, locals
              File "", line 1, in <module>
              File "", line 77, in move_right
            ValueError: You cannot move to the right!
        """        
        blankInd = self.list.index(e)
        if ((blankInd)%self.grid == 0):
            raise ValueError('You cannot move to the right!')
        else:
            self.list[blankInd], self.list[blankInd-1] = self.list[blankInd-1], self.list[blankInd] 
        return make_puzzle(self, self.list)
    
    def move_left(self):
        """
        This function moves the tile on the right of the blank tile to the left. 
        If the blank tile is at the right edge of the puzzle, raise ValueError('You cannot move to the left!').

        EXAMPLE::

            sage: a = Puzzle(4)
            sage: print a.move_left()
            Error in lines 2-2
            Traceback (most recent call last):
              File "/projects/186493da-0eff-43fb-b64e-6bcc854b325b/.sagemathcloud/sage_server.py", line 733, in execute
                exec compile(block+'\n', '', 'single') in namespace, locals
              File "", line 1, in <module>
              File "", line 84, in move_left
            ValueError: You cannot move to the left!
            
            sage: a = Puzzle(4)
            sage: print a.move_right()
            +--+--+--+--+
            |1 |2 |3 |4 |
            +--+--+--+--+
            |5 |6 |7 |8 |
            +--+--+--+--+
            |9 |10|11|12|
            +--+--+--+--+
            |13|14|  |15|
            +--+--+--+--+
            sage: print a.move_left()
            +--+--+--+--+
            |1 |2 |3 |4 |
            +--+--+--+--+
            |5 |6 |7 |8 |
            +--+--+--+--+
            |9 |10|11|12|
            +--+--+--+--+
            |13|14|15|  |
            +--+--+--+--+   

        """     
        blankInd = self.list.index(e)
        if ((blankInd+1)%self.grid == 0):
            raise ValueError('You cannot move to the left!')
        else:
            self.list[blankInd], self.list[blankInd+1] = self.list[blankInd+1], self.list[blankInd] 
        return make_puzzle(self, self.list)
    
    def move_up(self):
        """
        This function moves the tile on the bottom of the blank tile to the top. 
        If the blank tile is at the bottom edge of the puzzle, raise ValueError('You cannot move up!').

        EXAMPLE::

            sage: a = Puzzle(4)
            sage: print a.move_up()
            Error in lines 2-2
            Traceback (most recent call last):
              File "/projects/186493da-0eff-43fb-b64e-6bcc854b325b/.sagemathcloud/sage_server.py", line 733, in execute
                exec compile(block+'\n', '', 'single') in namespace, locals
              File "", line 1, in <module>
              File "", line 93, in move_up
            ValueError: You cannot move up!
            
            sage: a = Puzzle(4)
            sage: print a.move_down()
            +--+--+--+--+
            |1 |2 |3 |4 |
            +--+--+--+--+
            |5 |6 |7 |8 |
            +--+--+--+--+
            |9 |10|11|  |
            +--+--+--+--+
            |13|14|15|12|
            +--+--+--+--+
            sage: print a.move_up()
            +--+--+--+--+
            |1 |2 |3 |4 |
            +--+--+--+--+
            |5 |6 |7 |8 |
            +--+--+--+--+
            |9 |10|11|12|
            +--+--+--+--+
            |13|14|15|  |
            +--+--+--+--+   

        """     
        blankInd = self.list.index('  ')
        if ((blankInd)<=(self.grid^2-self.grid)):
            self.list[blankInd], self.list[blankInd+self.grid] = self.list[blankInd+self.grid], self.list[blankInd]
        else:
            raise ValueError('You cannot move up!')
        return make_puzzle(self, self.list)
    
    def move_down(self):
        """
        This function moves the tile on the top of the blank tile to the bottom. 
        If the blank tile is at the top edge of the puzzle, raise ValueError('You cannot move down!').

        EXAMPLE::

            sage: a = Puzzle(4)
            sage: print a.move_down()
            sage: print a.move_down()
            sage: print a.move_down()
            +--+--+--+--+
            |1 |2 |3 |  |
            +--+--+--+--+
            |5 |6 |7 |4 |
            +--+--+--+--+
            |9 |10|11|8 |
            +--+--+--+--+
            |13|14|15|12|
            +--+--+--+--+
            sage: print a.move_down()
            Error in lines 5-5
            Traceback (most recent call last):
              File "/projects/186493da-0eff-43fb-b64e-6bcc854b325b/.sagemathcloud/sage_server.py", line 733, in execute
                exec compile(block+'\n', '', 'single') in namespace, locals
              File "", line 1, in <module>
              File "", line 98, in move_down
            ValueError: You cannot move down!
  
        """     
        blankInd = self.list.index(e)
        if ((blankInd)<self.grid):
            raise ValueError('You cannot move down!')
        else:
            self.list[blankInd], self.list[blankInd-self.grid] = self.list[blankInd-self.grid], self.list[blankInd] 
        return make_puzzle(self, self.list)
    
    def is_solved(self):
        """
        This function checks if the puzzle is solved. 

        EXAMPLE::

            sage: a = Puzzle(4)
            sage: print a.move_down()
            sage: a.is_solved()
            +--+--+--+--+
            |1 |2 |3 |4 |
            +--+--+--+--+
            |5 |6 |7 |8 |
            +--+--+--+--+
            |9 |10|11|  |
            +--+--+--+--+
            |13|14|15|12|
            +--+--+--+--+
            'The puzzle is not solved yet. Please try again!'
            
            sage: print a.move_up()
            sage: a.is_solved()
            +--+--+--+--+
            |1 |2 |3 |4 |
            +--+--+--+--+
            |5 |6 |7 |8 |
            +--+--+--+--+
            |9 |10|11|12|
            +--+--+--+--+
            |13|14|15|  |
            +--+--+--+--+
            'Congratulations! You win!'
  
        """     
        if (self.list == make_list(self)):
            return "Congratulations! You win!"
        else:
            return "The puzzle is not solved yet. Please try again!"
        
    def shuffle(self):
        """
        This function shuffles the tile of the puzzle. 

        EXAMPLE::

            sage: a = Puzzle(4)
            sage: print a.shuffle()
            +--+--+--+--+
            |7 |5 |  |6 |
            +--+--+--+--+
            |15|1 |10|2 |
            +--+--+--+--+
            |9 |8 |12|13|
            +--+--+--+--+
            |3 |14|11|4 |
            +--+--+--+--+
 
        """         
        self.list = make_shuffle_list(self)
        return make_puzzle(self, self.list)
︡2f6b937f-8eab-4f62-b473-8c6402357fdf︡
︠6ebc6e59-d7b3-42da-a0be-9abd4d3090ba︠

︠80dc549a-e993-48e8-9576-89e889bc7412i︠
%md
# Application
︡5c486a48-1189-45f9-8e72-a667abc266ed︡{"html":"<h1>Application</h1>\n"}︡
︠f752b495-3966-47c4-ae68-e2fad4695730︠
#You can make different size of puzzle. The number of grid should be interger between 2 and 9 inclusively.
a = Puzzle(3); a
b = Puzzle(5); b
︡9aaaa63a-ed85-4def-b4ae-09f2f6493df1︡{"stdout":"+--+--+--+\n|1 |2 |3 |\n+--+--+--+\n|4 |5 |6 |\n+--+--+--+\n|7 |8 |  |\n+--+--+--+\n"}︡{"stdout":"+--+--+--+--+--+\n|1 |2 |3 |4 |5 |\n+--+--+--+--+--+\n|6 |7 |8 |9 |10|\n+--+--+--+--+--+\n|11|12|13|14|15|\n+--+--+--+--+--+\n|16|17|18|19|20|\n+--+--+--+--+--+\n|21|22|23|24|  |\n+--+--+--+--+--+\n"}︡
︠27431d2c-572b-4b15-a6cd-d4ac76b42f7c︠
#Now let's make a 4*4 puzzle game.
a = Puzzle(4); a
︡eaaaa269-9ba7-43c5-af6f-20dd2d446429︡{"stdout":"+--+--+--+--+\n|1 |2 |3 |4 |\n+--+--+--+--+\n|5 |6 |7 |8 |\n+--+--+--+--+\n|9 |10|11|12|\n+--+--+--+--+\n|13|14|15|  |\n+--+--+--+--+\n"}︡
︠57325fa0-fbdd-4f0a-b400-1d8d6d7ba0f8︠
#Shuffle the tiles.
print a.shuffle()
︡dd79785a-bfac-437f-9504-9e1b5b6cb37c︡{"stdout":"+--+--+--+--+\n|10|2 |6 |7 |\n+--+--+--+--+\n|8 |  |3 |13|\n+--+--+--+--+\n|1 |5 |9 |12|\n+--+--+--+--+\n|4 |14|15|11|\n+--+--+--+--+\n"}︡
︠e24ba3bd-8233-41de-8f5d-47df1d59ab49︠
#Move tiles in different direction.
︠de5b1141-4bd9-4451-9294-93197d36be85︠
print a.move_right()
︡d61a55f1-de03-4937-963d-4f83b48cc159︡{"stdout":"+--+--+--+--+\n|10|2 |6 |7 |\n+--+--+--+--+\n|  |8 |3 |13|\n+--+--+--+--+\n|1 |5 |9 |12|\n+--+--+--+--+\n|4 |14|15|11|\n+--+--+--+--+\n"}︡
︠201b1a2c-74e0-40f7-815c-84e11d44f280︠
print a.move_down()
︡624678a9-a897-4dac-b67e-7d85d13f7c00︡{"stdout":"+--+--+--+--+\n|  |2 |6 |7 |\n+--+--+--+--+\n|10|8 |3 |13|\n+--+--+--+--+\n|1 |5 |9 |12|\n+--+--+--+--+\n|4 |14|15|11|\n+--+--+--+--+\n"}︡
︠d190866b-735d-4192-a988-5c8a3aca1e0b︠
print a.move_left()
︡8f9289e0-6c7e-4685-9f42-3129efdf8ea5︡{"stdout":"+--+--+--+--+\n|2 |  |6 |7 |\n+--+--+--+--+\n|10|8 |3 |13|\n+--+--+--+--+\n|1 |5 |9 |12|\n+--+--+--+--+\n|4 |14|15|11|\n+--+--+--+--+\n"}︡
︠7a6fc561-e2cd-403a-a714-357494b6b243︠
print a.move_up()
︡21223f47-0687-4c6c-9186-2f3bf77ee6ca︡{"stdout":"+--+--+--+--+\n|2 |8 |6 |7 |\n+--+--+--+--+\n|10|  |3 |13|\n+--+--+--+--+\n|1 |5 |9 |12|\n+--+--+--+--+\n|4 |14|15|11|\n+--+--+--+--+\n"}︡
︠ebf403f8-f7bd-4ed4-8558-f1cd09b3ea13︠
#You can also check if the puzzle is solved.
a.is_solved()

︡d453e4ef-2bde-4606-8a28-b91d866929b1︡{"stdout":"'The puzzle is not solved yet. Please try again!'\n"}︡
︠8a33e10c-4949-4d1f-8db4-7b39f5847969︠
b = Puzzle(3)
print b.move_right()
print b.move_left()
print b.is_solved()
︡a5b289d5-b4ee-4926-8757-4a934c116fc7︡{"stdout":"+--+--+--+\n|1 |2 |3 |\n+--+--+--+\n|4 |5 |6 |\n+--+--+--+\n|7 |  |8 |\n+--+--+--+\n"}︡{"stdout":"+--+--+--+\n|1 |2 |3 |\n+--+--+--+\n|4 |5 |6 |\n+--+--+--+\n|7 |8 |  |\n+--+--+--+\n"}︡{"stdout":"Congratulations! You successfully solved the puzzle!\n"}︡
︠1d5cd35a-3b92-4ae9-b8fc-dfa0d7a73ef7︠
#Now try the game by yourself!










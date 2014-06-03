︠6b53d011-1b06-4076-a6b9-0cc9618ceb50︠
from sage.plot.disk import Disk
︡05c4d142-8d2c-4bfb-a99f-deb738a7838e︡
︠4fc308aa-1bc3-4edd-aff6-6ebc93073426︠
CONST_SIZE = 19
class Go:
    """
    for now I will assume size to be a 19*19 board, but leaves possibility for 13*13 boards and 9*9 boards.
    """
    # original input: The original input
    # strinput:the original string input
    # temp: the modifying version of the string
    # WhiteCap: the number of stones white had captured
    # BlackCap: the number of stones black had captured
    # position:describe the position where the board started
    # board:describe the board
    # Last_Move: describe the last move
    # count: the number of counted places on the board 
    def __init__(self,strinput):
        
        #self.size = size 
        #save for later
        self.originalinput = strinput
        temp = self.originalinput.strip() # stripping the input
        #get the the number of stones white had captured
        pos1 = temp.index('captured')
        pos2 = temp.index('pieces')
        self.WhiteCap = temp[pos1 + 9: pos2 - 1]
        #erase the previous part which is no longer needed
        temp = temp[pos2+9:]
        
        #get the the number of stones black had captured
        pos1 = temp.index('captured')
        pos2 = temp.index('pieces')
        self.BlackCap = temp[pos1 + 9: pos2 - 1]
        #erase the previous part
        temp = temp[pos2+9:]
        
        # find the last move
        pos1 = temp.index('Last move') 
        pos2 = temp.index('\n')
        self.Last_Move = temp[pos1 + 17:pos2]
        self.Player = temp[pos1 + 11 : pos1 + 16]
        # erase the previous part
        temp = temp[pos2 + 1 :]
        
        # define valid board expressions
        bset = ('.','+','O','X')
        # reset count.Why -1? because 0 based will be easier for % and // calculation
        count = -1
        #set board
        self.board = [['Unoccupied' for x in xrange(CONST_SIZE)] for x in xrange(CONST_SIZE)]
        for i in temp[:-20]: # why -20? to get rid of the 'O' in the last line, otherwise that O would count into the board
            if i in bset:
                count +=1
                Ver_cord = count % CONST_SIZE # vertical coordinate. 0 based index
                Hor_cord = CONST_SIZE - 1 - (count // CONST_SIZE) # horizontal coordinate, 0 based index. upside starts with 18 and decreases to 0
                if i == 'O':
                    self.board[Ver_cord][Hor_cord] = 'White'
                elif i == 'X':
                    self.board[Ver_cord][Hor_cord] = 'Black'
                elif i == '+':
                    self.board[Ver_cord][Hor_cord] = 'Star'
                    
    # find at a give position, accept input from A1 to T19
    def findstone(self,position):
        vertical = ord(position[0]) - ord ('A')
        if vertical == 8:
            raise IndexError('I1-I19 is not a valid index on the board')
        elif vertical > 8 :
            vertical -= 1 #It is weird that on gnugo there is no I index on the board, it comes from A to H and J to T, which is awkward but...
        
        horizontal = int(position[1:]) - 1 # remember the board list is 0 based
        try:
            return self.board[vertical][horizontal]
        except IndexError:
            raise IndexError("Please enter a valid place on board between A1 to T19, except for I1-I19")
            
    def plotboard(self):
        x = polygon([(0,0), (0,CONST_SIZE + 1), (CONST_SIZE + 1,CONST_SIZE + 1),(CONST_SIZE + 1,0)],color = '#F5DEB3',zorder = 1,axes=False)
        for i in range (1,20):
            x += line([(1,i), (CONST_SIZE, i)], color = '#000000', thickness = 0.5,zorder = 1,axes=False)
            x += line([(i,1), (i, CONST_SIZE)], color = '#000000', thickness = 0.5,zorder = 1,axes=False)
        counti,countj = 0,0
        for i in self.board:
            counti +=1
            countj = 0
            for j in i:
                countj += 1
                if (j == 'Star'):
                    x += disk((counti+0.03 ,countj-0.04 ),0.1, (0,2*pi), color = '#000000',zorder = 2,axes=False)
                elif (j == 'Black'):
                    x += disk((counti+0.03,countj-0.04),0.5, (0,2*pi), color = '#000000',zorder = 3,axes=False)
                    x += circle((counti+0.03,countj-0.04),0.5, color = '#000000',zorder = 4,axes=False, thickness = 0.2)
                elif (j == 'White'):
                    x += disk((counti+0.03,countj-0.04),0.5, (0,2*pi), color = '#FFFFFF',zorder = 3,axes=False)
                    x += circle((counti+0.03,countj-0.04),0.5, color = '#000000',zorder = 4,axes=False, thickness = 0.2)
        if self.Last_Move != 'PASS':
            vertical = ord(self.Last_Move[0]) - ord ('A')
            if vertical <= 8 :
                vertical += 1
            horizontal = int(self.Last_Move[1:])
            if self.Player == 'White':
                x += line([(vertical+0.03 - 0.354,horizontal-0.04-0.354),(vertical+0.03 + 0.354,horizontal-0.04+0.354)], color = '#000000',zorder = 3,axes=False, thickness = 0.3)
                x += line([(vertical+0.03 - 0.354,horizontal-0.04+0.354),(vertical+0.03 + 0.354,horizontal-0.04-0.354)], color = '#000000',zorder = 3,axes=False, thickness = 0.3)
            else:
                x += line([(vertical+0.03 - 0.354,horizontal-0.04-0.354),(vertical+0.03 + 0.354,horizontal-0.04+0.354)], color = '#FFFFFF',zorder = 3,axes=False, thickness = 0.6)
                x += line([(vertical+0.03 - 0.354,horizontal-0.04+0.354),(vertical+0.03 + 0.354,horizontal-0.04-0.354)], color = '#FFFFFF',zorder = 3,axes=False, thickness = 0.6)
            
        return x
    
    def printboard(self):
        for x in self.board:
            for y in x:
                if (y == 'Unoccupied') or (y == 'Star'):
                    print('. '),
                elif (y == 'Black'):
                    print('X '),
                elif y == 'White': 
                    print ('O '),

            print
︡f0995937-0f13-4893-8f65-60aadef8eed0︡
︠eb753f74-ea1b-4327-a14f-0ed51b00583c︠

︠19298ae2-a889-40f9-ae91-d4c0bfcc7e95︠
z = """
 White (O) has captured 17 pieces
    Black (X) has captured 10 pieces
 
    A B C D E F G H J K L M N O P Q R S T        Last move: White R5
 19 . . . . . O O X . . . . X . O . . . . 19
 18 O O . . O O X . . X X . . O . O X . . 18
 17 . . O O O X X . X . O O O O O X X . . 17
 16 . . . O . O X X . X O X X O X + X . . 16
 15 . O O O O O X X X . X . . X . . X . . 15
 14 . . . O . O O O O X . . . . X X . . . 14
 13 . O O O O X O X X X X . O . . . . . . 13
 12 O X O X X X X O X O . X . . . . . . . 12
 11 . . O O X X O O O X . X . . . . . . . 11
 10 . . . O X X X O O X X X X O X + . . . 10
  9 O O O . O O X O O O X O O X X . . X X  9
  8 O X X O . O X X X O O O O O X X . X O  8
  7 O O X X O O O O X O X X O O X . . X O  7
  6 X X . X O X X X X X X O O X X X X X O  6
  5 O X X . X X . . . . X O . O X O(O). O  5
  4 O O O X X . . . . X X O . O O O O O O  4
  3 O O O O O X X . X X O O . O X X X X O  3
  2 X X . O . O X . X O O . O X X . O O .  2
  1 . O . . O O X . X O . . . . . . . X O  1
    A B C D E F G H J K L M N O P Q R S T
 
"""        
︡8ca29978-ca5f-4415-939d-539b62c3a376︡
︠1e08bd6a-bea1-49c5-b7fa-48c0966d66d0︠
g = Go(z)
k = g.plotboard()
k
g.printboard()
g.findstone('K9')


︡c04f8072-866a-4f23-b605-13107f92e310︡{"once":false,"file":{"show":true,"uuid":"1514e55d-5268-440e-a101-fc7cee4cd9f0","filename":"/projects/6c4babc4-5fe9-470e-ad8e-56ee5bd3998e/.sage/temp/compute1dc2/12172/tmp_mwFnj3.png"}}︡{"stdout":".  X  O  O  O  X  O  O  O  .  .  O  .  .  .  .  .  O  . \nO  X  O  O  X  X  O  X  O  .  .  X  O  .  O  .  .  O  . \n.  .  O  O  X  .  X  X  O  .  O  O  O  .  O  .  O  .  . \n.  O  O  X  .  X  X  O  .  O  O  X  O  O  O  O  O  .  . \nO  .  O  X  X  O  O  .  O  X  X  X  O  .  O  .  O  O  . \nO  O  X  .  X  X  O  O  O  X  X  X  X  O  O  O  X  O  O \nX  X  X  .  .  X  O  X  X  X  O  X  O  O  X  X  X  X  O \n.  .  .  .  .  X  O  X  O  O  O  O  X  O  X  X  .  .  X \nX  X  X  .  .  X  X  X  O  O  O  X  X  O  X  .  X  .  . \nO  O  X  X  .  X  O  O  O  X  X  O  X  X  .  X  .  X  . \n.  O  O  X  X  X  X  O  X  X  .  .  X  .  X  O  O  X  . \n.  .  O  O  O  O  X  O  O  X  X  X  .  .  .  X  O  .  . \n.  O  .  .  .  O  O  O  O  X  .  .  O  .  .  X  O  .  X \n.  X  O  O  O  X  O  O  X  O  .  .  .  .  X  O  O  O  . \n.  X  X  O  X  X  X  X  X  X  .  .  .  X  .  X  O  .  O \n.  .  X  O  O  X  .  X  .  .  .  .  .  X  .  .  X  O  . \n.  O  X  O  O  X  .  .  .  .  .  .  .  .  X  X  X  X  . \nX  O  X  O  .  X  X  X  X  .  .  .  .  .  .  .  .  .  . \nO  .  O  O  O  O  O  O  X  .  .  .  .  .  .  .  .  .  . \n"}︡{"stdout":"'White'\n"}︡
︠0a72c057-8bf9-4a03-9ef6-d75f50720be2i︠
k = g.plotboard()
k

                  
                    
                    
                    
                
                
                










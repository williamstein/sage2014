︠845cab30-fb4c-4230-9dbe-852991a6cc18︠
CONST_SIZE = 19
class Go:
    """
    for now I will assume size to be a 19*19 board, but leaves possibility for 13*13 boards and 9*9 boards.
    """
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
        
        temp = strinput.strip() # stripping the input
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
        Player = temp[pos1 + 11 : pos1 + 16]
        # erase the previous part
        temp = temp[pos2 + 1 :]
        
        # define valid board expressions
        bset = ('.','+','O','X')
        # reset count;Why -1? because 0 based will be easier for % and // calculation
        count = -1
        #set board
        self.board = [['Empty' for x in xrange(CONST_SIZE)] for x in xrange(CONST_SIZE)]
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
    def findstone2(self,pos1,pos2):
        return self.board[pos1][pos2]
    def findstone(self,position):
        vertical = ord(position[0]) - ord ('A')
        if vertical > 8 :
            vertical -= 1 #It is weird that on gnugo there is no I index on the board, it comes from A to H and J to T, which is awkwars but...
        horizontal = int(position[1:]) - 1 # remember the board list is 0 based
        try:
            return self.board[vertical][horizontal]
        except (vertical < 0) or (vertical > 18) or (horizontal < 0) or (horizontal > 18):
            raise ValueError("Please enter a valid place on board between A1 to T19") 
            
    def printboard(self):
        for x in self.board:
            for y in x:
                if (y == 'Empty') or (y == 'Star'):
                    print('. '),
                elif (y == 'Black'):
                    print('X '),
                elif y == 'White': 
                    print ('O '),

            print
    '''        
    def plotboard(self):
        x = polygon([(0,0), (0,19), (19,19),(19,0)],color = '#F5DEB3', zorder = 0)
        for i in range (20):
            x += line([(0,i), (19, i)], color = '#000000', thickness = 0.5, zorder = 1)
            x += line([(i,0), (i, 19)], color = '#000000', thickness = 0.5, zorder = 1)
        for i in self.board:
            for j in i:
                if j == 'Star':
                    x += disk((self.board.index(i)+0.03,i.index(j)-0.04),0.1, (0,2*pi), color = '#000000',zorder = 2)
                elif j == 'Black':
                    x += disk((self.board.index(i)+0.03,i.index(j)-0.04),0.4, (0,2*pi), color = '#000000',zorder = 3)
                elif j == 'White':
                    x += disk((self.board.index(i)+0.03,i.index(j)-0.04),0.4, (0,2*pi), color = '#FF4500',zorder = 3)
                
        return x
    '''
    def plotboard(self):
        x = polygon([(0,0), (0,1), (1,1),(1,0)],color = '#F5DEB3', zorder = 0)
        for i in self.board:
            for j in i:
                if j == 'Star':
                    x += disk((self.board.index(i)+0.03,i.index(j)-0.04),0.1, (0,2*pi), color = '#000000',zorder = 2)
                elif j == 'Black':
                    print(self.board.index(i),i.index(j), 'I found one!')
                    x += disk((self.board.index(i)+0.03,i.index(j)-0.04),0.4, (0,2*pi), color = '#000000',zorder = 3)
                elif j == 'White':
                    print (self.board.index(i), i.index(j))
                    x += disk((self.board.index(i)+0.03,i.index(j)-0.04),0.4, (0,2*pi), color = '#FF4500',zorder = 3)
                
        return x

                
        
︡b91d65dc-825c-4e4c-b4ef-aa5cf79a30c6︡
︠065f1aa3-e66a-4157-808f-ba654e2b9810︠
z = """
 White (O) has captured 12 pieces
    Black (X) has captured 3 pieces
 
    A B C D E F G H J K L M N O P Q R S T        Last move: White A18
 19 X . . . X . . . . . . O . . . . . . + 19
 18(O)O . . . . . . . . . . . O X O X . . 18
 17 . . O O . . . . . . . . . O O X X . . 17
 16 . . . O . . . . . + O . . O X + X . . 16
 15 . O O O O . . . . . . . . X . . X . . 15
 14 . . . O . . . . . . . . . . X X . O . 14
 13 . O O . . . . . . . . . . . . . . . . 13
 12 O X . . . . . . . . . . . . . . . . . 12
 11 . . . . . . . . . . . . . . . . . . . 11
 10 . . . + . . . O . X . X . . . + . . . 10
  9 . . . . . . . . . . . . . . . . . . .  9
  8 . . . . . . . . . . . . . . . . . . .  8
  7 . . . . . . . . . . . . . . . . . . .  7
  6 . . . . . . . . . . . . . . . . . . .  6
  5 . . . . . . . . . . . . . . . . . . .  5
  4 . . . + . . . . . + . . . . . O . . .  4
  3 . . O . . . . . . . . . . . . . . . .  3
  2 . . . . . . . . . . . . . . . . . . .  2
  1 . . . . . . . . . . . . . . . . . . O  1
    A B C D E F G H J K L M N O P Q R S T
"""     
︡3e4da85d-ee36-4ab5-8e11-a5cab33fc96d︡
︠cdfddd92-1e4f-41ad-9b56-7c41a1efe2d4︠

︡c6a50e47-f045-4ddb-a3f3-6f9f330e5d41︡
︠70000c14-beaf-4358-a044-ec8473741071︠
g = Go(z)
g.plotboard()
print
g.printboard()

︡72c0a499-0302-4a54-af71-790afcfe3a33︡{"stdout":"(0, 11)\n(0, 11)\n(0, 18, 'I found one!')\n(1, 11, 'I found one!')\n(1, 12)\n(1, 12)\n(1, 12)\n(2, 2)\n(2, 2)\n(2, 2)\n(2, 2)\n(3, 13)\n(3, 13)\n(3, 13)\n(3, 13)\n(4, 14)\n(4, 18, 'I found one!')\n(7, 9)\n(9, 9, 'I found one!')\n(10, 15)\n(11, 9, 'I found one!')\n(11, 18)\n(13, 14, 'I found one!')\n(13, 15)\n(13, 15)\n(13, 15)\n(14, 13, 'I found one!')\n(14, 13, 'I found one!')\n(14, 16)\n(14, 13, 'I found one!')\n(15, 3)\n(15, 13, 'I found one!')\n(15, 13, 'I found one!')\n(15, 3)\n(16, 14, 'I found one!')\n(16, 14, 'I found one!')\n(16, 14, 'I found one!')\n(16, 14, 'I found one!')\n(17, 13)\n(18, 0)\n"}︡{"once":false,"file":{"show":true,"uuid":"76fd98c0-98e8-43fa-960b-d582e240f4ac","filename":"/projects/6c4babc4-5fe9-470e-ad8e-56ee5bd3998e/.sage/temp/compute1dc2/16104/tmp_syN5aU.png"}}︡{"stdout":"\n"}︡{"stdout":".  .  .  .  .  .  .  .  .  .  .  O  .  .  .  .  .  O  X \n.  .  .  .  .  .  .  .  .  .  .  X  O  .  O  .  .  O  . \n.  .  O  .  .  .  .  .  .  .  .  .  O  .  O  .  O  .  . \n.  .  .  .  .  .  .  .  .  .  .  .  .  O  O  O  O  .  . \n.  .  .  .  .  .  .  .  .  .  .  .  .  .  O  .  .  .  X \n.  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . \n.  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . \n.  .  .  .  .  .  .  .  .  O  .  .  .  .  .  .  .  .  . \n.  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . \n.  .  .  .  .  .  .  .  .  X  .  .  .  .  .  .  .  .  . \n.  .  .  .  .  .  .  .  .  .  .  .  .  .  .  O  .  .  . \n.  .  .  .  .  .  .  .  .  X  .  .  .  .  .  .  .  .  O \n.  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . \n.  .  .  .  .  .  .  .  .  .  .  .  .  .  X  O  O  O  . \n.  .  .  .  .  .  .  .  .  .  .  .  .  X  .  X  O  X  . \n.  .  .  O  .  .  .  .  .  .  .  .  .  X  .  .  X  O  . \n.  .  .  .  .  .  .  .  .  .  .  .  .  .  X  X  X  X  . \n.  .  .  .  .  .  .  .  .  .  .  .  .  O  .  .  .  .  . \nO  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . \n"}︡
︠6bed3c0f-5ed6-4a62-a12b-a25928c61d62︠
g.findstone('A18')
︡a11c00f1-bbe8-4f33-b16a-a62b331a3a98︡{"stdout":"'White'\n"}︡
︠5dfe9554-6bfc-4b2f-afd8-db845366826e︠
g.findstone2(18,0)
︡0bfe8a1f-6c3d-4e1d-a6ab-fb64c7fd3af3︡{"stdout":"'White'\n"}︡
︠f07403b3-8a14-46b0-ab6a-8fe281af4c25︠
ord('T')-ord('A')
︡ef29eb73-01c2-4cb1-a4c3-eb002174068c︡{"stdout":"19\n"}︡
︠ff03e643-a6e6-45b6-a9ba-0bcdac74b76c︠

︠369ae558-fd25-48bf-b471-266e315a0209︠
x = polygon([(0,0), (0,19), (19,19),(19,0)],color = '#F5DEB3')
y = line([(0,1), (19, 1)], color = '#000000', thickness = 0.5)
x + y

︡6873f8b7-b155-4e25-993c-0da37d5aab6b︡{"once":false,"file":{"show":true,"uuid":"d0ab0db0-102f-4db5-8c91-e22dd7843cb4","filename":"/projects/6c4babc4-5fe9-470e-ad8e-56ee5bd3998e/.sage/temp/compute1dc2/16104/tmp_Y5LAMT.png"}}︡
︠800b5931-3f38-4f6e-a484-9eddf8e81d6a︠










class FluidRender:
    def __init__(self, arrayWidth, arrayHeight, blockSize):
        """
        Initializes a canvas frame in Javascript to render on blocks on.

        INPUT:
            - ``arrayWidth`` - The number of blocks that will be used in the x direction
            - ``arrayHeight`` - The number of blocks that will be used in the y direction
            - ``blockSize`` - The size of each block

        EXAMPLES::
        fRender = FluidRender(11, 11, 10)
        """
        self._blockSize = blockSize
        self._arrayWidth = arrayWidth
        self._arrayHeight = arrayHeight
        import sage_server
        sage_server.MAX_OUTPUT_MESSAGES =arrayWidth*arrayHeight*2
        salvus.html('<canvas id="fluidCanvas" width="%s" height="%s" style="border:1px solid #c3c3c3;">Your browser does not support the HTML5 canvas tag.            </canvas>'%(arrayWidth*blockSize, arrayHeight*blockSize))
        self._baseStr = 'var c=document.getElementById("fluidCanvas");'
        self._baseStr += 'var ctx=c.getContext("2d");'
    def drawSolid(self, drawX, drawY):
        """
        Draws a gray block at position (drawX, drawY), with dimension set in __init__

        INPUT:
            - ``drawX`` - The x position to draw the blcck at
            - ``drawY`` - The y position to draw the blcck at

        EXAMPLES::
        fRender.drawSold(110, 110)
        """
        self.drawColoredSquare(drawX, drawY, self._blockSize, self._blockSize, (32, 32, 32))
    def drawVelocity(self, drawX, drawY, val):
        """
        Draws a colored block at position (drawX, drawY), with dimension set in __init__

        INPUT:
            - ``drawX`` - The x position to draw the blcck at.
            - ``drawY`` - The y position to draw the blcck at.
            - ``val`` - A value between 0 and 1 that set the color between blue and red.

        EXAMPLES::
        fRender.drawColoredSquare(110, 110, .8)
        """
        rgb = self._scaleColor(val)
        self.drawColoredSquare(drawX, drawY, self._blockSize, self._blockSize, rgb)
    def _scaleColor(self, val):
        """
        Uses an input value to so scale an appropriate color.

        INPUT:
            - ``val`` - A value between 0 and 1 that set the color between blue and red.
        OUTPUT:
            - An rgb tuple in the form {r, g, b}

        EXAMPLES::
        fRender._scaleColor(110, 110, .8)
        """
        r,g,b=(0,0,0)
        if(val<1/4):
            b=255
            g=(int)(255*4*val)
        elif(val<1/2):
            g=255
            b=int(4*255*(1/2-val))
        elif(val<3/4):
            g=255
            r=int(255*4*(val-1/2))
        else:
            r=255
            g=int(4*255*(1-val))
            if(g>255):
                g=255
        return (r,g,b)
    def drawColoredSquare(self, drawX, drawY, width, height, rgb):
        """
        Draws a gray block at position (drawX, drawY), with dimension set in __init__

        INPUT:
            - ``drawX`` - The x position to draw the blcck at.
            - ``drawY`` - The y position to draw the blcck at.
            - ``val`` - A value between 0 and 1 that set the color between blue and red.

        EXAMPLES::
        fRender.drawColoredSquare(110, 110, .8)
        """
        jStr = self._baseStr+'ctx.fillStyle=\"rgb(%s,%s,%s)\";'%rgb
        jStr += 'ctx.fillRect(%s,%s,%s,%s)'%(drawX, drawY, width, height)
        salvus.javascript(jStr)
    def clearCanvas(self):
        width = (self._arrayWidth+1)*self._blockSize
        height = (self._arrayHeight+1)*self._blockSize
        self.drawColoredSquare(0,0,width, height, (255,255,255))
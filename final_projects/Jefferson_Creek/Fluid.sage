class Fluid:
    def __init__(self, arrayWidth, arrayHeight, blockSize, scalingConstant):
        """
        Initializes a fluid field by setting up fluid blocks and a canvas to draw to. Also initiaializes the velocites in the x and y directions between blocks.

        INPUT:
            - ``arrayWidth`` - The number of blocks that will be used in the x direction
            - ``arrayHeight`` - The number of blocks that will be used in the y direction
            - ``blockSize`` - The size of each block
            - ``scalingConstant`` - A value to help correct scaling errors in the new velocity calculations. Change this if the values aren't converging.

        EXAMPLES::
        flu = Fluid(20, 20, 10, 1)
        """
        self._blockSize = blockSize
        self._arrayWidth = arrayWidth
        self._arrayHeight = arrayHeight
        self._scalingConstant = scalingConstant
        self.initialConditions()
        self.createInteract()
        load("FluidRender.sage")
        self._fRender = FluidRender(arrayWidth+1, arrayHeight+1, blockSize)
        self._rho=1
        self._dt =1
    def initialConditions(self):
        """
        Other initial conditions, such as solid blocks or velocities.

        EXAMPLES::
        flu.initialConditions()
        """
        #Initialize the Block Type.
        self._cellType = self.generateArray(self._arrayWidth, self._arrayHeight, 1)
        #Adds in solid blocks on the outside of the Canvas.
        for j in [0, self._arrayHeight-1]:
            for i in range(self._arrayWidth):
                self.changeCellType(i, j, 'SOLID')
        for i in [0, self._arrayWidth-1]:
            for j in range(self._arrayHeight-1):
                self.changeCellType(i, j, 'SOLID')
        #Initialize and pressures
        self._pressure = self.generateArray(self._arrayWidth, self._arrayHeight, 0)
        #Initialze u = x component of velocity, with values located between/surrounding the pressure nodes in the x direction.
        self._u = self.generateArray(self._arrayWidth+1, self._arrayHeight, 0)
        #Initialize v = y component of velocity, with values located between/surrounding the pressure nodes in the y direction.
        self._v = self.generateArray(self._arrayWidth, self._arrayHeight+1, 0)
        #Adds in non-zero velocities.
        middle = int((self._arrayWidth+1)/2)
        amountToLeft = int(self._arrayWidth+1)/6
        for i in range(middle-amountToLeft, middle+amountToLeft+1):
            self._u[self._arrayHeight-2][i] =4

    def generateArray(self, width, height, value):
        """
        Outputs an entire array set to value.

        INPUT:
            - ``width`` - The width of the array.
            - ``height`` - The nheight of the array.
            - ``value`` - The value that each point in the array is set to.

        EXAMPLES::
        flu.generateArray(10, 10, 0)
        """
        ans = []
        for j in range(height):
            temp = []
            for i in range(width):
                temp.append(value)
            ans.append(temp)
        return ans
    def update(self):
        """
        Calculates the new velocites according to the Navier-Stokes equations. Uses aDiagnol() and rhs().

        EXAMPLES::
        flu.update()
        """
        ad = matrix(QQ, self.aDiaganol())+.1
        ar = matrix(QQ, self.rhs())
        #Calculates the intermediate pressure.
        tPressure = ad.inverse()*ar
        scale = self._scalingConstant*self._dt*(self._arrayWidth)^(.71)/(self._blockSize)
        #Updates the velocities.
        for j in range(self._arrayHeight):
            for i in range(self._arrayWidth):
                if(self.getCellType(i, j)=='FLUID'):
                    self._u[j][i] -=scale*tPressure[j][i]
                    self._u[j][i+1] +=scale*tPressure[j][i]
                    self._v[j][i] -=scale*tPressure[j][i]
                    self._v[j+1][i] +=scale*tPressure[j][i]
        for j in range(self._arrayHeight):
            for i in range(self._arrayWidth):
                if(self.getCellType(i, j)=='SOLID'):
                    self._u[j][i] = 0
                    self._u[j][i+1] = 0
                    self._v[j][i] = 0
                    self._v[j+1][i] = 0
                    self._u[j][i] *= .995
                    self._v[j][i] = .995
    def createInteract(self):
        """
        Generates a control panel that is used to effect the fluid field.

        EXAMPLES::
        flu.createInteract()
        """
        @interact
        def _(Control_Panel=['Velocity/Block', 'Horizontal Velocity', 'Vertical Velocity', 'Update', 'Update x10', 'Update x100']):
            if(Control_Panel=='Render'):
                self.render('r')
            elif(Control_Panel=='Horizontal Velocity'):
                #Only renders velocities in the x direction.
                self.render('u')
            elif(Control_Panel=='Vertical Velocity'):
                #Only renders velocites in the y direction.
                self.render('v')
            elif(Control_Panel=='Velocity/Block'):
                #Renders based upon the maximum velocity for a block.
                self.render('a')
            elif(Control_Panel=='Update'):
                #Updates the velocity, and then renders it.
                self.update()
                self.render('update')
            elif(Control_Panel=='Update x10'):
                #Updates the velocity 10 times, the renders it.
                for i in range(10):
                    self.update()
                self.render('update')
            elif(Control_Panel=='Update x100'):
                #Updates the velocity 100 times, then renders it.
                for i in range(100):
                    self.update()
                self.render('update')
    def render(self, renderType):
        """
        Draws all the code onto the canvas, depending on the render type specified

        INPUT:
            - ``renderType`` - Can be equal to 'update', 'u', 'v', 'a'.
                'u' - Renders velocities in the x direction.
                'v' - Renders velocities in the y direction.
                'a' - Renders all velocities.
                'update' - Calls the previously used render code if the velocities have just been updated.

        EXAMPLES::
        flu.render('update')

        flu.render('a')
        """
        self._fRender.clearCanvas()
        #Finds the maximum velocity that is currently present.
        maxVel = self._findMaxAvgVelocity()
        #Calls the previously used render code if the velocities have just been updated.
        if(renderType=='update'):
            cRenderType  = self._lastRenderType
        else :
            cRenderType = renderType
            self._lastRenderType = renderType
        print 'Max Average Velocity: %s'%maxVel
        if(cRenderType=='u'):
            #Only renders velocities in the x direction.
            for j in range(self._arrayHeight):
                for i in range(self._arrayWidth+1):
                    drawY =(self._arrayHeight-j)*self._blockSize
                    drawX = i*self._blockSize
                    self._fRender.drawVelocity(drawX, drawY, .5+self._u[j][i]/(2*maxVel))
        elif(cRenderType=='v'):
            #Only renders velocities in the y direction.
            for j in range(self._arrayHeight+1):
                for i in range(self._arrayWidth):
                    drawY =(self._arrayHeight-j)*self._blockSize
                    drawX = i*self._blockSize
                    self._fRender.drawVelocity(drawX, drawY, .5+self._v[j][i]/(2*maxVel))
        elif(cRenderType=='a'):
            #Renders the maximum velocity in any direction.
            for j in range(self._arrayHeight):
                for i in range(self._arrayWidth):
                    drawY =(self._arrayHeight-j)*self._blockSize
                    drawX = i*self._blockSize
                    if(self.getCellType(i, j)=='SOLID'):
                        self._fRender.drawSolid(drawX, drawY)
                    else :
                        val = (((self._u[j][i]+self._u[j][i+1])/2)^2+((self._v[j][i]+self._v[j+1][i])/2)^2)^.5
                        self._fRender.drawVelocity(drawX, drawY, val/maxVel)
    def _findMaxAvgVelocity(self):
        """
        Finds the maxiumum average velocity.

        OUTPUT:
            - Returns the maximum averaged velocity for a whole cell, in x and y directions.

        EXAMPLES::
        flu._findMaxAvgVelocity()
        """
        maxVel=0
        for j in range(self._arrayHeight):
            for i in range(self._arrayWidth):
                vel = (((self._u[j][i]+self._u[j][i+1])/2)^2+((self._v[j][i]+self._v[j+1][i])/2)^2)^.5
                if(vel>maxVel):
                    maxVel = vel
        if(maxVel==0):
            maxVel=1
        return maxVel
    def u(self, i, j):
        """
        Find the velocity in the x direction along the edge (i, j)

        INPUT:
            - ``i`` - The i column.
            - ``j`` - The jth row.

        OUTPUT:
            -The velocity in the x direction along the edge specified by (i, j)

        EXAMPLES::
        flu.u(5, 5)
        """
        return self._u[j][i]
    def v(self, i, j):
        """
        Find the velocity in the y direction along the edge (i, j)

        INPUT:
            - ``i`` - The i column.
            - ``j`` - The jth row.

        OUTPUT:
            -The velocity in the y direction along the edge specified by (i, j)

        EXAMPLES::
        flu.v(5, 5)
        """
        return self._v[j][i]

    def changeCellType(self, i, j, newCellType): #-1 is empty, 0 is solid, 1 is fluid, 2 other
        """
        Changes the type of cell at the (i, j) location, to newCellType.

        INPUT:
            - ``i`` - The i column.
            - ``j`` - The jth row.
            - ``newCellType`` - The new type for the cell, 'SOLID' or 'FLUID'.

        EXAMPLES::
        flu.changeCellType(5, 5, 'SOLID')
        """
        if(newCellType == 'SOLID'):
            self._cellType[j][i] = 0
        elif(newCellType == 'FLUID'):
            self._cellType[j][i] = 1
        else :
            self._cellType[j][i] =-1
    def getCellType(self, i, j):
        """
        Find the sell type at position (i, j). Assumes that outside the gird/array is empty.

        INPUT:
            - ``i`` - The i column.
            - ``j`` - The jth row.

        OUTPUT:
            -The type of cell at (i, j): 'EMPTY', 'SOLID', or 'FLUID'.

        EXAMPLES::
        flu.getCellType(5, 5)
        """
        if(i>=0 and j>=0 and i <self._arrayWidth and j<self._arrayHeight):
            if(self._cellType[j][i]==1):
                return 'FLUID'
            elif(self._cellType[j][i]==0):
                return 'SOLID'
            else :
                return 'EMPTY'
        else:
            return 'EMPTY'
    def rhs(self):
        """
        Find the right hand side (rhs) of the linear equations used in render(). Assumes all solids are stationary.

        OUTPUT:
            -An array, with dimensions self._arrayWidth and self._arrayHeight, based upon the difference in velocities between cells.

        EXAMPLES::
        flu.rhs(5, 5)
        """
        scale = 1/self._blockSize
        rhs = self.generateArray(self._arrayWidth, self._arrayHeight, 0)
        for j in range(self._arrayHeight):
            for i in range(self._arrayWidth):
                if(self.getCellType(i, j) == 'FLUID'):
                    val = -1*scale*(self.u(i+1, j)-self.u(i,j)+self.v(i, j+1)-self.v(i,j))
                    if(self.getCellType(i-1, j) == 'SOLID'):
                        val -= scale * self.u(i,j);
                    if(self.getCellType(i+1, j) == 'SOLID'):
                        val += scale * self.u(i+1,j);
                    if(self.getCellType(i, j-1) == 'SOLID'):
                        val -= scale * self.v(i,j);
                    if(self.getCellType(i, j+1) == 'SOLID'):
                        val += scale * self.v(i,j+1);
                    rhs[j][i] = val
        return rhs
    def aDiaganol(self):
        """
        Find the left hand side (diaganols) of the linear equations used in render().

        OUTPUT:
            -An array, with dimensions self._arrayWidth and self._arrayHeight, based upon the difference in materials of the cells.

        EXAMPLES::
        flu.aDiaganol(5, 5)
        """
        scale = self._dt/(self._rho*self._blockSize)
        aDiag=self.generateArray(self._arrayWidth, self._arrayHeight, 0)
        for j in range(self._arrayHeight):
            for i in range(self._arrayWidth): 
                if(self.getCellType(i,j)=='FLUID'):
                    if(self.getCellType(i+1,j)=='FLUID'):
                        aDiag[j][i] += scale;
                        aDiag[j][i+1] += scale;
                    elif(self.getCellType(i+1,j)=='EMPTY'):
                        aDiag[j][i] += scale;
                    if(self.getCellType(i,j+1)=='FLUID'):
                        aDiag[j][i] += scale;
                        aDiag[j+1][i] += scale;
                    elif(self.getCellType(i,j+1)=='EMPTY'):
                        aDiag[j][i] += scale;
        return aDiag


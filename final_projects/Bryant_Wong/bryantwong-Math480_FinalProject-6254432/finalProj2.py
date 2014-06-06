import numpy as np
import wave
import cmath
import matplotlib.pyplot as plt
import math
import os
from Tkinter import *
import tkFileDialog
import ntpath

input_file = None
fund_frequency = None

class Application(Frame):
    def say_hi(self):
        print "hi there, everyone!"

    def createWidgets(self):
        self.QUIT = Button(self)
        self.QUIT["text"] = "Start!"
        self.QUIT["fg"]   = "red"
        self.QUIT["command"] =  self.quit

        self.QUIT.pack({"side": "right"})

        self.hi_there = Button(self)
        self.hi_there["text"] = "Choose a file",
        self.hi_there["command"] = self.onOpen

        self.hi_there.pack({"side": "right"})

        self.choose = Button(self)
        self.choose["text"] = "Choose a frequncy(default is 440)"
        self.choose["command"] = self.freq
        self.choose.pack(fill=BOTH, expand = 1)

    def onOpen(self):
        ftypes = [('Python files', '*.py'), ('All files', '*')]
        dlg = tkFileDialog.Open(self, filetypes = ftypes)
        fl = dlg.show()
        global input_file
        input_file = fl
        self.hi_there["text"] = ntpath.basename(fl)
    def freq(self):
        self.frequency = Entry(self)
        self.frequency.pack(side = BOTTOM)
        self.choose["text"] = "Use this frequency"
        self.choose["command"] = self.getf
        
    def getf(self):
        global fund_frequency
        fund_frequency = self.frequency.get()

    def __init__(self, master=None, background="white"):
        Frame.__init__(self, master, background="white")
        self.pack()
        self.createWidgets()

root = Tk()
app = Application(root)
root.geometry("300x150+300+300")
fl = app.mainloop()
root.destroy()
print input_file
 
def save(path, ext='png', close=True, verbose=True):
    """Save a figure from pyplot.
 
    Parameters
    ----------
    path : string
        The path (and filename, without the extension) to save the
        figure to.
 
    ext : string (default='png')
        The file extension. This must be supported by the active
        matplotlib backend (see matplotlib.backends module).  Most
        backends support 'png', 'pdf', 'ps', 'eps', and 'svg'.
 
    close : boolean (default=True)
        Whether to close the figure after saving.  If you want to save
        the figure multiple times (e.g., to multiple formats), you
        should NOT close it in between saves or you will have to
        re-plot it.
 
    verbose : boolean (default=True)
        Whether to print information about when and where the image
        has been saved.
 
    """
    
    # Extract the directory and filename from the given path
    directory = os.path.split(path)[0]
    filename = "%s.%s" % (os.path.split(path)[1], ext)
    if directory == '':
        directory = '.'
 
    # If the directory does not exist, create it
    if not os.path.exists(directory):
        os.makedirs(directory)
 
    # The final path to save to
    savepath = os.path.join(directory, filename)
 
    if verbose:
        print("Saving figure to '%s'..." % savepath),
 
    # Actually save the figure
    plt.savefig(savepath)
    
    # Close it
    if close:
        plt.close()
 
    if verbose:
        print("Done")

# function to get wave to array data
def wavToArray(fileName):
    """Convert wav file to array of amplitude
    Parameter
    ---------
    fileName : String
        The input wav file to read in
        require to be mono 
    Return
    ------
    an array of float that represents the amplitude 
    of each frame from the given file
    """
    reader = wave.open(fileName,'rb')
    nchannels, sampwidth, framerate, nframes, comptype, compname = reader.getparams()[:6]
    # assume chanel is 1
    time = framerate/nframes  #number of seconds in the file
    frame_list = []
    frame_list = np.fromstring(reader.readframes(nframes), dtype = np.int16)
    reader.close()
    frame_list = frame_list.astype(np.float)
    return frame_list

# Breaking up into roots of unity
def omega(p, q):
   return cmath.exp((2.0 * cmath.pi * 1j * q) / p)

def padding(signal):
    for x in range(65536-len(signal)):
      signal.append(0)
    return signal
def noise_cancelling(test, fund_freq):
    freq = int(fund_freq * 2 * math.pi)
    pure_result = {}
    for i in range(1,4):
        Max = 0
        for j in range(freq-10 , freq+10):
            data = test[j]
            Max = max(data, Max)
        pure_result[i*freq] = Max
    return pure_result
# The actual function
def fft(signal):
    """ This is the actual FFT function
    Parameter
    ---------
    An array of amplitude with certain length
    the array holds amplitude of each frame
    require: the length of array is 2^n 
   	
    Return
    ------
    a list of amplitude after fft
    """
    n = len(signal)
    
   # if the input is only one then we can't really do a fft can we BITCHES
    
    if n == 1:
        return signal
    
    else:
      # breaking up into odd and even pieces
        F_even = fft([signal[i] for i in xrange(0, n, 2)])
        F_odd = fft([signal[i] for i in xrange(1, n, 2)])
        
      # defining new empty array with n entries
        combined = [0] * n
      
      # implementation of the alg lmao idk whats going on FUCK
        for m in xrange(n/2):
            combined[m] = F_even[m] + omega(n, -m) * F_odd[m]
            combined[m + n/2] = F_even[m] - omega(n, -m) * F_odd[m]
 
        return combined
   
#how to run the program     
b = wavToArray(input_file).tolist()
b = padding(b)
test2 = fft(b)
test = [0]*10000
# need to only work with the magnitude - throw way phase. Also rounding in this example due to some random noise that all goes to 0
for i in range(65536):
    test2[i] = round(abs(test2[i]))
ic = [x*math.pi for x in range(10000)]
for i in range(10000):
	test[i] = test2[i]
print(noise_cancelling(test,440))
#for i in range(len(ic)):
    #if test[i] >= 10**7:
       # print ic[i]
print fund_frequency
plt.plot(ic, test)
save("signal", ext="png", close=False, verbose=True)

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
output_file = None

class Application(Frame):


    def createWidgets(self):
        self.input = Label(self,text="Input File")
        self.input.grid(row=0,column=0)
        self.inputbox = Entry(self)
        self.inputbox.grid(row=0, column=1)
        self.inputbutton = Button(self)
        self.inputbutton.grid(row=0,column=2)
        self.inputbutton["command"] = self.onOpen
        self.inputbutton["text"]="choose"
        self.freq = Label(self,text="Frequency")
        self.freq.grid(row=1,column = 0)
        self.freqbox = Entry(self)
        self.freqbox.grid(row=1,column=1)
        self.frequnit = Label(self, text = "kHz")
        self.frequnit.grid(row=1, column=2)
        #self.freqchoose = Button(self,text="Use it")
        #self.freqchoose.grid(row=1, column =2)
        #self.freqchoose["command"] = self.getf
        self.outdir = Label(self,text="Output location")
        self.outdir.grid(row=2, column=0)
        self.outdir_box = Entry(self)
        self.outdir_box.grid(row=2, column=1)
        self.outdir_button = Button(self,command = self.choose_dir, text ="choose")
        self.outdir_button.grid(row=2,column=2)
        self.outname = Label(self,text="Output filename")
        self.outname.grid(row=3,column=0)
        self.outname_box = Entry(self)
        self.outname_box.grid(row=3, column=1)
        self.outname_form = Label(self,text = ".png")
        self.outname_form.grid(row=3,column =2)
        self.save = Button(self,comman = self.save, text = "save")
        self.save.grid(row=4, column=0)
        self.start = Button(self, command = self.quit, text = "Start!")
        
    def choose_dir(self):
        dir_0 = tkFileDialog.askdirectory()
        self.outdir_box.delete(0,END)
        self.outdir_box.insert(0,dir_0)
        
    def onOpen(self):
        ftypes = [('Sound files', '*.wav'), ('All files', '*')]
        dlg = tkFileDialog.Open(self, filetypes = ftypes)
        fl = dlg.show()
        self.inputbox.delete(0,END)
        self.inputbox.insert(0, fl)
        
    def save(self):
        global input_file
        input_file = self.inputbox.get()
        global fund_frequency
        fund_frequency = self.freqbox.get()
        global output_file
        output_file = self.outdir_box.get() + '\\' + self.outname_box.get()
        self.start.grid(row=4, column=1)
        
    def getf(self):
        global fund_frequency
        fund_frequency = self.frequency.get()

    def __init__(self, master=None):
        Frame.__init__(self, master)
        self.grid()
        self.createWidgets()

'''class ShowImage(Frame):
    def __init__(self,master=None):
        Frame.__init__(self,master)
        self.grid()
        self.showImage()
    def showImage(self):
        fileName = output_file + '.png'
        im = Image.open(fileName).convert2byte()
        tkimage = ImageTk.PhotoImage(im)
        self.image = Label(self,image=tkimage)
        self.image.grid()
'''
    
root = Tk()
app = Application(root)
root.geometry("300x300+200+200")
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
    reader = wave.open(fileName, 'rb')
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
save(output_file, ext="png", close=False, verbose=True)
'''root = Tk()
img = ShowImage(root)
root.geometry("300x300+200+200")
fl = img.mainloop()
root.destroy()'''

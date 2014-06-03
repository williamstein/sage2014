
from PIL import ImageTk
import PIL.Image
import wave
import cmath
import matplotlib.pyplot as plt
import math
import os
from Tkinter import *
import tkFileDialog
import ntpath
import tkFont
import tkMessageBox
import sys

from finalProj import wavToArray, fft, save, padding, noise_cancelling

fields = ('frequency', 'input_name', 'output_name', 'dest')
entries = {}
input_name = " "
output_name = " "
frequency = 0
dest = " " 


def get_input(entries):
   """
   get the user input and store it into global variable
   """
   global frequency
   # get frequency:
   frequency = float(entries['frequency'].get())
   global output_name
   output_name = entries['output_name'].get()
   global dest
   dest = entries['dest'].get()

def makeform(root, fields):
   """
   create the log window to get user input of
   frequency, input file and output file name 
   """
   for field in fields:
      row = Frame(root)
      lab = Label(row, width=22, text=field+": ", anchor='w')
      ent = Entry(row)
      row.pack(side=TOP, fill=X, padx=5, pady=5)
      lab.pack(side=LEFT)
      ent.pack(side=RIGHT, expand=YES, fill=X)
      entries[field] = ent

   entries['frequency'].insert(0, "440")
   entries['input_name'].insert(0, "*.wav")
   entries['output_name'].insert(0, "**")
   entries['dest'].insert(0, "by default save to the same directory of the software")

   
   return entries

def run():
   """ 
   run the main program and save the output graph 
   """
   get_input(entries)
   try:
      b = wavToArray(input_name).tolist()
   except IOError as e:
      print_error("I/O error({0}): {1}".format(e.errno, e.strerror))
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
   print frequency
   plt.plot(ic, test)
   if dest != 'by default save to the same directory of the software':
      save(dest+output_name, ext="png", close=False, verbose=True)
   else:
      save(output_name, ext="png", close=False, verbose=True)
   call_back()
   w.pack()

def onOpen():
      """ open the file with given file name
      """
      ftypes = [('wav files', '*.wav'), ('All files', '*')]
      dlg = tkFileDialog.Open(root, filetypes = ftypes)
      fl = dlg.show()
      global input_file
      input_file = fl
      global input_name
      input_name=ntpath.basename(fl)
      entries['input_name'].delete(0, END)
      entries['input_name'].insert(0, input_name)
def call_back():
    a = dest if dest != 'by default save to the same directory of the software' else os.getcwd()
    tkMessageBox.showinfo( "result", "Saved file to " + a)
def print_error(message):
    tkMessageBox.showinfo( "error", message)

if __name__ == '__main__':
   root = Tk()
   root.title("FFT ")
   root.geometry("600x650+300+300")
   root.minsize(800, 650)
   ents = makeform(root, fields)
   
   root.bind('<Return>', (lambda event, e=ents: fetch(e)))   
   b1 = Button(root, text="choose input file", command=onOpen)
   b1.pack(side=TOP, anchor = N, padx=5, pady=5)
   b2 = Button(root, text='start',
          command=run)
   b2.pack(side=TOP, anchor = N, padx=5, pady=5)
   b3 = Button(root, text='Quit', command=root.quit)
   b3.pack(side=TOP, anchor = N, padx=5, pady=5)
   
   imgFile = 'signal.png'
   image = PIL.Image.open(imgFile)
   image = image = image.resize((600, 400), PIL.Image.ANTIALIAS)
   image1 = ImageTk.PhotoImage(image)
   panel = Label(root, image = image1)
   #panel.place(x=0, y=0, relwidth=1, relheight=1)
   panel.pack()
   w = Label(root, text="output image", pady=10)
   w.pack()

   root.mainloop()

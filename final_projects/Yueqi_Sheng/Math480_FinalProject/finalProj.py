import numpy as np
import wave
import cmath
import matplotlib.pyplot as plt
import math
import os
import sys



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

# Since FFT requires 2^n samples, we pad the raw data list with zeroes to get to 2^n
def padding(signal):
    for x in range(65536-len(signal)):
      signal.append(0)
    return signal

# The actual FFT function function
def fft(signal):
   '''
    //    //    ////    //      ////
     // //    //  //   //     //  //
      //     //  //   //     //  //
     //      ////    /////   ////
   `'''
   n = len(signal)
    
   # if the input is only one sample then we can't really do a fft 
    
   if n == 1:
      return signal
    
   else:
      # breaking up into odd and even pieces
      F_even = fft([signal[i] for i in xrange(0, n, 2)])
      F_odd = fft([signal[i] for i in xrange(1, n, 2)])
        
      # defining new empty array with n entries
      combined = [0] * n
      
      # implementation of the alg (using roots of unity)
      for m in xrange(n/2):
         combined[m] = F_even[m] + omega(n, -m) * F_odd[m]
         combined[m + n/2] = F_even[m] - omega(n, -m) * F_odd[m]
 
      return combined

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
   

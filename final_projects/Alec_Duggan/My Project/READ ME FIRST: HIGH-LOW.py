#THE PURPOSE OF THIS CODE IS TO CONSTRUCT A HIGH AND LOW PASS FILTER-
#IN PYTHON AND TO APPLY IT TO AUDIO FILES FOR ANALYSIS.
#I DO THIS USING FOURIER TRANSFORMS AND NUMEROUS SCIPY AND NUMPY FUNCTIONS.
#THE COMMENTS BELOW INCLUDE INSTRUCTIONS ON HOW TO EDIT THIS CODE FOR PERSONAL USE AND EXPERIMENTATION. 
#IN THE FINAL PROJECT FOLDER THERE ARE ALSO .WAV FILES OF AUDIO THAT HAS BEEN PROCESSED-
#AND GRAPHS THAT ACCOMPANY EACH AUDIO CLIP.
#THE FIRST AUDIO CLIP IS OF RATATAT'S "Loud Pipes." THE ORIGINAL AUDIO IS CALLED LOUDP.wav, AND THE HIGH/LOW PASS OPTIONS ARE NAMED LOUDP-HIGH AND LOUDP-LOW RESPECTIVELY
#THERE IS ALSO A CORRESPONDING GRAPH TO GO WITH EACH AUDIO CLIP, AND EACH GRAPH IS NAMED SIMILARLY TO THE AUDIO SO IT CAN BE FOUND EASILY FOR COMPARISON
#THE SECOND AUDIO CLIP IS OF BILLY JOEL's "For the Longest Time" AND HAS SIMILAR FILES 

#IN TERMS OF OPENING EACH AUDIO FILE SUCCESSFULLY, FIRST CLICK THE GREY BUTTON ON THE LEFTSIDE OF EACH FILE AND THEN PRESS THE GREEN DOWNLOAD BUTTON. 
#SAGEMATHCLOUD WILL AUTOMATICALLY PLAY THE AUDIO FILE IN THE BROWSER AFTER DOWNLOADING (I HAVE NOT FOUND A WAY TO PAUSE/STOP IT, ALTHOUGHT EACH CLIP IS ONLY 30 SECONDS)

#FOR VIEWING THE GRAPHS OF EACH AUDIO EXAMPLE, SAGEMATHCLOUD SHOULD DISPLAY THEM WITHOUT NEEDING TO DOWNLOAD, BUT I HAVE RUN INTO SOME ERRORS WHERE THE GRAPHS WILL NOT LOAD BUT DOWNLOADING THEM DISPLAYS THEM CORRECTLY.




from __future__ import division
import scikits.audiolab as audio
import scipy
import numpy as np
import matplotlib.pyplot as plt

#SHORT-TIME FOURIER TRANSFORM
def stft(input_data, sample_rate, window_size, hop_size):
    window = scipy.hamming(window_size)
    output = scipy.array([scipy.fft(window*input_data[i:i+window_size]) 
                         for i in range(0, len(input_data)-window_size, hop_size)])
    return output

#INVERSE
def istft(input_data, sample_rate, window_size, hop_size, total_time):
    output = scipy.zeros(total_time*sample_rate)
    for n,i in enumerate(range(0, len(output)-window_size, hop_size)):
        output[i:i+window_size] += scipy.real(scipy.ifft(input_data[n]))
    return output

#LOW PASS FILTER
def low_pass_filter(max_freq, window_size, sample_rate):
    fft_bin_width = sample_rate / window_size
    max_freq_bin = max_freq / fft_bin_width
    filter_block = np.ones(window_size)
    filter_block[max_freq_bin:(window_size-max_freq_bin)] = 0
    return filter_block

#HIGH PASS FILTER
def high_pass_filter(min_freq, window_size, sample_rate):
    return np.ones(window_size) - low_pass_filter(min_freq, window_size, sample_rate)

def write_audio_file(filename, filedata, sample_rate):
    output_file = audio.Sndfile(filename, 'w', audio.Format('wav'), 1, sample_rate)
    output_file.write_frames(filedata)
    output_file.close() 

def filter_audio(input_signal, sample_rate, filter_window, window_size=256):
    # Setting parameters
    hop_size = window_size // 2
    total_time = len(input_signal) / sample_rate
    
    # Do actual filtering
    stft_output = stft(input_signal, sample_rate, window_size, hop_size)
    filtered_result = [original * filter_window for original in stft_output]
    resynth = istft(filtered_result, sample_rate, window_size, hop_size, total_time)
    
    return resynth


#Audio file input name and corresponding output filenames
#USERS CAN INPUT AND OF THEIR OWN AUDIO FILES FOR THE INFILE BUT THEY MUST BE 2-channel .WAV FILES
infile = "BJL.wav"
outfile = "BJL-high.wav"
outfile1 = "BJL-low.wav"
window_size = 256

# Input
(input_signal, sample_rate, bits) = audio.wavread(infile)

# Create filter window
#CHANGING THE NUMERICAL ENTRY OF THE FUNCTION CHANGES THE INTENSITY OF THE FILTER
filter_window = high_pass_filter(3500, window_size, sample_rate)
filter_window1 = low_pass_filter(1700, window_size, sample_rate)

# Run filter
resynth = filter_audio(input_signal, sample_rate, filter_window, window_size)
resynth1 = filter_audio(input_signal, sample_rate, filter_window1, window_size)

# Output
write_audio_file(outfile, resynth, sample_rate) 
write_audio_file(outfile1, resynth1, sample_rate)

#Creates plot of original signal
plt.plot(input_signal)
plt.savefig("BJL.png")
plt.show()  

#Creates plot of the highpass signal
plt.plot(resynth)
plt.savefig("BJL-high.png")
plt.show()

#Creates plot of lowpass signal
plt.plot(resynth1)
plt.savefig("BJL-low.png")
plt.show()

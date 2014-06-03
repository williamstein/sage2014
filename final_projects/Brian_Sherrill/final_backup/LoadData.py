__author__ = 'brian'
import os
import numpy as np
import cv2
import string
import random
class GetData:
    def __init__(self, d = "./training", sampleStart = 1, sampleEnd = 62, numInSample = 55):

        """
        d is string of dir of directory containing training
        training data must be rigidly formated as Sample001 = samples of 0, Sample002 is
        samples of 1s. See string Letters for corresponding letters to number
        """
        self.d = d
        self.letters="!0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"#Letter
        ListOfListOfImages = [] #List[i] is list of Letter I in Letters
        for i in xrange(sampleStart, sampleEnd + 1):
            num = str(i)
            if len(num) == 1:
                num = "00"+num
            elif len(num) == 2:
                num = "0" + num
            dir_i = d+"/Sample" + num
            #ListOfImages = []#for testing
            ListOfImages = [self.NormalizeImage(cv2.imread(dir_i + "/" + j, 0)) for j in os.listdir(dir_i)]
            """ # for testing
            for j in os.listdir(dir_i):
                print dir_i + "/" + j
                print self.NormalizeImage(cv2.imread(dir_i + "/" + j, 0))
            """
            ListOfListOfImages.append(ListOfImages)
            print "Sample" + str(i) + " normalized and loaded"
        self.ListOfListOfImages = ListOfListOfImages
        print "Load complete"
    def NormalizeImage(self, image):
        """
        turns whites to blacks and Normalizes pictures to 8x8 or 16x16 (im still debating)
        """
        image = cv2.resize(image, (128, 128))
        image = self.InvertImage(image)
        colSum = np.sum(image, axis = 0) #columns
        rowSum = np.sum(image, axis = 1) #rows
        sumTot = np.sum(colSum)
        tolerance = .005 #percent tolerance
        colStart, colEnd = self.BegginingEndIndex2(colSum, tolerance)
        rowStart, rowEnd = self.BegginingEndIndex2(rowSum, tolerance)
        #Dump normalized images into ./dump/
        #randName = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(10))
        #cv2.imwrite("./dump/"+randName+".jpg", cv2.resize(image[rowStart : rowEnd+1, colStart : colEnd+1], (16, 16)))
        return cv2.resize(image[rowStart : rowEnd+1, colStart : colEnd+1], (16, 16)) #+1 to end because slicing is [inclusive, exclusive]

    def InvertImage(self, image):
        allWhite = np.ndarray(shape = image.shape, dtype=np.uint8)
        allWhite[:] = np.uint8(255)
        return cv2.subtract(allWhite, image)

    def BegginingEndIndex2(self, array, tolerance):
        """
        tolerance is contained in (0,1) % of totalTot
        """
        toleranceNum = np.sum(array)*tolerance
        begin = 0
        end = array.size - 1 #zero based indexing
        for i in xrange(array.size):
            if array[i] > toleranceNum:
                begin = i
                break
        i = end
        while(i >= 0 ):
            if array[i] > tolerance:
                end = i
                break
            i = i-1

        return (begin, end)

    def GetListImgs(self):
        return self.ListOfListOfImages

    def GetLetters(self):
        """
        returns Letters where Letters[i] is the ith letter in sample. i = 1 => 0, i= 2 => 1. i=0 Is not valid
        """
        return self.letters

    def GetAveraged(self):
        averagedImages = []
        for j in self.ListOfListOfImages:
            toAverage = np.zeros(shape = (16, 16), dtype=np.float_)
            for i in j:
                toAverage = toAverage + i
            average = toAverage / len(j)
            averagedImages.append(average.astype(np.uint8))
        return averagedImages
"""
    def DisplayImages(self, thing):
        if isinstance(thing, list):
            for i in thing:
                cv2.imshow('image',i)
                cv2.waitKey(0)
                cv2.destroyAllWindows()
        else:
            cv2.imshow('image',thing)
            cv2.waitKey(0)
            cv2.destroyAllWindows()
"""
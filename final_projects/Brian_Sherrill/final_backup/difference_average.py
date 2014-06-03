import numpy as np
import os
import cv2
from LoadData import GetData

class MatchTests:
    def __init__(self, samStart = 11, samEnd = 36):
        self.data = GetData(sampleStart = samStart, sampleEnd = samEnd)
        self.avgs = self.data.GetAveraged()
        self.samStart = samStart

    def ClassifyTests(self, testDir = "/home/brian/PycharmProjects/firstAttempt/HandLetters/"):
        matches = []
        testImages = [(self.data.NormalizeImage(cv2.imread(testDir + "/" + j, 0)),j) for j in os.listdir(testDir)]#tuble(img,name)
        for i in testImages:
            name = i[1]
            img = i[0]
            bestMatch = 0
            print type(self.avgs[0])
            errorArray = self.avgs[0].astype(np.float_) - img.astype(np.float_)
            errorArray  = errorArray * errorArray
            minError = sum(sum(errorArray))
            for j in xrange(len(self.avgs)):
                errorArray = self.avgs[j].astype(np.float_) - img.astype(np.float_)
                errorArray  = errorArray * errorArray
                error = sum(sum(errorArray))
                if error < minError:
                    minError = error
                    bestMatch = j
            matches.append(name + "was identified to be: " + self.data.GetLetters()[bestMatch+self.samStart])
        return matches
if __name__ == "__main__":
    matcher = MatchTests()
    for i in matcher.ClassifyTests():
        print i

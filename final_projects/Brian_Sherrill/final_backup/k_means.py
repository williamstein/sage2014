__author__ = 'brian'
from LoadData import GetData
import cv2
from scipy.cluster.vq import *
import numpy as np
import os

class MyKMeans:
    def __init__(self, sampStart = 11, sampEnd = 36):
        data = GetData(sampleStart=sampStart, sampleEnd=sampEnd)
        self.sampStart = sampStart
        self.sampEnd = sampEnd
        self.imgs = data.GetListImgs()
        self.letters = data.GetLetters()
        avgs = data.GetAveraged()
        self.avgs = avgs[sampStart-1: sampEnd]
        self.kguesses = np.array([list(j.flatten()) for j in avgs])
        self.k = sampEnd - sampStart + 1
        self.data = data
    def ObsAndKInt(self):
        obs = np.array([list(j.flatten()) for i in self.imgs for j in i])
        return kmeans2(obs, self.k)
    def WhitenObsAndKInt(self):
        obs = np.array([list(j.flatten()) for i in self.imgs for j in i])
        obs = whiten(obs)
        return kmeans2(obs, self.k)
    def ObsAndKGuess(self):
        obs = np.array([list(j.flatten()) for i in self.imgs for j in i]) #flattens each image into a row
        #for i in range(5):
        #    print np.array(obs[i]).reshape(16,16)

        return kmeans2(obs, self.kguesses)
    def WhitenObsAndKWhitenGuess(self):
        obsAndK = np.array([list(j.flatten()) for i in self.imgs for j in i] + [list(j.flatten()) for j in self.avgs])
        obsKWhit = whiten(obsAndK)
        #print len(obsKWhit)
        n = len(obsKWhit)
        o = len(self.kguesses)
        return kmeans2(obsKWhit[0:n-o], obsKWhit[n-o:n])
    #not fully developed
    """
    def WhitenWithTests(self, test):
        t = len(test)
        a = len(self.avgs)
        obs = np.array([list(j.flatten()) for i in self.imgs for j in i] + [list(j.flatten()) for j in self.avgs] + [list(j.flatten()) for j in test])
        obsWhit = whiten(obs)
        #print len(obsKWhit)
        n = len(obsWhit)
        centroids, clusters = kmeans2(obsWhit[0:n-t-a], obsWhit[n-t-a:n-t])
        return centroids, clusters, obsWhit[n-t:n]
    """
    def RoughErrors (self, idx):
        """
        Expects 55 is each catagory. Counts the number of items deviating from 55 in each catagory
        """
        counts = np.zeros(self.k, dtype=np.int_)
        idxList = list(idx)
        #print idxList
        for i in idxList:
            counts[i] = counts[i] + 1
        return sum([abs(55 - i) for i in counts]) / 2

   #broken attempt at complex errors, keeping for possible later reference
    """
    def ComplexErrorsBroken(self, idx):
        counts = np.zeros(self.k, dtype=np.int_)
        itter = 0
        idxList = list(idx)
        mostCommonInBlock = []
        for i in idxList:
            counts[i] = counts[i]+1
            if itter%54 == 0:
                itter = -1
                indexOfLargest = 0
                maxVal = counts[0]
                for j in xrange(len(counts)):
                    if counts[j] > maxVal:
                        maxVal = counts[j]
                        indexOfLargest = j
                #mostCommonInBlock.append(counts[j])#think wrong
                mostCommonInBlock.append(indexOfLargest)
                counts[:] = 0
            itter = itter+1
        errors = 0
        itter = 0
        mostCommonIndexer = 0
        #iterates through idx list and checks
        for i in idxList:
            #if counts[i] != mostCommonInBlock[mostCommonIndexer]:#think wrong
            if i != mostCommonInBlock[mostCommonIndexer]:
                errors = errors + 1
            if itter % 54 == 0:
                itter = -1
                mostCommonIndexer = mostCommonIndexer + 1
            itter = itter + 1
        return errors
    """
    def ComplexErrors(self, idx):
        """
        find most common member in a sample (55 of same images) and selects that as true cluster ID
        Counts number of not true cluster ID in sample
        pre: raw cluster returned from kmeans2()
        post: returns error count
        """
        errors = 0
        Samps = self.BreakIntoSamples(idx)
        for i in Samps:
            MostCommon = self.GetMostCommonElement(i)
            for j in i:
                if j != MostCommon:
                    errors = errors + 1
        return errors

    def GetMostCommonElement(self, L):
        """
        pre: gives list of elements from k possible clusters
        post:return most common element
        """

        counts = np.zeros(self.k, dtype=np.int_)
        for i in L:
            counts[i] = counts[i] + 1
        countsList = list(counts)
        #Not efficient, but simple
        return countsList.index(max(countsList))

    def BreakIntoSamples(self, idxList):
        """
        pre: samples are 55 in each: cluters passed is raw from kmeans2()
        takes in clusters, breaks into list of list of samples
        post: returns list of each element assigned to cluster
        """

        listOfSamples = []
        if not isinstance(idxList, list):
            idxList = list(idxList)
        for i in xrange(0,len(idxList), 55):
            listOfSamples.append(idxList[i:i+55])
        return listOfSamples

    def ClusterIDToLetter(self, samps):
        """
        samps is from BreakIntoSamples
        """
        dictTupes = []
        for i in xrange(self.k):
            mostCommon = self.GetMostCommonElement(samps[i])
            dictTupes.append( (mostCommon, self.letters[i+self.sampStart]) )
        print dict(dictTupes)
        return dict(dictTupes)

    def ClassifyTestsM1(self, testDir = "/home/brian/PycharmProjects/firstAttempt/HandLetters"):
        """
        uses ObsAndKGuess to classify images
        """
        #testImages = [data.NormalizeImage(cv2.imread(testDir + "/" + j, 0)) for j in os.listdir(testDir)]
        #testImagesFlat = np.array([list(j.flatten()) for j in testImages])
        centroids, clusters = self.ObsAndKGuess()
        #Get cluster ID
        samples = self.BreakIntoSamples(clusters)
        letterDict = self.ClusterIDToLetter(samples)

        #use test data to classify
        testImages = [(self.data.NormalizeImage(cv2.imread(testDir + "/" + j, 0)),j) for j in os.listdir(testDir)]#tuple (image, letter)
        #testImagesFlat = np.array([list(j.flatten()) for j in testImages])
        itter = 0
        matches = []
        for i in testImages:
            imageArray = np.array(list(i[0].flatten())).astype(np.float_)
            name = i[1]

            #compare to centroids
            minDist= np.linalg.norm(imageArray - centroids[0].astype(np.float_))
            bestCent = 0
            for j in xrange(self.k):
                dist = np.linalg.norm(imageArray - centroids[j].astype(np.float_))
                if dist < minDist:
                    minDist = dist
                    bestCent = j
            matches.append(name + "was identified to be: " + letterDict[bestCent])
        return matches
    def ClassifyTestsM2BROKEN(self, testDir = "/home/brian/PycharmProjects/firstAttempt/HandLetters"):
        """

        BROKEN METHOD. DOES NOT WORK. KEPT FOR REFERANCE
        """

        testImages = [(self.data.NormalizeImage(cv2.imread(testDir + "/" + j, 0)),j) for j in os.listdir(testDir)]#tuple (image, letter)

        #testImagesFlat = np.array([list(j.flatten()) for j in testImages])
        matches = []
        for i in testImages:

            imageArray = np.array(list(i[0].flatten()))
            name = i[1]
            print i[0]
            #obs = np.array([list(j.flatten()) for i in self.imgs for j in i] + [list(i[0].flatten())] )
            x = [list(j.flatten()) for i in self.imgs for j in i]
            #print "x[0]=" + str(type(x[0]))
            #print "x[0][0]=" + str(type(x[0][0]))
            y = [list(i[0].flatten())]
            #print "y[0]=" + str(type(y[0]))
            #print "y[0][0]=" + str(type(y[0][0]))

            Wobs = np.array(x + y)
            rowOfEqual = None
            for i in xrange(len(Wobs)):
                if np.array_equal(imageArray, Wobs[i]):
                    rowOfEqual = i
            print "----" + str(rowOfEqual) + "----"

            print np.array(Wobs[len(Wobs) - 1]).reshape(16,16)
            centroids, clusters = kmeans2(Wobs, self.kguesses)
            print clusters
            clusters = list(clusters)
            testClust = clusters[-1]
            clusters = clusters[0:len(clusters) - 1]
            samps = self.BreakIntoSamples(clusters)
            dictLet = self.ClusterIDToLetter(samps)
            matches.append(name +" was matched to: " + dictLet[testClust])
        return matches

def testMethods():
    KmeansT = MyKMeans(sampStart=11,sampEnd=36)
    CE,CL1 = KmeansT.WhitenObsAndKInt()
    CE,CL2 = KmeansT.ObsAndKInt()
    CE,CL3 = KmeansT.ObsAndKGuess()
    CE,CL4 = KmeansT.WhitenObsAndKInt()
    L = [CL1, CL2, CL3, CL4]
    for i in L:
        print i
    for i in L:
        print "Complex Errors: " + str(KmeansT.ComplexErrors(i))

    for i in L:
        print "Rough Errors: " + str(KmeansT.RoughErrors(i))

if __name__ == "__main__":
    #Play around to see what technique gives best result
    Kmeans = MyKMeans(11,36)

    def DisplayImages(thing):
        if isinstance(thing, list):
            for i in thing:
                cv2.imshow('image',i)
                cv2.waitKey(0)
                cv2.destroyAllWindows()
        else:
            cv2.imshow('image',thing)
            cv2.waitKey(0)
            cv2.destroyAllWindows()
    for i in Kmeans.ClassifyTestsM1():
        print i



    #DisplayImages(testImages)

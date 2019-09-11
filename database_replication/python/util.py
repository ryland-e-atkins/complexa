# This module contains general purpose functions that are used throughout other 
# modules in this package.

import random

def writeListToFile(aList, fileName):
    """
    Writes a given list to a file line by line, overwrites previous file, adds
    newline char, returns true if success, false if failed
    """
    try:
        fout = open(fileName, 'w')
        for item in aList:
            fout.write(item)
            fout.write('\n')
        return True
    except:
        return False

def splitWords(aList):
    """
    Takes a list of strings, splits those strings on the whitespace and combines
    the newly split words into a list, also removes double quotes
    """
    returnList = list()
    for item in aList:
        stringList = item.split(" ")
        returnList += stringList
    # Clean items
    for i in range(len(returnList)):
        returnList[i] = returnList[i].strip('\"')
    return returnList

def readMultipleFilesIntoList(fileNames):
    """
    Reads multiple files into a single list, returns that list
    """
    aList = list()
    for fileName in fileNames:
        aList += readFileIntoList(fileName)
    return aList

def readFileIntoList(fileName):
    """
    Reads a single file into a single list, returns that list, strips newline 
    character
    """
    inFile = open(fileName)
    items = list()
    for line in inFile:
        items.append(line.rstrip('\n'))
    inFile.close()
    return items

def cleanList(aList):
    """
    Returns aList with any duplicates removed
    """
    return list(set(aList))

def closeEnough(tolerance, length, string):
    """
    tolerance: the tolerance of the string length
    length: the target length
    string: the string to evaluate
    """
    if(abs(len(string) - length) <= tolerance):
        return True
    else:
        return False

def getCount(stringList):
    """
    Takes a list of strings and returns a list of the counts of the lengths of 
    those strings. Used for distribution analysis.
    """
    maxLength = max(stringList, key=len)
    countList = list(0 for i in range(maxLength))
    for string in stringList:
        countList[len(string)] += 1
    return countList

def saveCountLists(theoryCountList, realCountList):
    """
    Saves the countList to a file for analysis
    """
    wFile = open("count.txt", "w")
    wFile.write('Predicted:\n')
    for c in theoryCountList:
        wFile.write(str(c))
        wFile.write('\n')

    wFile.write('\nActual:\n')
    for c in realCountList:
        wFile.write(str(c))
        wFile.write('\n')

    wFile.close()

def generateDistribution(maxLength, totalCount, numDice, randomness):
    """
    Returns a bell curve distribution.

    maxLength controls how wide your x-axis will be.
    totalCount is the total number of points you want to generate.
    numDice is the number of random numbers you want to add together to create 
        one length. The more dice you roll, the steeper you curve will be.
    randomness is a number between 0 and 100 that represents a percentage chance
        that a number is randomly dropped from the number creation. This is
        useful for shifting a data set to the left and gives a better 
        horizontal asymptote.
    """
    lengthList = list()
    for i in range(totalCount):
        # Generate numbers
        num = 0
        for d in range(numDice):
            # Pass randomness test
            randomizer = random.randint(1,100)
            if (randomness < randomizer):
                # Add random number in range to total
                num += random.randint(0,(maxLength//numDice))
        if(num >= maxLength):
            #print(num)
            num = maxLength - 1
        lengthList.append(num)

    countList = list(0 for i in range(maxLength))
    for l in lengthList:
        countList[l] += 1

    return countList, lengthList

def main():
    return

if __name__ == '__main__':
    main()
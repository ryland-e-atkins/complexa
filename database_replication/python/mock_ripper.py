# This module is used to combine and remove duplicates from raw mockaroo data

from subprocess import call
from util import *

# def generateCleanFiles():
#     """
#     DEPRECATED
#     """
#     filePrefix = 'mockaroo/mock_data_raw/'
#     fileNames = [
#         filePrefix + 'brandName/brandName1.csv',
#         filePrefix + 'brandName/brandName2.csv',
#         filePrefix + 'brandName/brandName3.csv',
#         filePrefix + 'brandName/brandName4.csv',
#         filePrefix + 'brandName/brandName5.csv']

#     names = cleanList(readMultipleFilesIntoList(fileNames))
#     words = cleanList(splitWords(names))

#     nameFileName = 'mockaroo/mock_data_clean/brandName/brandNames.csv'
#     wordFileName = 'mockaroo/mock_data_clean/brandName/brandWords.csv'

#     print("Name write: {0}".format(writeListToFile(names,nameFileName)))
#     print("Word write: {0}".format(writeListToFile(words,wordFileName)))

def generateFile(modifier, numFiles):

    #mkdir(modifier)
    filePrefix = 'mockaroo_data/raw/'+modifier+'/'
    fileNames = [filePrefix + modifier + str(x) + '.csv' for x in range(1,numFiles+1)]
    outFileName = 'mockaroo_data/cln/'+modifier+'/'+modifier+'.csv'

    items = cleanList(readMultipleFilesIntoList(fileNames))
    print("Write to {1} successful: {0}".format(writeListToFile(items,outFileName), outFileName))
    return

def mkdir(dirName):
    """
    Creates directory if not exists
    """
    raw = 'mockaroo_data/raw/' + dirName
    cln = 'mockaroo_data/cln/' + dirName
    call(['mkdir', raw])
    call(['mkdir', cln])

    return

def main():
    
    modifier = 'buzzword'
    numFiles = 10
    
    #mkdir(modifier)
    generateFile(modifier, numFiles)

if __name__ == "__main__":
    main()
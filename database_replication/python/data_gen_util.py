import random
import datetime as dt
from util import *
from vcrp_data_generator import *

#### DATA HOLDER ####

class DataHolder:
    """
    A class that loads and holds data lists
    """
    def __init__(self, modifierList=None):
        if(modifierList != None):
            self.modifierList = modifierList
        else:
            self.modifierList = [
                'site', 'firstName', 'lastName', 'title', 'streetName', 'city',
                'postalCode', 'region', 'companyName', 'brandName', 'buzzword',
                'country', 'ingredientName', 'streetSuffix']
        
        self.itemDict = dict()
        for modifier in self.modifierList:
            fileName = 'mock_data/cln/{0}/{0}.csv'.format(modifier)
            self.itemDict[modifier] = self.generateList(fileName)

    def generateList(self, fileName):
        inFile = open(fileName, 'r')
        itemList = list()
        for line in inFile:
            itemList.append(line.strip())
        inFile.close()
        return itemList

    def generateValue(self, recordNum, fieldDict, fieldValues):
        """
        Returns a random item constructed from the list determined by the 
        valueType
        Field values is a dictionary of fields generated in the current record 
        so far
        """
        fieldKeys = list(fieldDict.keys())
        # Check for null
        if('percentNull' in fieldKeys):
            if(random.randint(1,100) < fieldDict['percentNull']):
                return 'NULL'

        # Check type
        fieldType = fieldDict['type']
        
        if fieldType == 'primaryKey':
            return recordNum + 1

        elif fieldType == 'integer':
            # Check for condition
            if('condition' in fieldKeys):
                conditionDict = fieldDict['condition']
                # Check condition
                if(conditionDict['operator'] == 'equal'):
                    if(fieldValues[conditionDict['field']] == conditionDict['value']):
                        # Return true range
                        return random.randint(conditionDict['true']['minValue'], conditionDict['true']['maxValue'])
                    else:
                        # Return false range
                        return random.randint(conditionDict['false']['minValue'], conditionDict['false']['maxValue'])

            # Check for exclude
            if('exclude' in fieldKeys):
                num = random.randint(fieldDict['minValue'], fieldDict['maxValue'])
                excludeList = fieldDict['exclude']
                while num in excludeList:
                    num = random.randint(fieldDict['minValue'], fieldDict['maxValue'])
                return num
            elif('include' in fieldKeys):
                return random.choice(fieldDict['include'])
            else:
                return random.randint(fieldDict['minValue'], fieldDict['maxValue'])

        elif fieldType == 'streetAddress':
            streetNum = random.randint(0,100000)
            streetName = random.choice(self.itemDict['streetName'])
            streetSuff = random.choice(self.itemDict['streetSuffix'])
            return '"' + str(streetNum) + ' ' + streetName + ' ' + streetSuff + '"'

        elif fieldType == 'city':
            return '"' + random.choice(self.itemDict['city']) + '"'

        elif fieldType == 'email':
            firstName = random.choice(self.itemDict['firstName']) 
            lastName = random.choice(self.itemDict['lastName']) 
            site = random.choice(self.itemDict['site']) 
            return '"' + firstName + '.' + lastName + '@' + site + '"'

        elif fieldType == 'postalCode':
            return '"' + random.choice(self.itemDict['postalCode']) + '"' 

        elif fieldType == 'date':
            # Check for startDate and endDate
            if('startDate' in fieldKeys):
                startDate = dt.datetime(fieldDict['startDate'])
            else:
                startDate = dt.datetime(1970,1,1)
            if('endDate' in fieldKeys):
                endDate = dt.datetime(fieldDict['endDate'])
            else:
                endDate = dt.datetime.today()    
            return generateRandomDatetime(startDate, endDate)
        
        elif fieldType == 'region':
            return '"' + random.choice(self.itemDict['region']) + '"'

        elif fieldType == 'companyName':
            return '"' + random.choice(self.itemDict['companyName']) + '"'

        elif fieldType == 'firstName':
            return '"' + random.choice(self.itemDict['firstName']) + '"'

        elif fieldType == 'lastName':
            return '"' + random.choice(self.itemDict['lastName']) + '"'

        elif fieldType == 'title':
            return '"' + random.choice(self.itemDict['title']) + '"'

        elif fieldType == 'country':
            return '"' + random.choice(self.itemDict['country']) + '"'

        elif fieldType == 'phone':
            return generateRandomPhone()

        elif fieldType == 'site':
            return '"' + random.choice(self.itemDict['site']) + '"'

        elif fieldType == 'brandName':
            if('maxLength' in fieldKeys):
                string = random.choice(self.itemDict['brandName'])
                while(len(string) > fieldDict['maxLength']):
                    string = random.choice(self.itemDict['brandName'])
                return '"' + string + '"'
            else:
                return '"' + random.choice(self.itemDict['brandName']) + '"'

        elif fieldType == 'ingredientName':
            return '"' + random.choice(self.itemDict['ingredientName']) + '"'

        elif fieldType == 'string':
            return generateRandomString(random.randint(fieldDict['length']['min'], fieldDict['length']['max']))

        elif fieldType == 'enum':
            return '"' + str(random.choice(fieldDict['list'])) + '"'
            
        else:
            print('Failure: {0} not a defined field type.'.format(fieldType))
            exit(1)
            

def generateStringList(wordList, lengthList, tolerance):
    """
    Takes a list of words and generates n random combinations of them
    (n = len(lengthList))

    wordList: list of single words to choose from randomly
    lengthList: the list of string lengths you want to be output
    tolerance: the error allowed when creating strings to match lengthList

    WARNING: if you set the tolerance lower than the shortest word in wordList,
        you may run into an infinite loop issue.
    """
    stringList = list()
    # For each item in lengthList
    for length in lengthList:
        # we select a random word
        string = random.choice(wordList)
        string.strip()
        # check if the length is close to the selected length and that the 
        # string is not empty.
        while (not closeEnough(tolerance, length, string)) and (len(string) > 0): 
            # If it is shorter than the word we want
            if(len(string) < length):
                # We add another word
                string = string + " " + random.choice(wordList)
            # If it is longer than the length we want
            else:
                # We remove a word
                string = string.split(' ')
                indexToRemove = random.randint(0, len(string)-1)
                string.pop(indexToRemove)
                string = " ".join(string)
            string.strip()
        # If it is close enough, we save that word and move on.
        stringList.append(string)

    return stringList

#### GENERAL DATA ####

def generateRandomDatetime(startDate=dt.datetime(1970,1,1), endDate=dt.datetime.today()):
    """
    Assumed startDate datetime and endDate datetime are in UTC.
    Returns a random datetime between startDate and endDate in UTC.
    """
    epoch = dt.datetime.utcfromtimestamp(0)
    startDif = int((startDate - epoch).total_seconds())
    endDif = int((endDate - epoch).total_seconds())
    randSeconds = random.randint(startDif, endDif)
    return '"' + str(dt.datetime.utcfromtimestamp(randSeconds)) + '"'

def generateRandomString(length, space=True):
    """
    Returns a random string of supplied length, all caps
    """
    string = ""
    choiceList = [chr(i) for i in range(65,91)]
    if space:
        choiceList.append(chr(32))
    for char in range(length):
        string += random.choice(choiceList)
    return '"' + string + '"'

def generateRandomEmail(firstNameList):
    """
    Returns an email constructed randomly from the lists provided
    """
    firstNameList = generateFirstNameList()
    lastNameList = generateLastNameList()
    webSiteList = generateSiteList()
    first = random.choice(firstNameList)
    last = random.choice(lastNameList)
    site = random.choice(webSiteList)
    email = '"' + first + '.' + last + '@' + site + '"'
    return(email)

def generateRandomPhone(length=10):
    """
    Returns a random 10 digit phone number as a string formatted like:
    ##########
    """
    phone = ""
    for n in range(length):
        phone += str(random.randint(0,9))
    return '"' + phone + '"'

def generateCasNumber():
    """
    Returns a random CAS number formatted ######-##-#
    """
    part1 = ""
    part2 = ""
    part3 = ""

    for n in range(6):
        part1 += str(random.randint(0,9))
    for n in range(2):
        part2 += str(random.randint(0,9))

    part3 = str(random.randint(0,9))
    displayCas = part1 + '-' + part2 + '-' + part3
    originalCas = part1 + part2 + part3

    return displayCas, originalCas
    

#### DEPRECATED ####

# def generateValueFromList(possibleValues, percentNull):
#     """
#     Takes a list and percent chance to return null, returns a random choice from 
#     that list or null
#     """
#     if(random.randint(0,100)> percentNull):
#         return random.choice(possibleValues)
#     else:
#         return "NULL"

# def generateRandomDate():
#     """
#     Generates a random date between 1/1/2000 and 12/31/2018
#     """
#     month = random.randint(1,12)
#     day = random.randint(1,28)
#     year = random.randint(2000, 2018)
#     date = "'" + str(month) + "/" + str(day) + "/" + str(year) + "'"
#     return(date)

# def generateRandomCompanyName():
#     """
#     Generates random company name
#     """
#     companyNameList = generateCompanyNameList()
#     company = random.choice(companyNameList)
#     return '"' + company + '"'

# def generateRandomRegion():
#     """
#     Generates random region from list
#     """
#     regionList = generateRegionList()
#     region = random.choice(regionList)
#     return '"' + region + '"'

# def generateRandomPostalCode():
#     """
#     Generates random postal code
#     Returns null 50% of the time because zip codes are not always applicable
#     """
#     if(random.randint(0,100)>50):
#         return "NULL"
#     else:
#         postalCodeList = generatePostalCodeList()
#         return '"' + random.choice(postalCodeList) + '"'

# def generateRandomCity():
#     """
#     Generates random city 
#     """
#     cityList = generateCityList()
#     city = random.choice(cityList)
#     return '"' + city + '"'

# def generateRandomStreetAddress():
#     """
#     Generates random street address
#     """
#     streetNameList = generateStreetNameList()
#     streetNum = random.randint(0,100000)
#     streetAddress = str(streetNum) + ' ' + random.choice(streetNameList)
#     return '"' + streetAddress + '"'

# def generateSiteList():
#     fileName = 'mockaroo_data/cln/site/site.csv'
#     inFile = open(fileName, 'r')
#     siteList = list()
#     for line in inFile:
#         siteList.append(line.strip())
#     inFile.close()
#     return siteList

# def generateFirstNameList():
#     fileName = 'mockaroo_data/cln/firstName/firstName.csv'
#     inFile = open(fileName, 'r')
#     firstNameList = list()
#     for line in inFile:
#         firstNameList.append(line.strip())
#     inFile.close()
#     return firstNameList

# def generateLastNameList():
#     fileName = 'mockaroo_data/cln/lastName/lastName.csv'
#     inFile = open(fileName, 'r')
#     lastNameList = list()
#     for line in inFile:
#         lastNameList.append(line.strip())
#     inFile.close()
#     return lastNameList

# def generateTitleList():
#     fileName = 'mockaroo_data/cln/title/title.csv'
#     inFile = open(fileName, 'r')
#     titleList = list()
#     for line in inFile:
#         titleList.append(line.strip())
#     inFile.close()
#     return titleList

# def generateStreetNameList():
#     fileName = 'mockaroo_data/cln/streetName/streetName.csv'
#     inFile = open(fileName, 'r')
#     streetList = list()
#     for line in inFile:
#         streetList.append(line.strip())
#     inFile.close()
#     return streetList

# def generateCityList():
#     fileName = 'mockaroo_data/cln/city/city.csv'
#     inFile = open(fileName, 'r')
#     cityList = list()
#     for line in inFile:
#         cityList.append(line.strip())
#     inFile.close()
#     return cityList

# def generatePostalCodeList():
#     fileName = 'mockaroo_data/cln/postalCode/postalCode.csv'
#     inFile = open(fileName, 'r')
#     postalCodeList = list()
#     for line in inFile:
#         postalCodeList.append(line.strip())
#     inFile.close()
#     return postalCodeList

# def generateRegionList():
#     fileName = 'mockaroo_data/cln/region/region.csv'
#     inFile = open(fileName, 'r')
#     regionList = list()
#     for line in inFile:
#         regionList.append(line.strip())
#     inFile.close()
#     return regionList

# def generateCompanyNameList():
#     fileName = 'mockaroo_data/cln/companyName/companyName.csv'
#     inFile = open(fileName, 'r')
#     companyNameList = list()
#     for line in inFile:
#         companyNameList.append(line.strip())
#     inFile.close()
#     return companyNameList

def main():
    startDate = dt.datetime(1980,1,1)
    endDate = dt.datetime(2018,1,1)
    dat = generateRandomDatetime()
    print(dat)
    return

if __name__ == '__main__':
    main()
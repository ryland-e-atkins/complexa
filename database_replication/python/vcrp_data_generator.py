import random
from util import *
from data_gen_util import *

#### FIELD SPECIFIC ####

def registrationNumberLogic(statusId, cosmeticFormulationId):
    if(statusId in [109, 110]): 
        return cosmeticFormulationId
    else:
        return "NULL" 

def labelerTypeChoice():
    labelerList = [
        '',
        'MANUFACTURER', 
        'PACKER', 
        'DISTRIBUTOR', 
        'MANUFACTURER,PACKER',
        'MANUFACTURER,DISTRIBUTOR',
        'PACKER,DISTRIBUTOR',
        'MANUFACTURER,PACKER,DISTRIBUTOR']
    return random.choice(labelerList)

def filerTypeChoice():
    filerList = [
        '',
        'MANUFACTURER', 
        'PACKER', 
        'DISTRIBUTOR',
        'MANUFACTURER,PACKER',
        'MANUFACTURER,DISTRIBUTOR',
        'PACKER,DISTRIBUTOR',
        'MANUFACTURER,PACKER,DISTRIBUTOR',
        'RETAILER',
        'RETAILER,MANUFACTURER', 
        'RETAILER,PACKER', 
        'RETAILER,DISTRIBUTOR',
        'RETAILER,MANUFACTURER,PACKER',
        'RETAILER,MANUFACTURER,DISTRIBUTOR',
        'RETAILER,PACKER,DISTRIBUTOR',
        'RETAILER,MANUFACTURER,PACKER,DISTRIBUTOR']
    return random.choice(filerList)

def approvedLogic(statusId, firstNameList, lastNameList, siteList):
    if(statusId in [110,109,106,1]):
        approvedDate = generateRandomDate()
        approvedBy = generateRandomEmail(firstNameList, lastNameList, siteList)
        return approvedDate, approvedBy
    else:
        return 'NULL', 'NULL'

def discontinuedLogic(statusId):
    if(statusId in [3]): 
        return generateRandomDate()
    else: 
        return 'NULL'

def processedLogic(statusId):
    if(statusId in [1,105,106,109,110,108,2,104]): 
        return generateRandomDate()
    else: 
        return 'NULL'

def rejectedLogic(statusId):
    if(statusId in [104]):
        return generateRandomDate()
    else:
        return 'NULL'

#### ADDRESS ####

def generateAddress():

    # Open write file
    fileName = "sql_insert_scripts/address.sql"
    fout = open(fileName, "w")

    # Prep insert statement
    insertPrefix = "INSERT INTO CF01_Address(AddressId, StateId, CountryId, DocumentTypeId, ObjectId, StreetAddress, City, PostalCode, OptionalState, IsPrimary, CreatedOn, CreatedBy, IsActive) VALUES ("
    insertPostfix = ");\n"



#### FILER ####

def generateIngredientCosmeticFormulation():

    # Open write file
    fileName = "sql_insert_scripts/ingredientCosmeticFormulation.sql"
    fout = open(fileName, "w")

    # Prep insert statement
    insertPrefix = "INSERT INTO CF01_Ingredient_CosmeticFormulation(Id, Position, CompanyId, IngredientId, CosmeticFormulationId, DisplayCAS, OriginalCAS, CalcCAS, IngredientName, PrimaryName, PrimaryId, IsHidden, Status, CreatedOn, CreatedBy, IsActive) VALUES ("
    insertPostfix = ");\n"

    cosFormDict = dict()

    totalCount = 2000000
    for r in totalCount:
        id = r + 1
        #position 
        companyId = random.randint(0,13000)
        ingredientId = random.randint(0,10000)
        cosmeticFormulationId = random.randint(0,96000)
        cas = generateCasNumber()
        displayCas = cas
        originalCas = cas
        calcCas = cas
        ingredientName


    return



def generateFilerData():

    # Open write file
    fileName = "sql_insert_scripts/filer.sql"
    fout = open(fileName, "w")

    # Prep insert statement
    insertPrefix = "INSERT INTO CF01_Filer(FilerId, CompanyId, FirstName, LastName, Title, Email, Phone, CreatedOn, CreatedBy, IsActive, PrimaryFiler) VALUES ("
    insertPostfix = ");\n"

    firstNameList = generateFirstNameList()
    lastNameList = generateLastNameList()
    siteList = generateSiteList()
    titleList = generateTitleList()

    companyList = list()

    totalCount = 18000
    for r in range(totalCount):
        filerId = r + 1
        companyId = random.randint(1,13000)  
        firstName = random.choice(firstNameList)
        lastName = random.choice(lastNameList)
        title = random.choice(titleList)
        email = generateRandomEmail(firstNameList, lastNameList, siteList)
        phone = generateRandomPhone()
        createdOn = generateRandomDate()
        createdBy = generateRandomEmail(firstNameList, lastNameList, siteList)
        isActive = 1
        if(companyId in companyList):
            primaryFiler = 0
        else:
            primaryFiler = 1
            companyList.append(companyId)

        fout.write(insertPrefix)
        fout.write(
            str(filerId)+','+
            str(companyId)+',"'+
            str(firstName)+'","'+
            str(lastName)+'","'+
            str(title)+'",'+
            str(email)+','+
            str(phone)+','+
            str(createdOn)+','+
            str(createdBy)+','+
            str(isActive)+','+
            str(primaryFiler)
            )
        fout.write(insertPostfix)

    return


#### COSMETIC FORMULATION ####

def generate2512Data():
    """
    This generates a set of cosmetic formulation data for CF01
    cosmetic formulation has no real data, it's more of a connecting table/view
    """

    firstNameList = generateFirstNameList()
    lastNameList = generateLastNameList()
    siteList = generateSiteList()

    numCategories = 81
    numCompanies = 13000
    numLabelers = 6000
    numManufacturers = numLabelers
    manufacturerPercentNull = 60
    numPackers = numLabelers
    packerPercentNull = 60
    numFilers = 18000

    statusList = [1,2,3,4,5,100,101,102,103,104,105,106,107,108,109,110]

    # Open write file
    fileName = "sql_insert_scripts/cosmeticFormulation.sql"
    fout = open(fileName, "w")

    # Prep insert statement
    insertPrefix = "INSERT INTO CF01_CosmeticFormulation(CosmeticFormulationId, CategoryId, CompanyId, LabelerId, ManufacturerId, PackerId, StatusId, AuthorizedIndividualId, AlternativeAuthorizedIndividualId, RegistrationNumber, IsAContractManufacturer, IsCommerciallyDistributed, LabelerType, FilerType, RegisteredDate, ApprovedDate, ApprovedBy, AmendedDate, VerifiedDate, DiscontinuedDate, ProcessedDate, RejectedDate, IsPaperFiling, CreatedOn, CreatedBy, IsActive) VALUES ("
    insertPostfix = ");\n"

    totalCount = 96000
    for r in range(totalCount):
        cosmeticFormulationId = r + 1
        categoryId = generateValueFromList(range(1,numCategories+1), 0)
        companyId = generateValueFromList(range(1,numCompanies+1), 0)
        labelerId = generateValueFromList(range(1,numLabelers+1), 0)
        manufacturerId = generateValueFromList(range(1,numManufacturers+1), manufacturerPercentNull)
        packerId = generateValueFromList(range(1,numPackers+1), packerPercentNull)
        statusId = generateValueFromList(statusList, 0)
        authorizedIndividualId = generateValueFromList(range(1,numFilers+1), 0)
        alternativeAuthorizedIndividualId = generateValueFromList(range(1,numFilers+1), 90)
        registrationNumber = registrationNumberLogic(statusId, cosmeticFormulationId)
        isAContractManufacturer = random.choice([0,1])
        isCommerciallyDistributed = random.choice([0,1])
        labelerType = labelerTypeChoice()
        filerType = filerTypeChoice()
        registeredDate = generateRandomDate()
        approvedDate, approvedBy = approvedLogic(statusId, firstNameList, lastNameList, siteList)
        amendedDate = random.choice(['NULL', generateRandomDate()])
        verifiedDate = generateRandomDate()
        discontinuedDate = discontinuedLogic(statusId)
        processedDate = processedLogic(statusId)
        rejectedDate = rejectedLogic(statusId)
        isPaperFiling = random.choice([0,0,0,0,0,0,0,0,0,1])
        createdOn = generateRandomDate()
        createdBy = generateRandomEmail(firstNameList, lastNameList, siteList)
        isActive = 1

        fout.write(insertPrefix)
        fout.write(
            str(cosmeticFormulationId)+","+
            str(categoryId)+","+
            str(companyId)+","+
            str(labelerId)+","+
            str(manufacturerId)+","+
            str(packerId)+","+
            str(statusId)+","+
            str(authorizedIndividualId)+","+
            str(alternativeAuthorizedIndividualId)+","+
            str(registrationNumber)+","+
            str(isAContractManufacturer)+","+
            str(isCommerciallyDistributed)+",'"+
            str(labelerType)+"','"+
            str(filerType)+"',"+
            str(registeredDate)+","+
            str(approvedDate)+","+
            str(approvedBy)+","+
            str(amendedDate)+","+
            str(verifiedDate)+","+
            str(discontinuedDate)+","+
            str(processedDate)+","+
            str(rejectedDate)+","+
            str(isPaperFiling)+","+
            str(createdOn)+","+
            str(createdBy)+","+
            str(isActive)
            )
        fout.write(insertPostfix)
    fout.close()
    return

#### BRAND ####

def generateBrandData():
    """
    This generates a set of brand data for CF01
    """
    # Read in words
    fileName = 'mockaroo_data/clean/brandName/brandWords.csv'
    wordList = readFileIntoList(fileName)
    
    # Generate distribution
    maxLength = 147
    totalCount = 106000
    numDice = 10
    randomness = 40
    theoryCountList, lengthList = generateDistribution(maxLength, totalCount, numDice, randomness)
    
    # Generate brand names
    tolerance = 1
    brandNameList = generateStringList(wordList, lengthList, tolerance)

    # Check in counts
    realCountList = getRealCount(brandNameList, 147)
    saveCountLists(theoryCountList, realCountList)

    # Get firstName, lastName, and site lists
    firstNameList = generateFirstNameList()
    lastNameList = generateLastNameList()
    siteList = generateSiteList()

    # Open write file
    fileName = "sql_insert_scripts/brand.sql"
    fout = open(fileName, "w")

    # Initialiaze variables (python, you silly snake)
    brandDocumentId = 0
    cosmeticFormulationId = 0
    brandDescription = "" # Brand Name
    productWebSite = ""
    createdOn = ""
    createdBy = ""
    isActive = 1
    isQueried = 1

    # Prep insert statement
    insertPrefix = "INSERT INTO CF01_Brand(BrandDocumentId, CosmeticFormulationId, BrandDescription, ProductWebSite, CreatedOn, CreatedBy, IsActive, IsQueried) VALUES ("
    insertPostfix = ");\n"

    # Do work
    for r in range(len(brandNameList)):
        # Randomize values and write
        brandDocumentId = r + 1
        cosmeticFormulationId = random.randint(1, 96000)
        brandDescription = brandNameList[r]
        productWebSite = random.choice(siteList)
        createdOn = generateRandomDate()
        createdBy = generateRandomEmail(firstNameList, lastNameList, siteList)

        fout.write(insertPrefix)
        fout.write(str(brandDocumentId) + ',')
        fout.write(str(cosmeticFormulationId) + ',')
        fout.write('"' + str(brandDescription) + '",')
        fout.write('"' + str(productWebSite) + '",')
        fout.write('"' + str(createdOn) + '",')
        fout.write('"' + str(createdBy) + '",')
        fout.write(str(isActive) + ',')
        fout.write(str(isQueried) + insertPostFix)

    fout.close()
    return

def main():
    
    # Generate brand data
    #generateBrandData()

    # Generate cosmetic formulation data
    #generate2512Data()

    generateFilerData()

if __name__ == "__main__":
    main()
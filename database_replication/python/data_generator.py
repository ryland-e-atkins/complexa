import random
import json
from collections import OrderedDict
from util import *
from data_gen_util import *

def generateTable(tableName, totalCount, fieldDictList):
    """
    Writes a table of values to a file
    tableName: string of table name
    fieldDictList: list of dictionary items that represent fields in the table 
        with field names as keys and a list of dictionary with key-value pairs
        as descriptors

    Possible field descriptors:
        type
            references one of:
                primaryKey
                foreignKey
                integer
                brandName
                city
                companyName
                country
                firstName
                lastName
                title
                ingredientName
                postalCode
                site
                email
                streetAddress
        percentNull
            percentage of values that should be set to NULL, randomly chosen
        maxValue
            only available for integer type
        key
            tells if field is a key or not
    """
    
    # Open write file
    fileName = "sql_insert_scripts/{0}.sql".format(tableName)
    fout = open(fileName, "w")

    # Prep insert statement
    fieldNameList = fieldDictList.keys()

    insertPrefix = "INSERT INTO {0} (".format(tableName)
    for name in fieldNameList:
        insertPrefix += name
        insertPrefix += ', '
    insertPrefix = insertPrefix[:-2]
    insertPrefix += ') VALUES ('
    insertPostfix = ');\n'

    # Generate data set
    dataHolder = DataHolder()

    # For each record, generate values
    for r in range(totalCount):
        # For each field, get the type and write
        itemToWrite = insertPrefix
        fieldValues = dict()
        for fieldName in fieldNameList:
            value = dataHolder.generateValue(r, fieldDictList[fieldName], fieldValues)
            fieldValues[fieldName] = value
            itemToWrite += str(value)
            itemToWrite += ", "
            #print("{0}:{1}".format(fieldName, value))
        itemToWrite = itemToWrite[:-2]
        itemToWrite += insertPostfix
        fout.write(itemToWrite)
    fout.close()
    return

def generateDatabase(databaseDict):

    # TODO? Create data holder object
    
    # Create tables
    tableNames = list(databaseDict.keys())
    for tableName in tableNames:
        totalCount = databaseDict[tableName]['numRecords']
        tableDict = databaseDict[tableName]['fields']
        generateTable(tableName, totalCount, tableDict)
    return

def loadJsonToDict(fileName):
    """
    Takes a json file location as input and returns a dictionary of that json
    """
    fIn = open(fileName, 'r')
    jsonString = fIn.read()
    fIn.close()
    jsonDict = json.loads(jsonString, object_pairs_hook=OrderedDict)
    return jsonDict

def main():
    
    fileName = 'json_tables/CD02_INQUIRY_REQUESTOR.json'
    dbDict = loadJsonToDict(fileName)
    generateDatabase(dbDict)

    return

if __name__ == '__main__':
    main()
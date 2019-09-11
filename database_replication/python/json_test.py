import json

def buildInsertPrefix(table):
    """
    tables is a dictionary of tables, returns a non-data half of an sql insert
    statement
    """
    tableName = table['name']
    fieldNameList = list()
    for field in table['fields']:
        fieldNameList.append(table['fields'][field]['name'])

    fieldString = ','.join(fieldNameList)
    insertPrefix = "INSERT INTO {0} ({1}) VALUES (".format(tableName,fieldString)

    return insertPrefix

def getTableNames(tables):
    """
    tables is a dictionary of tables
    """
    for table in tables:
        print(table)
        print(tables[table])
        print('\n\n\n')

def main():

    # Read in file
    fIn = open('test_data/test_1.json', 'r')
    databaseString = fIn.read()
    fIn.close()

    # Load into dict
    tables = json.loads(databaseString)

    buildInsertPrefix(tables['table1'])


    # getTableNames(tables)

    #numTables = len(jsonDict)
    #print(jsonDict['table2']['name'])
    #for table in jsonDict:
    #    print(type(table))
    #    print('\n\n\n\n\n')
    #print(jsonString)
    return

if __name__ == "__main__":
    main()
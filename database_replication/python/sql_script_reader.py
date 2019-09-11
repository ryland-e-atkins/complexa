# This module is used to read in and parse sql scripts for their table and 
# field names

import json

def sql2json(sqlScript):
    """
    Takes a DDL script as a list of strings and returns a json string 
    representation
    """
    # Read the string and parse for key items
    # Split string and find index of create table statement lines
    createLines = list()
    for i in range(len(sqlScript)):
        sqlScript[i] = sqlScript[i].strip()
        if('CREATE TABLE' in sqlScript[i]):
            createLines.append(i)

    # For each table ddl index, parse through list for fields
    tableDict = dict()
    for tableLineIndex in createLines:
        # Find and read table name
        lineWordList = sqlScript[tableLineIndex].split()
        tableName = lineWordList[2]
        # Find all following field names
        fieldLineIndex = tableLineIndex + 1
        while(sqlScript())
        print(tableName)


    for item in sqlScript:
        print(item)
    json = ""
    return json

def readInSqlScript(fileName):
    """
    Returns a list of strings from lines in an sql script
    """
    fIn = open(fileName, 'r')
    sqlStringList = list(fIn)
    fIn.close()
    return sqlStringList

def main():

    fileName = 'test_data/test.sql'
    sqlString = readInSqlScript(fileName)
    sql2json(sqlString)

    return


if __name__ == '__main__':
    main()
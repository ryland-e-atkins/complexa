

def main():
    
    # Set variables
    linesPerFile = 20000
    
    # Read in file
    inFileName = 'sql_insert_scripts/CD02_INQUIRY_REQUESTOR.sql'
    inFile = open(inFileName, 'r')

    outFilePrefix = 'sql_insert_scripts/CD02_INQUIRY_REQUESTOR($$).sql'

    # Split & write files 
    lineCount = 0
    while lineCount < linesPerFile:




    return

if __name__ == '__main__':
    main()
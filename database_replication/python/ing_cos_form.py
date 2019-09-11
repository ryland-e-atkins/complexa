from util import *
from data_gen_util import *
import pandas as pd

def main():
    # Read in ingredient data
    # fileName = 'mockaroo_data/spc/CF01_Ingredient_R.csv'
    # df = pd.read_csv(fileName, sep='|')
    # print(df.sample(1))

    # Open write file
    # fileName = "sql_insert_scripts/CF01_Ingredient_CosmeticFormulation.sql"
    fileName = "master_test_file.sql"
    fout = open(fileName, "w")

    # Prep insert statement
    insertPrefix = "INSERT INTO CF01_Ingredient_CosmeticFormulation VALUES ("
    insertPostfix = ");\n"

    # Get ingredient list
    ingredientFile = 'mock_data/spc/CF01_Ingredient_R.csv'
    ingredientList = readFileIntoList(ingredientFile)

    # Get data holder and define params
    dataHolder = DataHolder()
    recordNum = 0
    C_emailFieldDict = {'type' : 'email'}
    C_dateFieldDict = {'type' : 'date'}
    M_emailFieldDict = {'type' : 'email', 'percentNull' : 40}
    M_dateFieldDict = {'type' : 'date', 'percentNull' : 40}
    fieldValues = list()

    # For each cosmetic formulation
    numCosmeticFormulations = 1
    ingCosFormId = 1
    for cfid in range(1,numCosmeticFormulations+1):
        # Determine number of ingredients
        numIngredients = random.randint(450,500)
        # Pick random, non-duplicate ingredients
        currentIngList = list()
        for ing in range(numIngredients):
            # Pick ingredient
            ingredientLine = random.choice(ingredientList)
            ingredientFieldList = ingredientLine.split('|')
            # Make sure it hasn't already been picked
            while ingredientFieldList[0] in currentIngList:
                ingredientLine = random.choice(ingredientList)
                ingredientFieldList = ingredientLine.split('|')
            # Add it to picked list
            currentIngList.append(ingredientFieldList[0])
            # Write
            line = insertPrefix 
            line += str(ingCosFormId) + ', '
            line += str(ing + 3) + ', '
            line += str(random.randint(1,13000)) + ', '
            line += ingredientFieldList[0] + ', '
            line += str(6003) + ', '
            line += ingredientFieldList[1] + ', '
            line += ingredientFieldList[2] + ', '
            line += ingredientFieldList[3] + ', '
            line += ingredientFieldList[5] + ', '
            line += ingredientFieldList[5] + ', '
            line += ingredientFieldList[0] + ', '
            line += ingredientFieldList[6] + ', '
            line += ingredientFieldList[7] + ', '
            line += dataHolder.generateValue(recordNum, C_dateFieldDict, fieldValues) + ', '
            line += dataHolder.generateValue(recordNum, C_emailFieldDict, fieldValues) + ', '
            line += dataHolder.generateValue(recordNum, M_dateFieldDict, fieldValues) + ', '
            line += dataHolder.generateValue(recordNum, M_emailFieldDict, fieldValues) + ', '
            line += '1'
            line += insertPostfix
            fout.write(line)
            ingCosFormId += 1
    fout.close()
    return

if __name__ == '__main__':
    main()
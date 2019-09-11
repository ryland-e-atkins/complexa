"""
complexa
For generating data with complex relationships.
"""
import xlsx_to_csv as x2c
import pandas as pd

def convert():
    xFileName = 'ExportChemicals.xlsx'
    x2c.xlsxToCsv(xFileName, 'ExportChemicals.csv', 'Export Results')

def cleanIngredients():

    df = pd.read_csv('ExportChemicals.csv')
    
    df = df[(df['Cas# /Accession#'].str.contains('[0-9]+-[0-9][0-9]-[0-9]'))]

    df.to_csv('cleanIngredients.csv')

    return


def main():
    cleanIngredients()
    
    return





if __name__ == '__main__':
    main()
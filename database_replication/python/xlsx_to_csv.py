import pandas as pd
import numpy as np
import log_error as le


def xlsxToCsv(infile_path, outfile_path, sheet_name):
    """
    Transforms a single sheet from an xlsx document to csv format
    """
    print("Transforming {} to {}".format(infile_path, outfile_path))
    try:
        data_xls = pd.read_excel(infile_path, sheet_name, index_col=None)
        data_xls.to_csv(outfile_path, encoding='utf-8', index=False)
        print('Successful xlsx "{}" to csv "{}"'.format(infile_path, outfile_path))
    except Exception as e:
        le.logError(infile_path, e)
        print('Failed xlsx "{}" to csv "{}"'.format(infile_path, outfile_path))


def xlsxToCsvMulti(infile_path, outfile_path, sheet_name, num_files):
    """
    Transforms a single sheet from an xlsx document to csv format split between
    multiple files. For use when file size is a restriction. (Looking at you 
    phpMyAdmin)
    """
    print("Transforming {} to {} files at {}".format(infile_path, num_files, outfile_path))
    try:
        data_xls = pd.read_excel(infile_path, sheet_name, index_col=None)
        data_sets = np.array_split(data_xls, num_files)
        for i in range(num_files):
            data_set = data_sets[i]
            data_set.to_csv('{}_{}'.format(i, outfile_path), encoding='utf-8', index=False)
            print('Successful xlsx to csv on {}_{}'.format(i, outfile_path))

    except Exception as e:
        le.logError(file_name, e)
        print('Failed xlsx to csv on {}_{}'.format(i, outfile_path))


def multiCsvToSingle(infile_list, outfile_path):
    """
    Takes in multiple csv files and combines them into one file
    """
    try:        
        # Load in data
        print("Loading data")
        df_list = []
        for file_name in infile_list:
            df_list.append(pd.read_csv(file_name))

        # Combine it
        print("Combining data")
        df = pd.concat(df_list)

        # Write it to file
        print("Writing to file")
        df.to_csv(outfile_path, encoding='utf-8', index=False)

        print("Success converting to single csv: {}".format(outfile_name))
    except Exception as e:
        le.logError(file_list, e)
        print('Failed. Writing to logs.')

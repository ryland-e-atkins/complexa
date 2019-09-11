import csv
import log_error as le


def addPipeDelimiter(file_name):
    try:
        with open('data/unpiped_csv_files/{0}.csv'.format(file_name), 'r', encoding = "utf-8") as infile, open('data/piped_csv_files/{0}.csv'.format(file_name), 'w', encoding = "utf-8") as outfile:
            reader = csv.reader(infile)
            writer = csv.writer(outfile, delimiter='|', quoting=csv.QUOTE_ALL)
            writer.writerows(reader)
        print('Successful add pipe on {0}'.format(file_name))
    except Exception as e:
        le.logError(file_name, e)
        print('Failed add pipe on {0}'.format(file_name))


def addPipeDelimiterMulti(file_name, num_files):
    try:
        for i in range(num_files):
            with open('data/unpiped_csv_files/{0}_{1}.csv'.format(file_name, i), 'r', encoding = "utf-8") as infile, open('data/piped_csv_files/{0}_{1}.csv'.format(file_name, i), 'w', encoding = "utf-8") as outfile:
                reader = csv.reader(infile)
                writer = csv.writer(outfile, delimiter='|', quoting=csv.QUOTE_ALL)
                writer.writerows(reader)
            print('Successful add pipe on {0}_{1}'.format(file_name, i))
    except Exception as e:
        le.logError(file_name, e)
        print('Failed add pipe on {0}'.format(file_name))
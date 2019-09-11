from subprocess import call
import log_error as le


def renameAndZipFile(file_name):
    try:
        call(['zip', 'data/zipped_csv_files/{0}.csv.zip'.format(file_name), 'data/piped_csv_files/{0}.csv'.format(file_name)])
        print('Successful zip on {0}'.format(file_name))
    except Exception as e:
        le.logError(file_name, e)
        print('Failed zip on {0}'.format(file_name))


def renameAndZipFileMulti(file_name, num_files):
    try:
        for i in range(num_files):
            call(['zip', 'data/zipped_csv_files/{0}_{1}.csv.zip'.format(file_name, i), 'data/piped_csv_files/{0}_{1}.csv'.format(file_name, i)])
            print('Successful zip on {0}_{1}'.format(file_name, i))
    except Exception as e:
        le.logError(file_name, e)
        print('Failed zip on {0}'.format(file_name))


def main():
    file_list = [
        'small_file_131208',
        'small_file_262416',
        'small_file_393624',
        'small_file_524832',
        'small_file_656040',
        'small_file_787248',
        'small_file_918456',
        'small_file_1049664',
        'small_file_1180872',
        'small_file_1312080',
        'small_file_1443288',
        'small_file_1574496',
        'small_file_1705704',
        'small_file_1836912',
        'small_file_1968120',
        'small_file_2099328'
    ]
    for file_name in file_list:
        call(['zip', '{0}.sql.zip'.format(file_name), '{0}.sql'.format(file_name)])
        print('Successful zip on {0}'.format(file_name))

    return


if __name__ == '__main__':
    main()
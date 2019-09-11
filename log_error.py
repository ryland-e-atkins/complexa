def logError(filename, error):
    err_file = open('error.log', 'a')
    err_file.write(filename + '\n')
    err_file.write(str(error))
    err_file.write('\n\n')
    err_file.close()
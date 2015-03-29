import zipfile

def extract_file(zFile, password):
    try:
        zFile.extractall(pwd=password)
        return password
    except:
        return

def main():
    zFile = zipfile.ZipFile('file.zip')
    passFile = open('dictionary.txt')
    for line in passFile.readlines():
        password = line.strip('\n')
        guess = extract_file(zFile, password)
        if guess:
            print '[+] Password = ' + password + '\n'
            exit(0)

if __name__ == '__main__':
    main()

# zFile = zipfile.ZipFile("file.zip")
# passFile = open('dictionary.txt')
#
# for line in passFile.readlines():
#     password = line.strip('\n')
# try:
#     zFile.extractall(pwd=password)
#     print '[+} Password = ' + password + '\n'
#     exit(0)
# except Exception, e:
#     pass

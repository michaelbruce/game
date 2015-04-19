import zipfile
import optparse
from threading import Thread

# a key difference here seems that threads do not return (this would end the program?)
# optparse to take vars - what is wrong with sys.argv? - now I understand...
def extract_file(zFile, password):
    try:
        zFile.extractall(pwd=password)
        print '[+] Password = ' + password + '\n'
    except:
        pass

def main():
    parser = optparse.OptionParser("usage%prog "+\
    "-f <zipfile> -d <dictionary>")
    parser.add_option('-f', dest='zname', type='string',\
    help='specify zip file')
    parser.add_option('-d', dest='dname', type='string',\
    help='specify dictionary file')
    (options, args) = parser.parse_args()
    if (options.zname == None) | (options.dname == None):
        print parser.usage
        exit(0)
    else:
        zname = options.zname
        dname = options.dname
    zFile = zipfile.ZipFile(zname)
    passFile = open(dname)
    for line in passFile.readlines():
        password = line.strip('\n')
        t = Thread(target=extract_file, args=(zFile, password))
        t.start()

if __name__ == '__main__':
    main()

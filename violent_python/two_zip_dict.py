import zipfile

#need to create a zipfile too...
zFile = zipfile.ZipFile("evil.zip")
try:
    zFile.extractall(pwd="secret")

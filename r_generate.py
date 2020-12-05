# !/usr/bin/python3

# NOTE: all images need to place in folder or hirachy folder of ROOT_FOLDER
#      file pubspec.yaml  NEED have these two line with content defined in sinalStart, sinalEnd in assets the section like this:
#       flutter:
#           assets:
#           # assets-generator-begin
#           # assets-generator-end
import os

currentPath = os.path.dirname(__file__)
folderToImports = []
ROOT_FOLDER = 'assets/images'
sinalStart = "assets-generator-begin"
sinalEnd = "assets-generator-end"

# assets
#  |-someImage.jpg
#  |-General
#       |-someImage.jpg
#       |-AB
#          |-imageAB.jpg
#          |-A
#            |-a.jpg
#          |-B
#            |-b.jpg
#
#
# out put string expect
# final Resource R = Resource();
#
# Resource {
#   final General general = General()
#   final String someImage = "someImage.jpg";
# }
#
# class General {
#   final String someImage = "someImage.jpg"
#   final AB aB =  AB();
# }
#
# class AB {
#   final A a = A()
#   final B a = B()
#   final String imageAB = "imageAB.png"
# }
#
# class A {
#   final String a = "a.jpg"
# }
#
# clas B {
#   final String b = "b.jpg"
# }
#
# file pubspec.yaml will updated
# flutter:
#           assets:
#           # assets-generator-begin
#               - assets/General/
#               - assets/AB/
#               - assets/AB/A/
#               - assets/AB/B/
#


def lowerOnlyFirstCharacter(string):
    firstCharacter = string[0:1].lower()
    return firstCharacter + string[1: len(string)]


def processFolderName(folderName):
    replacedUnderscoreString = folderName.title()
    replacedUnderscoreString = replacedUnderscoreString.replace("_", " ")
    removedSpaceString = replacedUnderscoreString.replace(" ", "")
    # adding Images to limit the conflict class name with other user defined class
    return removedSpaceString + "Images"


def processFileName(fileName):
    fileNameOnly = os.path.splitext(fileName)[0]
    replacedUnderscoreString = fileNameOnly.title()
    replacedUnderscoreString = replacedUnderscoreString.replace("_", " ")
    removedSpaceString = replacedUnderscoreString.replace(" ", "")
    return lowerOnlyFirstCharacter(removedSpaceString)


def processWindowPath(path):
    path = path.replace("\\", "/")
    return path
# Create separate class with properties is files


def generateResourceForFolder(folderPath, folderName, level):
    stringArray = []
    subFolderString = []
    stringArray.append(
        "class " + processFolderName(folderName) + " {")
    for fileName in os.listdir(folderPath):
        newPath = os.path.join(folderPath, fileName)
        if os.path.isdir(newPath):
            # Folder 2.0x and 3.0x is for high resolution screen, flutter will auto detect to use,
            # so not generate image path for it
            if fileName != "2.0x" and fileName != "3.0x":
                # Recursive create class for folder
                folderPath = processWindowPath(folderPath)
                folderToImports.append(folderPath + "/" + fileName)
                processedFolderName = processFolderName(fileName)
                stringArray.append(
                    "   final " + lowerOnlyFirstCharacter(processedFolderName) + " = " + processedFolderName + "();")
                subFolderString.append(generateResourceForFolder(
                    newPath, fileName, level + 1))
        elif fileName.endswith(".png" or ".jpg" or ".jpeg"):
            fileNameToGenerateProperty = processFileName(fileName)
            folderPath = processWindowPath(folderPath)
            stringArray.append("    " * level + "final String " +
                               fileNameToGenerateProperty + " = " + "'" + folderPath + "/" + fileName + "';")
    stringArray.append("}")
    for subGeneratedClass in subFolderString:
        stringArray.append("\n")
        stringArray.extend(subGeneratedClass)
    return stringArray


# Generate file R
filePathR = os.path.join(currentPath, 'lib/r.dart')
fileR = open(filePathR, "w")

# open folder asset to process
folderToImports.append(ROOT_FOLDER)
assetsFolder = os.path.join(currentPath, ROOT_FOLDER)
separator = "\n"
arrayStrings = []
arrayStrings.append(
    "//*** This is the automate generated file, DO NOT EDIT ***")
arrayStrings.append("\n\r")
arrayStrings.append("final ResourceImages R = ResourceImages();")
arrayStrings.append("\n\r")
fileString = separator.join(
    generateResourceForFolder(assetsFolder, "Resource", 0))
arrayStrings.extend(fileString)
fileR.writelines(arrayStrings)

# Update import folder in pubspec.yaml
started = False
ended = False
with open(os.path.join(currentPath, 'pubspec.yaml'), "r+") as filePubspec:
    allLines = filePubspec.readlines()
    filePubspec.seek(0)
    for line in allLines:
        if sinalStart in line:
            filePubspec.write(line)
            started = True
            # filePubspec.writelines(folderToImports)
            for folderPath in folderToImports:
                folderPath = processWindowPath(folderPath)
                filePubspec.write("    - " + folderPath + "/\n")
        if sinalEnd in line:
            ended = True
        if started == True and ended == False:
            continue
        filePubspec.write(line)
    filePubspec.truncate()

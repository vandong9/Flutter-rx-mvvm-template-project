# Using: python3 <path>/template_clone_script.py <name of module> <path to place module will be copy to>
# Ex: python3 template_clone_script.py  new_login lib/modules
# Must input two aruguments: first is the name of module, the second is the path that will store module
# Command python3 or python is up to OS (Mac use python3 to specify python version 3)
# Current folder in command NEED TO BE  the fodler which contain script (is inside this project )
###
###
###

import sys
import os
from os import path
import io
from distutils.dir_util import copy_tree

# Define
currentPath = os.getcwd()
sourceFolderName = "/mvvm_template"
textNeedToReplace = "Template"
nameOfFileScreen = "screen.dart"
nameOfFileViewModel = "view_model.dart"
nameOfFileRepo = "repository.dart"


def fileNameToClassName(filename):
    filename = filename.replace("_", " ")
    filename = filename.title()
    filename = filename.replace(" ", "")
    return filename


# Command input arguments
if len(sys.argv) < 3:
    print("Error: Must input name of module and folder path")
    exit(1)

targetName = sys.argv[1]
targetFolder = sys.argv[2]

if len(targetName) <= 0 or len(targetFolder) <= 0:
    print("Error: Must input name of module and folder path")
    exit(1)

print("Start generate module " + targetName + " at " + targetFolder)

# Check if target folder exist
source = currentPath + sourceFolderName
destination = currentPath + "/" + targetFolder + "/" + targetName
if path.exists(destination):
    print("Error: The folder " + destination + " already exist")
    exit(1)

# Copy whole mvvm_template folder to destination
copy_tree(source, destination)

# Change name and text of file screen
screenFilePath = destination + "/" + nameOfFileScreen
screenFilePathNewName = destination + "/" + targetName + "_screen.dart"
with open(screenFilePath, "r+") as screenFile:
    data = screenFile.read().replace(textNeedToReplace, fileNameToClassName(
        targetName)).replace(nameOfFileViewModel, targetName + "_view_model.dart")
    screenFile.seek(0)
    screenFile.write(data)
    screenFile.truncate()
os.rename(screenFilePath, screenFilePathNewName)

# Change name and text of file view_model
viewModelFilePath = destination + "/" + nameOfFileViewModel
viewModelFilePathNewName = destination + "/" + targetName + "_view_model.dart"
with open(viewModelFilePath, "r+") as viewModelFile:
    data = viewModelFile.read().replace(
        textNeedToReplace, fileNameToClassName(targetName)).replace(nameOfFileRepo, targetName + "_repository.dart")
    viewModelFile.seek(0)
    viewModelFile.write(data)
    viewModelFile.truncate()
os.rename(viewModelFilePath, viewModelFilePathNewName)

# Change name and text of file repository
repositoryFilePath = destination + "/" + nameOfFileRepo
repositoryFilePathNewName = destination + "/" + targetName + "_repository.dart"
with open(repositoryFilePath, "r+") as repositoryFile:
    data = repositoryFile.read().replace(
        textNeedToReplace, fileNameToClassName(targetName))
    repositoryFile.seek(0)
    repositoryFile.write(data)
    repositoryFile.truncate()
os.rename(repositoryFilePath, repositoryFilePathNewName)

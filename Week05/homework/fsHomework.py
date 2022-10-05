# File to traverse  given directoy and it's subdis and retrieve all the files

import os, argparse, yaml, reader
from turtle import clear
from unittest import result

# parser
parser = argparse.ArgumentParser(
    
    description = "Traverses a directory and detects attacks and malicious acviity in the w32 processes",
    epilog = "Developed by Katie Hopkins, 2022"
    
)
    
# Add an argument to pass the fs.py program
parser.add_argument("-d", "--directory", required="True", help="Directory that you want to traverse.")

# Parse the arguments
args = parser.parse_args()
# search term from yaml
rootdir = args.directory



# in our story, we will traverse a directory


# check if the agument is  directory
# if not os.path.isdir(rootdir):
#   print("Invalid directory => {}".format(rootdir))
#   exit()


#List to save files
fList= []
    
# crawl through the provided directory
for root, subfolders, filenames in os.walk(rootdir):
    
    for f in filenames:
        
        #print(root + "/" + f)
        fileList = root + "/" + f
        #print(fileList)
        fList.append(fileList)


# search yaml file
with open('searchTerms.yaml', 'r') as yf:
    keywords = yaml.safe_load_all(yf)
        
    #listKeywords = []
    for eachEntry in keywords:

        for key, value in eachEntry.items():
            attackType = value['description']
            DetectAttack = value['detect']

            listKeywords = DetectAttack.split(",")    
            print ("Description: " + attackType)
            
            print (listKeywords)
            for each in fList:
               reader.log(each,listKeywords)
            
 
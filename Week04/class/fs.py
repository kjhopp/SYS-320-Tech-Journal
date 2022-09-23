# File to traverse  given directoy and it's subdis and retrieve all the files

import os, sys


# get information from the command line
print(sys.argv)

# directory to traverse
rootdir = sys.argv[1]

#print(rootdir)

# in our story, we will traverse a directory


# check if the agument is  directory
if not os.path.isdir(rootdir):
    print("Invalid directory => {}".format(rootdir))
    exit()


#List to save files
fList= []
    
# crawl through the provided directory
for root, subfolders, filenames in os.walk(rootdir):
    
    for f in filenames:
        
        #print(root + "/" + f)
        fileList = root + "/" + f
        #print(fileList)
        fList.append(fileList)
        
#print (fList)

def statFile(toStat):
    
    # i is going to be the variable sed for each fo the metadata elements
    i = os.stat(toStat, follow_symlinks=False)
    
    # mode
    mode = i[0]
    
    # inode
    inode = i[1]
    
    # uid
    uid = i[4]
    
    # gid
    gid = i[5]
    
    # file size
    fsize = i[6]
    
    # access time
    atime = i[7]
    
    # modification time
    mtime = i[8]
    
    # ctime => windows si the brith fothe file when it was created
    # unix it is when attributes of the file changes
    ctime = i[9]
    crtime = i[9]

    print("0|{}|{}|{}|{}|{}|{}|{}|{}|{}|{}".format(toStat, inode, mode, uid, gid, fsize, atime, mtime, ctime, ctime))
    
    
for eachFile in fList:
    
    statFile(eachFile)    

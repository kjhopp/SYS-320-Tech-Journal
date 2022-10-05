import csv, re

def log(filename,searchTerms):
    # create contents of file
    contents = []
    # added UTF-8 -- was getting error
    with open(filename, encoding='UTF-8') as f:
        contents = csv.reader(f)
        
        
        for eachLine in contents:

            for keyword in searchTerms:
                # added quotations accordingly
                x = re.findall(r'' + keyword + '', eachLine[1])
                
                for found in x:
                    # looks at searchTerms
                    # values i want to be displayed    
                    args = eachLine[1]
                    host = eachLine[2]
                    name = eachLine[3]
                    path = eachLine[4]
                    pid = eachLine[5]
                    user = eachLine[6]
                    # print values in easy to read format
                    print("""
                    Arguments: {}
                    Host: {}
                    Name: {}
                    Path: {}
                    PID: {}
                    User: {}
                    """.format(args, host, name, path, pid, user) + "*" * 60)
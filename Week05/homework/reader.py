import csv, re

def log(filename,searchTerms):
    contents = []
    with open(filename, 'r') as f:
        contents = csv.reader(f)
        #print ("the contents")
        #print(contents)
    # loop was not in the right order
        for eachLine in contents:

            for keyword in searchTerms:
                # added quotations accordingly
                x = re.findall(r'' + keyword + '', eachLine[1])
                for found in x:
                   
                    args = eachLine[1]
                    host = eachLine[2]
                    name = eachLine[3]
                    path = eachLine[4]
                    pid = eachLine[5]
                    user = eachLine[6]
                    # prints values as a heredoc
                    print("""
                    Arguments: {}
                    Host: {}
                    Name: {}
                    Path: {}
                    PID: {}
                    User: {}
                    """.format(args, host, name, path, pid, user) + "*" * 60)
    #except EnvironmentError as e:
        #print(e.strerror)
    

        
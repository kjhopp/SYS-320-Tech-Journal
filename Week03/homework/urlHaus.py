import csv
# imported re module -- included in the code below
import re

# put in the correct indentations

# changed function from ur1HausOpen to urlHausOpen
# changed searchTerm to correct searchTerms
def urlHausOpen(filename,searchTerms):
# removed quotes on filename
# changed to with
    with open(filename) as f:
    # changed from == to =
        contents = csv.reader(filename)
        
    for _ in range(9):
        next(contents)
    
    # loop was not in the right order
    for eachLine in contents:

        for keyword in searchTerms:
            # added quotations accordingly
            x = re.findall(r''+ keyword + '', eachLine[2])


for _ in x:
# Don't edit this line. It is here to show how it is possible
# to remove the "tt" so programs don't convert the malicious
# domains to links that an be accidentally clicked on.
    the_url = eachLine[2].replace("http","hxxp")
    the_src = eachLine[4]
    print("""
    URL:
    Info: 
    {}""",format(the_url, the_src,"*"+60))
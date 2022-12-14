import logCheck
import importlib
importlib.reload(logCheck)

# SSH authentication failures
def apache_events(filename, service, term):

    # Call logCheck and return the results
    is_found = logCheck._logs(filename,service,term)

    #  Found List
    found = []

    # Loop through the results
    for eachFound in is_found:
        
        # print(eachFound)
        # Split the results
        sp_results = eachFound.split(" ")

        # Append the split value to the found list
        # GET /cgi-bin/test-cgi HTTP/1.1" 404 435
        found.append(sp_results[3] + " " + sp_results[0] + " " + sp_results[1])
    
    # Remove duplicates using set
    # and convert the lis tot a dictionary
    getValues = set(found)

    # print results
    for eachValue in getValues:

        print(eachValue)
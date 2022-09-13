import logCheck
import importlib
importlib.reload(logCheck)

def logCheck(filename, service, term):

    # Call logCheck and return the results
    is_found = logCheck._logs(filename,service,term)

    #  Found List
    found = []

    # Loop through the results
    for eachFound in is_found:
        
        # print(eachFound)
        # Split the results
        sp_results = eachFound.split(" ")

        if term == 'qqbytes' in sp_results[9]:
        # Append the split value to the found list
            found.append(sp_results[2] + " " + sp_results[4] + " " + sp_results[6] + " " + sp_results[9])

        if term == 'qqopen':
            found.append(sp_results[2] + " " + sp_results[4] + " " + sp_results[9])
            

    
    # Remove duplicates using set
    # and convert the lis tot a dictionary
    getValues = set(found)

    # print results
    for eachValue in getValues:

        print(eachValue)
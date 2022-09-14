import logCheck
import importlib
importlib.reload(logCheck)

def logParse(filename, service, term):

    # Call logCheck and return the results
    is_found = logCheck._logs(filename,service,term)

    #  Found List
    found = []

    # Loop through the results
    for eachFound in is_found:
        
        # print(eachFound)
        # Split the results
        sp_results = eachFound.split(" ")
        # print(sp_results)
        if term == 'qqbytes':
        # Append the split value to the found list
            if 'connect' not in sp_results:
                found.append(sp_results[4] + " bytes sent " + sp_results[7] + " bytes received ")
        if term == 'qqopen':
            found.append(sp_results[2] + " open through proxy " + sp_results[6])
            

    
    # Remove duplicates using set
    # and convert the lis tot a dictionary
    getValues = set(found)

    # print results
    for eachValue in getValues:

        print(eachValue)
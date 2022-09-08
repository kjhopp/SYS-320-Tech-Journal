import syslogCheck
import importlib
importlib.reload(syslogCheck)

# SSH authentication
def ssh_authentication(filename, searchTerms):

    # Call syslogCheck and return the results
    is_found = syslogCheck._syslog(filename,searchTerms)

    #  Found List
    found = []

    # Loop through the results
    for eachFound in is_found:
        
        # print(eachFound)
        # Split the results
        sp_results = eachFound.split(" ")

        # Append the split value to the found list
        found.append(sp_results[5])
    
    # Remove duplicates using set
    # and concvert the list to a dictionary
    authentication = set(found)

    # print results
    for user in authentication:

        print(user)
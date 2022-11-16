# Array of websites containing threat intell
$drop_urls = @('https://rules.emergingthreats.net/blockrules/emerging-botcc.rules', 'https://rules.emergingthreats.net/blockrules/compromised-ips.txt')

# Loop through the URLs for the rule list
foreach ($u in $drop_urls) {
    # Extract the filename
    $temp - $u.split("/")

    # The last element in the array plucked off is the filename
    $file_name = $temp[-1]
    
    if (Test-Path $file_name) {
        continue
    } else {
         # Download the rules list
        Invoke-WebRequest -Uri $u -OutFile $file_name
    }
}

# Array containing the file name
$input_paths = @('.\compromised-ips.txt', '.\emerging-botcc.rules')

# Extract the IP addresses
# 108.190.109.107
$regex_drop = '\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b'

# Append the IP Addresses to the temporary IP list
Select-String -Path $input_paths -Pattern $regex_drop | `
ForEach-Object { $_.Matches } | `
ForEach-Object { $_.Value } | Sort-Object | Get-Unique | `
Out-File -FilePath "ips-bad.tmp"

# Get the IP addresses discovered, loop through and replace the beginning of the line with the IPTables syntax 
# After the IP address, add the remaining IPTables syntax and save the results to a file
(Get-Content -Path ".\ips-bad.tmp") | % `
{ $_ -replace "^", "iptables -A INPUT -s " -replace "$", " -j DROP" } | `
Out-File -FilePath "iptables.bash"
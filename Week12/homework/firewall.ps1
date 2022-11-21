# Week 12 Homework

<#

Use a switch statement to create an IPTables or Windows firewall ruleset with the assignment from today's class that blocks the IPs.  From the Read-Host above, the user will type IPTables or Windows.  Switch statements help prevent numerous:

if/elseif/elseif/elseif/elseif/elseif/elseif/elseif/elseif/else

code blocks.  It makes the output much cleaner and manageable.

#>

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

$answer = Read-Host -Prompt "Windows or IPTables"

switch($answer) {
    # If user inputs Windows
    Windows {

        # Look through bad IP adddresses and then create a script that blocks the certain firewall rules
        (Get-Content -Path '.\badIP.tmp') | % `
        {$_ -replace "^", "netsh advfirewall firewall add rule name='BLOCK BAD IPS' dir=in action=block remoteip=" -replace "$"} | `
        # Output to PowerShell file
        Out-File -FilePath 'windows.ps1'
        
    }

    # If user inputs IPTables
    IPTables {

        (Get-Content -Path ".\badIP.tmp") | % `
        {$_ -replace "^", "iptables -A INPUT -s " -replace "$", " -j DROP"} | `
        # Save to file
        -OutFile -FilePath 'iptables.bash'
        # Set Computer IP, and credentials from above
        Set-SCPItem -ComputerName '192.168.4.22' -Credential (Get-Credential sys320) `
        # Where to save file
        -Destination '/home/kathryn.hopkins' -Path 'ipTables.bash'

    }
}
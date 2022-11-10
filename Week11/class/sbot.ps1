# Send an email using Powershell

$toSend = @('kathryn.hopkins@mymail.champlain.edu', 'kati@champlain.edu', 'hopk@champlain.edu')

# Message Body
$msg = "Hello"

while ($true) {

    foreach($email in $toSend) {

        # Send the email
        write-host "Send-MailMessage -from 'kathryn.hopkins@mymail.champlain.edu' -To $email -Subject 'Tisk Tisk'
        -Body $msg -SmtpServer X.X.X.X"
        
        # Pause for 1 second
        start-sleep 1

    }

}
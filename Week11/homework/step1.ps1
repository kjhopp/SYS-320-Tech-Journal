# Task 1: 
<#
    The behavior of the ransomware includes a script named "step1.ps1" which searches the filesystem 
    for files that can be encrypted (except critical system files).  The second script "step2.ps1" is 
    used to encrypt the files found by the script "step1.ps1" (page 4). The "step1.ps1" script also copies 
    powershell.exe to a directory and names it: "EnNoB-X.exe », where X is an integer ranging between 1000 
    and 9876."
#>

# powershell.exe file
$file = "C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe"

# home directory
$homeDirectory = "C:\Users\kjhop\Downloads\"

# copy file to home directory
Copy-Item $file -Destination $homeDirectory

# change file name
$newFile = $homeDirectory + "EnNoB-4567.exe"
Rename-Item -Path "C:\Users\kjhop\Downloads\powershell.exe" -NewName "EnNoB-4567.exe"

# see if file was copied over or not with error codes
if(Test-Path $newFile) {
    Write-Host -BackgroundColor "green" -ForegroundColor "white" "file successfully created"
}
else {
    Write-Host -BackgroundColor "red" -ForegroundColor "white" "file not successfully created"
}

# Task 2
<#
    The malware performs the following action: "The « step1.ps1 » script creates a ransom demand file 
    named « Readme.READ ». Albeit very short, this message contains the same PROTONMAIL e-mail addresses 
    as above"
#>

<# 
    writes the following message: "If you want your files restored, please contact me at 
    kathryn.hopkins@mymail.champlain.edu. I look forward to doing business with you."
#>
$message = "If you want your files restored, please contact me at kathryn.hopkins@mymail.champlain.edu. I look forward to doing business with you."

# create file named Readme.READ to the Desktop
$readFile = "C:\Users\kjhop\Desktop\Readme.READ"
Write-Output $message | Out-File -FilePath "C:\Users\kjhop\Desktop\Readme.READ"

#see if file was successfully created
if(Test-Path $readFile) {
    Write-Host -BackgroundColor "green" -ForegroundColor "white" "file successfully created"
}
else {
    Write-Host -BackgroundColor "red" -ForegroundColor "white" "file not successfully created"
}

# Reflection
<#
What did you like the most about this assignment?
    I liked that it was an introductory assignment to Powershell and it got me familiar with the related commands.
    The part that I didn't like was that since I was unfamiliar it took me a little bit longer, but that comes with
    learning a new language.

What additional questions do you have?
    No additional questions at this time.
#>
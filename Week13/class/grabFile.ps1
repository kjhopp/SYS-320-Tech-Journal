# create a commandline parameter to copy a file and place into an evidence directory
param(

[parameter(Mandatory = $true)]
[int]$reportlib,

[parameter(Mandatory = $false)]
[string]$filepath

)

# create a directory wit the report number
$reportDir = "rpt$reportNo"

# create a new directory
mkdir $reportDir

# copy the file into the new directory
Copy-Item $filepath $reportDir
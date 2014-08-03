Import-Module C:\Batch\ship_functions.psm1
Import-Module C:\Batch\get-freespace.ps1

$fileList = "D:\freespace.txt"

get-freespace  

$shipname = name
$ip = shipnetwork
$emailrecipients = "ramil.aninang@odfjell.com"
$emailfrom = "freespace@$shipname.odfjell.com"
$emailserver = "10.37."+$ip+".2"
$subject = "Free Space on $shipname"
$body = "See attached document for more info"

Send-MailMessage -to $emailrecipients -from $emailfrom -smtpserver $emailserver `
        -Subject $subject -Body -$body -attachment $fileList
<#
Written by Federico Paras Sarmiento
Aug. 3, 2014
#>

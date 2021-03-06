function get-FreeSpace {    
    $outFile = "D:\freespace.txt"
    $drives = [system.io.driveinfo]::GetDrives()
    $output = @()
   

    foreach($drive in $drives) {
        if ( ($drive.DriveType -eq "Fixed") -and ($drive.IsReady -eq $true) ) {
            $freespace = [Math]::Round( ($drive.TotalFreeSpace / $drive.TotalSize) `
                    * 100.2 )
            $output += $drive.Name + " " + $freespace + "%"
        }   
    }
    $output | Out-File $fileLocation -append
}

$fileLocation = "E:\core.txt"

"1) Model" | Out-File $fileLocation
Get-WmiObject -class win32_ComputerSystem | Out-File $fileLocation -append
"2) Installed VMware Client Version" | Out-File $fileLocation -append
<# 
Get-WmiObject -Query "select * from win32_product where name='VMware vsphere Client 5.1' or name='VMware vsphere Client 5.0'" | Out-File $fileLocation -append
#>
"3) Event Logs (System) latest 100" | Out-File $fileLocation -append
Get-eventlog -EntryType Error -logname system -newest 100 | Format-table TimeGenerated, source, message -wrap | Out-File $fileLocation -append
"4) FileServer Drive Free Space in %" | Out-File $fileLocation -append
Get-FreeSpace 
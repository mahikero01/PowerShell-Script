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
    
    $output | set-content $OutFile
}
<#
Written by Federico Paras Sarmiento
Aug. 3, 2014
#>

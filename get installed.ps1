Function Get-Installed{ 
<# 
.Synopsis 
   This function will retrieve information related to all installed programs. 
.DESCRIPTION 
   This function checks you regestry for installed programs and then gives you a verbose output that is easy to read. 
.EXAMPLE 
   Get-Installed 
   This will retrieve a nice unformatted verbose output of all installed programs. 
.EXAMPLE 
   Get-Installed | Format-Table -Autosize 
   This will retrieve information related to all installed programs and output it as a tightly formated table. 
.ROLE 
   The role this cmdlet belongs to 
.FUNCTIONALITY 
   This cmdlet is best if ran against the a local computer with POwerShell v2.0+ installed. 
#> 
[CmdletBinding()] 
     
Param(  
       [Parameter(ValueFromPipelineByPropertyName=$true)] 
       $VerbosePreference = "Continue") 
 
Begin{ 
      $Host.PrivateData.VerboseForegroundColor = "Green" 
      $HKLM = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* 
     } 
 
Process{ 
        $Output = $HKLM | Select-Object DisplayName, DisplayVersion, Publisher,  
        @{ Name = "Installed On:" ; Expression = {[Datetime]::ParseExact($_.InstallDate,"yyyyMMdd",$null).ToShortDateString() } } |  
        Out-String 
       } 
 
End{ 
    Write-Verbose "$env:COMPUTERNAME $Output" 
   } 
} 
Get-Installed
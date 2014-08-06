#get all wmi objects
#Get-WmiObject -list
#Get-WmiObject win32_scheduledJob
#Get-WmiObject win32_service
#Get-ScheduledTasks
#Get-EventLog -log "application" -newest 100
#get-help Get-EventLog
$schedule = new-object -com("Schedule.Service") 
$schedule.connect() 
$tasks = $schedule.getfolder("\").gettasks(0)

$tasks 
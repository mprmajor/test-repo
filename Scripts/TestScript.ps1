$i = 0

While($i -lt 10)
{
$startTime = Get-Date
$waitTime = Get-Random -Minimum 0.1 -Maximum 29.9
Start-Sleep -Seconds $waitTime
$endTime = Get-Date
$elapsedTime = $endTime - $startTime
$elapsedTimeString = [string]$elapsedTime.TotalSeconds
$scriptTimekeepingObject = New-Object -TypeName PSObject
$scriptTimekeepingObject | Add-Member -MemberType NoteProperty -Name 'Script Name' -Value $MyInvocation.MyCommand.Name
$scriptTimekeepingObject | Add-Member -MemberType NoteProperty -Name 'Start Time' -Value $startTime
$scriptTimekeepingObject | Add-Member -MemberType NoteProperty -Name 'Elapsed Time' -Value $elapsedTimeString
$scriptTimekeepingObject | Export-CSV "C:\Users\mattm\OneDrive\Documents\Programming\PowerShell\Script Timings.csv" -Append -NoTypeInformation
$i++
}

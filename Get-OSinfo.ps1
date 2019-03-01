$Computername = Read-Host "Enter ComputerName:"
Get-CimInstance -ClassName Win32_OperatingSystem `
-ComputerName $Computername |
Select-Object -Property CSName.LastBootUpTime
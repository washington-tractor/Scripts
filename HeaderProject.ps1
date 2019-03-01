
$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session -DisableNameChecking  

pause 
clear

Write-Host "Enter your email address and two dates within 30 days from now.`n"

$UserEmail = Read-Host -Prompt 'Enter your WT email address'

$Date1 = Read-Host -Prompt 'Enter the first date (MM/DD/YYYY)'

$Date2 = Read-Host -Prompt 'Enter the second date (MM/DD/YYYY)'


$NewDate1 = [datetime]::parseexact($Date1, 'M/d/yyyy', $null)
$NewDate2 = [datetime]::parseexact($Date2, 'M/d/yyyy', $null) 

Get-MessageTrace -RecipientAddress $UserEmail -StartDate $NewDate1 -EndDate $NewDate2 | Format-List -Property Received,SenderAddress,MessageID

pause

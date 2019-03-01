$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session -DisableNameChecking 

pause
clear
Write-Host "Select Serach Method: `n1. Specific email address`n2. Wildcard "
$UserSelection = Read-Host "Your Selection"


$Email2 = Read-Host "Enter the first half of the email address "
clear

If ($UserSelection -eq '1'){
Get-MailBox $Email2'@washingtontractor.com' |Format-List -Property DisplayName, Alias, Office, RecipientTypeDetails, emailaddresses
}
ElseIf($UserSelection -eq '2'){
Get-MailBox *$Email2* |Format-List -Property DisplayName, Alias, Office, RecipientTypeDetails, emailaddresses
}
Else{
"Start Over"
}
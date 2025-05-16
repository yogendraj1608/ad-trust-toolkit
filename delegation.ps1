Get-ADUser -Filter * -Properties SIDHistory | Where-Object { $_.SIDHistory } | Out-File C:\SIDHistory.txt
Get-ADComputer -Filter {TrustedForDelegation -eq $True} -Properties TrustedForDelegation | Select Name | Out-File C:\UnconstrainedDelegation.txt

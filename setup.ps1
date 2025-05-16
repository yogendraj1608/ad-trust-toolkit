New-ADComputer -Name "WIN-ATTACKER" -SamAccountName "WIN-ATTACKER$" -UserPrincipalName "WIN-ATTACKER$@task1.local" -Path "CN=Computers,DC=task1,DC=local" -Enabled $true
$Password = ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force
Set-ADAccountPassword -Identity "WIN-ATTACKER$" -NewPassword $Password

New-ADComputer -Name "WIN-TARGET" -SamAccountName "WIN-TARGET$" -UserPrincipalName "WIN-TARGET$@task1.local" -Path "CN=Computers,DC=task1,DC=local" -Enabled $true

$attackerSID = (Get-ADComputer "WIN-ATTACKER$").SID
$targetComputer = Get-ADComputer "WIN-TARGET$"
Set-ADComputer $targetComputer -PrincipalsAllowedToDelegateToAccount @($attackerSID)

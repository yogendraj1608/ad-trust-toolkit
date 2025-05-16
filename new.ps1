Get-ADTrust -Filter * | Out-File C:\task1_trusts.txt
nltest /domain_trusts > C:\nltest_output.txt

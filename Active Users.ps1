# Import the Active Directory module
Import-Module ActiveDirectory

# Retrieve all enabled (active) user accounts
$activeUsers = Get-ADUser -Filter {Enabled -eq $true} -Properties SamAccountName

# Display only the SamAccountName (username) of active accounts
$activeUsers | Select-Object name,SamAccountName,userPrincipalName | Format-Table -AutoSize | out-file "[locations]\activeusers.txt"

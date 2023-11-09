#get list of active users
Get-ADUser -Filter {Enabled -eq $true} -Properties SamAccountName | Sort-Object -Property SamAccountName -Descending | Format-Table

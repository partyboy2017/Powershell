# Import the Active Directory module
Import-Module ActiveDirectory

# Get disabled users from the current location (adjust the base OU path accordingly)
$disabledUsers = Get-ADUser -Filter {Enabled -eq $false} -SearchBase "OU or highest level domain entered here"

# Specify the target OU
$targetOU = "Enter OU here to place disabled accounts"

# Move disabled users to the target OU
foreach ($user in $disabledUsers) {
    Move-ADObject -Identity $user.DistinguishedName -TargetPath $targetOU
    Write-Host "Moved user $($user.SamAccountName) to $targetOU"
}

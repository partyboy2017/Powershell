# Import Active Directory module
Import-Module ActiveDirectory

# Get all enabled users and export selected attributes
Get-ADUser -Filter 'Enabled -eq $true' -Properties `
    GivenName,
    Surname,
    StreetAddress,
    City,
    State,
    PostalCode,
    Mail,
    OfficePhone,
    Title,
    Department,
    Company |
Select-Object `
    @{Name='FirstName';Expression={$_.GivenName}},
    @{Name='LastName';Expression={$_.Surname}},
    @{Name='Address';Expression={$_.StreetAddress}},
    @{Name='State';Expression={$_.State}},
    @{Name='City';Expression={$_.City}},
    @{Name='Email';Expression={$_.Mail}},
    @{Name='TelephoneNumber';Expression={$_.OfficePhone}},
    @{Name='Zip';Expression={$_.PostalCode}},
    @{Name='Street';Expression={$_.StreetAddress}},
    @{Name='JobTitle';Expression={$_.Title}},
    @{Name='Department';Expression={$_.Department}},
    @{Name='Company';Expression={$_.Company}} |
Export-Csv -Path "C:\Temp\Enabled_AD_Users.csv" -NoTypeInformation -Encoding UTF8

Write-Host "Export completed: C:\Temp\Enabled_AD_Users.csv"

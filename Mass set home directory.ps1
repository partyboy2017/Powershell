# Replace "fileserver" with the actual name of your file server
$FileServer = "01-23dcfile01"

# Get all user objects from Active Directory
$Users = Get-ADUser -Filter *

# Loop through each user and set the home folder path based on the username
foreach ($User in $Users) {
    $UserName = $User.SamAccountName
    $HomeFolderPath = "\\$FileServer\Users\%username%"

    # Create the home folder directory if it doesn't exist
    New-Item -Path $HomeFolderPath -ItemType Directory -Force | Out-Null

    # Set the home folder path and drive letter for the user
    Set-ADUser -Identity $UserName -HomeDirectory $HomeFolderPath -HomeDrive "H:"
    Write-Host "Home folder set for user $UserName $HomeFolderPath"
}

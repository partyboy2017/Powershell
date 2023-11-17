# Specify the folder where you want to save the GPO reports
$reportFolder = "PATH"

# Create the folder if it doesn't exist
New-Item -ItemType Directory -Force -Path $reportFolder

# Get a list of all GPOs in your domain
$gpos = Get-GPO -All

# Loop through the list of GPOs and generate reports for each
foreach ($gpo in $gpos) {
    $reportName = $gpo.DisplayName -replace '[^\w\s]', ''  # Remove special characters from GPO name
    $reportPath = Join-Path -Path $reportFolder -ChildPath "$reportName.html"

    # Generate an HTML report for the GPO
    Get-GPOReport -Name $gpo.DisplayName -ReportType HTML -Path $reportPath
}

Write-Host "GPO reports have been generated and saved to $reportFolder."

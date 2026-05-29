# 1. Set Execution Policy for the current session
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# 2. Check for and install the Autopilot script if missing
if (!(Get-Command Get-WindowsAutopilotInfo -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Get-WindowsAutopilotInfo script..." -ForegroundColor Cyan
    Install-Script -Name Get-WindowsAutopilotInfo -Force
}

# 3. Get the current computer hostname
$ComputerName = $env:COMPUTERNAME
$FilePath = "$PSScriptRoot\$ComputerName.csv"

# 4. Generate the hardware hash CSV
Write-Host "Generating hardware hash for $ComputerName..." -ForegroundColor Yellow

Get-WindowsAutopilotInfo -OutputFile $FilePath

# 5. Confirm completion
if (Test-Path $FilePath) {
    Write-Host "Success! File saved as: $FilePath" -ForegroundColor Green
} else {
    Write-Host "Error: Failed to create the CSV file." -ForegroundColor Red
}
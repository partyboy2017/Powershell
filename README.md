# Powershell
Powershell scripts for Active Directory

In order for the connection to work please copy/pasta the following

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
$ScriptFromGitHub = Invoke-WebRequest -Uri "Filenamehere"
Invoke-Expression $($ScriptFromGitHub.Content)

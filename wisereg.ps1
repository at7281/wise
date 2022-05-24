$ErrorActionPreference = "SilentlyContinue"
 
if (!(Get-InstalledModule | Where-Object { $_.Name -eq "RunAsUser" })) {
    Write-Host "Not Installed. Installing"
    Install-Module RunAsUser -Force
}
 
$ScriptBlock = {
    winget install WiseCleaner.WiseRegistryCleaner --accept-source-agreements --source winget
}
 
Invoke-ASCurrentUser -ScriptBlock $ScriptBlock
 
Write-Host "Wise Registry Cleaner installed successfully."
 
Exit 0

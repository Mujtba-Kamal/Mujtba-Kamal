echo "Installing Enterprise Softwares Silently..."
Start-Process "msiexec.exe" -ArgumentList "/i \\EnterpriseServer\Apps\chrome.msi /qn" -Wait
Write-Host "✅ Google Chrome installed successfully."

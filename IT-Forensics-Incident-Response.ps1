\$ReportPath = "C:\IT-Support\Incident_Report.txt"
New-Item -ItemType File -Path \$ReportPath -Force

Add-Content \$ReportPath "=== INCIDENT RESPONSE REPORT ==="
Add-Content \$ReportPath "Generated on: \$(Get-Date)"

Add-Content \$ReportPath "`n[1] ACTIVE NETWORK CONNECTIONS (Netstat):"
Get-NetTCPConnection | Where-Object {$_.State -eq "Established"} | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort | Out-String | Add-Content $ReportPath

Add-Content $ReportPath "`n[2] RUNNING PROCESSES WITHOUT SIGNATURES:"
Get-Process | Where-Object {\$_.Company -eq null | Select-Object ProcessName, Id, Path | Out-String | Add-Content ReportPath

Write-Host "✅ Forensic Incident Report Generated at \$ReportPath" -ForegroundColor Crimson

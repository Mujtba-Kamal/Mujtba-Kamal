$Logs = Get-EventLog -List
foreach ($Log in $Logs) {
    Clear-EventLog -LogName $Log.LogDisplayName
}
Write-Host "🧹 All Windows Event Logs cleared successfully."

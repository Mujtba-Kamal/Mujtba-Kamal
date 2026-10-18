# Cyber Security Audit for Persistence Mechanisms
echo "🔍 Auditing Scheduled Tasks for suspicious paths..."
$ReportPath = "C:\IT-Support\Suspicious_Tasks_Report.csv"

# جلب المهام التي تشغل ملفات من مجلدات غير معتادة مثل Temp أو AppData
$SuspiciousTasks = Get-ScheduledTask | Where-Object {
    $_.Actions.Execute -like "*\AppData\*" -or 
    $_.Actions.Execute -like "*\Temp\*" -or 
    $_.Actions.Execute -like "*.bat" -or 
    $_.Actions.Execute -like "*.ps1"
}

if ($SuspiciousTasks) {
    $SuspiciousTasks | Select-Object TaskName, TaskPath, @{Name="ExecutePath";Expression={$_.Actions.Execute}} | 
        Export-Csv -Path $ReportPath -NoTypeInformation
    Write-Host "⚠️ Threat Hunt Complete: Found $($SuspiciousTasks.Count) suspicious tasks. Report saved to $ReportPath" -ForegroundColor Yellow
} else {
    Write-Host "✅ No suspicious scheduled tasks detected." -ForegroundColor Green
}

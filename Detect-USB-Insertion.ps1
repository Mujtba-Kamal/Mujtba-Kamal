$Query = "SELECT * FROM __InstanceCreationEvent WITHIN 2 WHERE TargetInstance ISA 'Win32_USBHub'"
Register-WmiEvent -Query $Query -Action {
    Write-Host "🚨 SECURITY ALERT: USB Flash Drive inserted into the server hardware!" -ForegroundColor Red
}

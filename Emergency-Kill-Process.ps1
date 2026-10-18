$TargetProcess = "suspicious_malware"
if (Get-Process -Name $TargetProcess -ErrorAction SilentlyContinue) {
    Stop-Process -Name $TargetProcess -Force
    Write-Host "🚨 Emergency: Terminated malicious process $TargetProcess!" -ForegroundColor Red
}

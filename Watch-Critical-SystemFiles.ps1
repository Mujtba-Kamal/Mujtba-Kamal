# File Integrity Monitoring (FIM) for Critical OS Files
$TargetFile = "C:\Windows\System32\drivers\etc\hosts"
$LogPath = "C:\IT-Support\FIM_Alerts.log"

# حساب الـ Hash الحالي للملف
$CurrentHash = (Get-FileHash -Path $TargetFile -Algorithm SHA256).Hash

echo "🛡️ File Integrity Monitor started for: $TargetFile"

# حلقة فحص مستمرة (يمكن تشغيلها كخدمة في الخلفية)
while ($true) {
    Start-Sleep -Seconds 60
    $CheckHash = (Get-FileHash -Path $TargetFile -Algorithm SHA256).Hash
    
    if ($CheckHash -ne $CurrentHash) {
        $AlertMessage = "$(Get-Date) | 🚨 SECURITY ALERT: Unauthorized modification detected on critical file: $TargetFile"
        Add-Content -Path $LogPath -Value $AlertMessage
        Write-Host $AlertMessage -ForegroundColor Red
        # تحديث الـ Hash للنسخة الجديدة بعد التنبيه
        $CurrentHash = $CheckHash
    }
}

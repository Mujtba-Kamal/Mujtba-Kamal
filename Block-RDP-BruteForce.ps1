# Automated RDP Brute Force Mitigation Script
Import-Module NetSecurity

echo "Analyzing Security Logs for Failed RDP Logins..."
# جلب أحداث تسجيل الدخول الفاشلة (Event ID 4625) في آخر ساعة
\$FailedLogins = Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625; StartTime=(Get-Date).AddHours(-1)} -ErrorAction SilentlyContinue

if (\$FailedLogins) {
    # تجميع الـ IPs التي فشلت أكثر من 5 مرات
    BadIPs = FailedLogins | ForEach-Object { \(_.Properties[19].Value } \vert{} Group-Object \vert{} Where-Object {\)_.Count -ge 5} | Select-Object -ExpandProperty Name
    
    foreach (IP in BadIPs) {
        if (\$IP -and IP -ne "-" -and IP -ne "127.0.0.1") {
            # إنشاء قاعدة في جدار الحماية لحظر الـ IP فوراً
            New-NetFirewallRule -DisplayName "Automated Block: Brute Force IP \$IP" `
                                -Direction Inbound `
                                -Action Block `
                                -RemoteAddress $IP `
                                -Enabled True
            Write-Host "🔒 Successfully Blocked Malicious IP: \$IP" -ForegroundColor Red
        }
    }
} else {
    Write-Host "✅ No malicious login attempts detected." -ForegroundColor Green
}

# Emergency Incident Response: Host Isolation Script
Import-Module NetSecurity

echo "🚨 INSTANT ISOLATION ACTIVATED FOR THIS HOST 🚨"

# 1. إنشاء قاعدة لحظر جميع الاتصالات الصادرة (Outbound)
New-NetFirewallRule -DisplayName "IR-Isolation-Block-All-Out" `
                    -Direction Outbound `
                    -Action Block `
                    -Enabled True

# 2. إنشاء قاعدة لحظر جميع الاتصالات الواردة (Inbound)
New-NetFirewallRule -DisplayName "IR-Isolation-Block-All-In" `
                    -Direction Inbound `
                    -Action Block `
                    -Enabled True

# 3. استثناء منفذ الـ Remote Desktop الخاص بالـ IT للدعم الفني فقط (مثلاً من جهاز الـ Admin)
New-NetFirewallRule -DisplayName "IR-Isolation-Allow-IT-Admin" `
                    -Direction Inbound `
                    -Action Allow `
                    -Protocol TCP `
                    -LocalPort 3389 `
                    -RemoteAddress "192.168.1.50" `
                    -Enabled True

Write-Host "🔒 Host is now completely isolated from the network except for IT Administration IP." -ForegroundColor Crimson

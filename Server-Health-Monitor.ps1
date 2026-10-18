# Server Health Monitoring Script for Enterprise Environments
$CpuThreshold = 90
$RamThreshold = 10  # 10% Free remaining
$Disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"

# Check CPU Load
$CpuLoad = (Get-CimInstance Win32_Processor).LoadPercentage
if ($CpuLoad -gt $CpuThreshold) {
    Send-MailMessage -To "it-alerts@yourdomain.com" -From "monitor@yourdomain.com" -Subject "CRITICAL: High CPU Usage on $(env:computername)" -Body "CPU Load is at $CpuLoad%" -SmtpServer "://yourdomain.com"
}

# Check Memory
$OS = Get-CimInstance Win32_OperatingSystem
$FreeRam = ($OS.FreePhysicalMemory / $OS.TotalVisibleMemorySize) * 100
if ($FreeRam -lt $RamThreshold) {
    Send-MailMessage -To "it-alerts@yourdomain.com" -From "monitor@yourdomain.com" -Subject "CRITICAL: Low Memory on $(env:computername)" -Body "Free RAM is below 10%" -SmtpServer "://yourdomain.com"
}

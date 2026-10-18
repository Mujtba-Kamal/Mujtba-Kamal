echo "=== System Information Report ==="
echo "---------------------------------"

# جلب اسم الجهاز ونوع الويندوز
Get-CimInstance Win32_OperatingSystem | Select-Object Caption, CSName, OSArchitecture

# جلب حجم الرام بالجيجابايت
$RAM = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB
echo "Total RAM: $RAM GB"

# جلب مساحة القرص C المتبقية
Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object @{Name="FreeSpace (GB)";Expression={"{0:N2}" -f ($_.FreeSpace / 1GB)}}

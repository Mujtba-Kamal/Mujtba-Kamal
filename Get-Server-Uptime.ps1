Get-CimInstance Win32_OperatingSystem | Select-Object CSName, @{Name="Uptime (Days)";Expression={[Math]::Round(((Get-Date) - $_.LastBootUpTime).TotalDays, 2)}}

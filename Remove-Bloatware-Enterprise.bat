@echo off
powershell -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *CandyCrush* | Remove-AppxPackage"
echo 🧹 Enterprise Bloatware Removed.
pause

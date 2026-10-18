@echo off
net stop wuauserv
net stop bits
rd /s /q %systemroot%\SoftwareDistribution
net start wuauserv
net start bits
echo ✅ Windows Update cache cleared and service restarted!
pause

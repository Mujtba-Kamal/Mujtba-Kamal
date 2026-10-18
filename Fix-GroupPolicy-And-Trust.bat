@echo off
echo === Advanced Group Policy & Domain Trust Repair Tool ===
echo.

echo [1/3] Forcing Group Policy Update...
gpupdate /force /boot

echo [2/3] Re-registering DNS Records for the Client...
ipconfig /registerdns

echo [3/3] Resetting Computer Account Password with Domain Controller...
nltest /sc_reset:yourdomain.com

echo.
echo ✅ Repair sequence executed. Please restart the workstation.
pause

@echo off
echo --- IT Support Maintenance Tool ---
echo.

echo [1/3] Clearing Temporary Files...
del /q /f /s %TEMP%\*
del /q /f /s C:\Windows\Temp\*

echo [2/3] Flushing DNS Cache (Fixing Internet issues)...
ipconfig /flushdns

echo [3/3] Scanning System Files for Errors...
sfc /scannow

echo.
echo ✅ Maintenance Completed Successfully!
pause

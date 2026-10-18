@echo off
echo === Ultimate Network Stack Reset Tool (Run as Admin) ===
echo.

echo [1/5] Resetting Winsock Catalogs...
netsh winsock reset

echo [2/5] Resetting TCP/IP Stack...
netsh int ip reset resetlog.txt

echo [3/5] Releasing IP Address...
ipconfig /release

echo [4/5] Renewing IP Address...
ipconfig /renew

echo [5/5] Flushing and Rebuilding DNS Cache...
ipconfig /flushdns
ipconfig /registerdns

echo.
echo ✅ Network stack fully rebuilt. System restart required.
shutdown /r /t 10

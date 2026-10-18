@echo off
xcopy "C:\Users\%username%\Desktop" "E:\UserBackup\Desktop\" /E /I /H /Y
xcopy "C:\Users\%username%\Documents" "E:\UserBackup\Documents\" /E /I /H /Y
echo 💾 Profile Data backed up to Drive E:
pause

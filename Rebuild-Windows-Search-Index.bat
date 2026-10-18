@echo off
net stop wsearch
del "%ProgramData%\Microsoft\Search\Data\Applications\Windows\Windows.edb"
net start wsearch
echo ✅ Search index wiped and rebuilding started.
pause

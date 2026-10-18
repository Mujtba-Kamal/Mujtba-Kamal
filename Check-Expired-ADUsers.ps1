Import-Module ActiveDirectory

echo "--- Searching for Locked Out AD Accounts ---"
# جلب الحسابات المغلقة بسبب كتابة الباسورد خطأ
Get-ADUser -Filter 'LockedOut -eq $true' | Select-Object Name, SamAccountName

echo "--- Searching for Users with Expired Passwords ---"
# جلب الحسابات التي انتهت صلاحية كلمة مرورها
Get-ADUser -Filter 'PasswordExpired -eq $true' | Select-Object Name, SamAccountName

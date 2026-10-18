Import-Module ActiveDirectory

# تحديد المدة (90 يوماً)
$DaysInactive = 90
$Time = (Get-Date).AddDays(-$DaysInactive)

# جلب الحسابات الخاملة
$InactiveUsers = Get-ADUser -Filter {LastLogonDate -le $Time -and Enabled -eq $true}

foreach ($User in $InactiveUsers) {
    # تعطيل الحساب
    Disable-ADAccount -Identity $User.SamAccountName
    # نقله إلى OU مخصصة للموظفين المغادرين
    Move-ADObject -Identity $User.DistinguishedName -TargetPath "OU=Disabled Users,DC=yourdomain,DC=com"
    
    Write-Host "🔒 Disabled & Moved Inactive User: $($User.SamAccountName)" -ForegroundColor Yellow
}

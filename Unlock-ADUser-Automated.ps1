Import-Module ActiveDirectory
$LockedUsers = Get-ADUser -Filter 'LockedOut -eq $true'
foreach ($User in $LockedUsers) {
    Unlock-ADAccount -Identity $User.SamAccountName
    Write-Host "🔓 Automatically unlocked user account: $($User.SamAccountName)" -ForegroundColor Green
}

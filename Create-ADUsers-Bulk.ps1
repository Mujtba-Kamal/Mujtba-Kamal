# Import Active Directory Module
Import-Module ActiveDirectory

# قائمة بالموظفين الجدد (يمكن ربطها بملف CSV لاحقاً)
\$NewUsers = @(
    [PSCustomObject]@{FirstName="Ahmad"; LastName="Ali"; Department="IT"; Username="a.ali"},
    [PSCustomObject]@{FirstName="Sarah"; LastName="Omar"; Department="HR"; Username="s.omar"}
)

foreach (\$User in \(NewUsers) {\)Password = ConvertTo-SecureString "P@ssword2026!" -AsPlainText -Force
    
    # أمر إنشاء المستخدم في الـ Active Directory
    New-ADUser -Name "(User.FirstName) (User.LastName)" `
               -SamAccountName \$User.Username `
               -UserPrincipalName "$($User.Username)@yourdomain.com" `
               -Department \$User.Department `
               -AccountPassword $Password `
               -Enabled \$true
               
    Write-Host "✅ Created User: (User.Username) in Department: (User.Department)" -ForegroundColor Green
}

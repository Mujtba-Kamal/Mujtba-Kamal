Import-Module ActiveDirectory

# حدد اسم المجموعة المراد فحص صلاحياتها هنا
$GroupName = "Domain Admins" 
$ExportPath = "C:\IT-Support\AD_Group_Report.csv"

echo "Extracting members for group: $GroupName..."

if (Get-ADGroup -Filter "Name -eq '$GroupName'") {
    # جلب الأعضاء وتصدير بياناتهم (الاسم، اسم المستخدم، القسم)
    Get-ADGroupMember -Identity $GroupName | 
        Get-ADUser -Properties Department | 
        Select-Object Name, SamAccountName, Department | 
        Export-Csv -Path $ExportPath -NoTypeInformation -Encoding UTF8
        
    Write-Host "✅ Audit Report Exported Successfully to: $ExportPath" -ForegroundColor Green
} else {
    Write-Warning "The group '$GroupName' does not exist in Active Directory."
}

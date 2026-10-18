# Updates Office location for IT department
Get-ADUser -Filter "Department -eq 'IT'" | Set-ADUser -Office "Main HQ - Floor 3"
Write-Host "✅ Bulk updated IT department office location."

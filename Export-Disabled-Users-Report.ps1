Get-ADUser -Filter 'Enabled -eq $false' -Properties WhenChanged | Select-Object Name, SamAccountName, WhenChanged | Export-Csv -Path "C:\IT-Support\Disabled_Users.csv" -NoTypeInformation

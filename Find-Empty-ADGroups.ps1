Find-Empty-ADGroups.ps1Import-Module ActiveDirectory
Get-ADGroup -Filter * | Where-Object {-not (Get-ADGroupMember -Identity $_.DistinguishedName)} | Select-Object Name, GroupScope

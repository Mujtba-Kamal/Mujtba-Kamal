Get-SmbShare | Where-Object {$_.Name -notlike "*$"} | Select-Object Name, Path, Description

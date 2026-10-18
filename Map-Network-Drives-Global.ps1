$net = New-Object -ComObject WScript.Network
$net.MapNetworkDrive("Z:", "\\EnterpriseServer\PublicShare")

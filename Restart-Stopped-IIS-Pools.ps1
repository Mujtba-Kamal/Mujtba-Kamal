Import-Module WebAdministration
$Pools = Get-WebAppPoolState
foreach ($Pool in $Pools) {
    if ($Pool.Value -ne "Started") {
        Start-WebAppPool -Name $Pool.ItemName
        Write-Host "♻️ Restarted crashed IIS Pool: $($Pool.ItemName)" -ForegroundColor Yellow
    }
}

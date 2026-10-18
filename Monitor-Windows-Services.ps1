$CriticalServices = @("DhcpServer", "DNS", "Spooler")
foreach ($Service in $CriticalServices) {
    $Status = (Get-Service -Name $Service).Status
    if ($Status -ne "Running") {
        Start-Service -Name $Service
        Write-Host "🚀 Critical Service $Service was stopped! Automatically restarted." -ForegroundColor Crimson
    }
}

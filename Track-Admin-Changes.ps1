$Events = Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4728} -ErrorAction SilentlyContinue
foreach ($Event in $Events) {
    Write-Host "⚠️ WARNING: A user was added to a privileged group! Event Details: $($Event.Message)" -ForegroundColor Red
}

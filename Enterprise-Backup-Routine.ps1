# Enterprise Automated Backup Script
$SourceDir = "C:\CompanyData"
$BackupStorage = "\\BackupServer\SharedFolder"
$Date = Get-Date -Format "yyyy-MM-dd"
$ZipFile = "$BackupStorage\Data_Backup_$Date.zip"

echo "Starting compression and backup routine..."
if (Test-Path $SourceDir) {
    # ضغط المجلد ونقله
    Compress-Archive -Path $SourceDir -DestinationPath $ZipFile -Force
    Write-Host "✅ Backup created successfully: $ZipFile" -ForegroundColor Green
    
    # تنظيف النسخ الاحتياطية القديمة (أقدم من 30 يوماً)
    Get-ChildItem -Path $BackupStorage -Filter "*.zip" | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item -Force
    Write-Host "🧹 Old backups cleaned up to save space." -ForegroundColor Yellow
} else {
    Write-Warning "Source directory not found. Backup failed."
}

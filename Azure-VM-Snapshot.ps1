# Azure Infrastructure Backup Automation
$ResourceGroupName = "Enterprise-Core-RG"
$VMName = "Production-SQL-Server"
$Location = "saudiarabiaeast" # منطقة السحاب الخاصة بالمملكة

echo "☁️ Connecting to Microsoft Azure Environment..."
# جلب بيانات السيرفر
$VM = Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName

if ($VM) {
    echo "💾 Creating Managed Snapshot for $VMName primary disk..."
    $SnapshotName = "Backup_Snapshot_$(Get-Date -Format 'yyyyMMdd')"
    $SnapshotConfig = New-AzSnapshotConfig -SourceUri $VM.StorageProfile.OsDisk.ManagedDisk.Id -Location $Location -CreateOption Copy
    
    # تنفيذ أمر النسخ الاحتياطي على السحاب
    New-AzSnapshot -ResourceGroupName $ResourceGroupName -SnapshotName $SnapshotName -Snapshot $SnapshotConfig
    Write-Host "✅ Azure cloud backup created successfully: $SnapshotName" -ForegroundColor Green
} else {
    Write-Error "Target Cloud VM not found."
}

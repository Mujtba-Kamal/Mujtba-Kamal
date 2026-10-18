# Azure Storage Metrics Audit
$ResourceGroupName = "Enterprise-Core-RG"
$StorageAccountName = "corporatedatastore"

echo "📊 Auditing Azure Cloud Storage Account utilization..."
$StorageAccount = Get-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageAccountName

if ($StorageAccount) {
    $Context = $StorageAccount.Context
    $Containers = Get-AzStorageContainer -Context $Context
    
    foreach ($Container in $Containers) {
        # جلب جميع الملفات داخل الحاوية وحساب حجمها
        $Blobs = Get-AzStorageBlob -Container $Container.Name -Context $Context
        $TotalSize = ($Blobs | Measure-Object -Property Length -Sum).Sum / 1MB
        
        Write-Host "📦 Container: $($Container.Name) | Total Utilized Space: [ $([Math]::Round($TotalSize, 2)) MB ]" -ForegroundColor Yellow
    }
}

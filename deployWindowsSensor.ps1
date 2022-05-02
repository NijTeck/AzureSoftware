Param([object]$WebhookData)

$eventData = (ConvertFrom-Json -InputObject $WebhookData.RequestBody)

if ($eventData.subject -match 'microsoft.compute/virtualmachines') {
    $vmName = $eventData.subject.Split('/')[8]
    $vmResourceGroupName = $eventData.subject.Split('/')[4]

    Connect-AzAccount -Identity 

    $storageAccountName = Get-AutomationVariable "StorageAccountName"
    $resourceGroupName = Get-AutomationVariable "ResourceGroupName"



## load file to storage account  and download file to windows system. 

    $ctx = (Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName).Context
 
    $sasUri = New-AzStorageBlobSASToken -Blob 'WindowsSensor.GovLaggar.exe' -Container software -Permission rwd -ExpiryTime (Get-Date).AddHours(72) -Context $ctx -FullUri

## Install Windows Sensor into the Windows Server 

     $scriptBlock = @'
$sasUri = "VALUE"
Invoke-WebRequest -Uri $sasUri -OutFile "$env:TEMP\WindowsSensor.GovLaggar.exe" -Verbose
Start-Process "$env:Temp\WindowsSensor.GovLaggar.exe" -ArgumentList "/quiet /norestart"  -Verbose
'@


    $scriptBlock | Out-File $env:Temp\script.ps1

    (Get-Content $env:Temp\script.ps1 -Raw) -replace "VALUE", $sasUri | Set-Content $env:Temp\script.ps1 -Force

    Invoke-AzVMRunCommand -ResourceGroupName $vmResourceGroupName -VMName $vmName -ScriptPath $env:Temp\script.ps1 -CommandId 'RunPowerShellScript' -Verbose
}
else {
    Write-Output "Event subject does not match microsoft.compute"
}

$params = @{
    resourceGroupName     = "Deployment" # <-- Change this value for the Resource Group Name
    storageAccountName    = "storagemitreaccount" # <-- Change this value - must be globally unique
    location              = "usgovvirginia" # <-- Change this value to a location you want
    automationAccountName = "MITREAutomateACC" # <-- Change this value for the Automation Account Name
}

New-AzResourceGroup -Name $params.resourceGroupName -Location 'usgovvirginia' -Force

Write-Host "Deploying Infrastructure" -ForegroundColor Green
New-AzResourceGroupDeployment -ResourceGroupName $params.resourceGroupName -TemplateFile .\deploy.bicep -TemplateParameterObject $params -Verbose

$ctx = (Get-AzStorageAccount -ResourceGroupName $params.resourceGroupName -StorageAccountName $params.storageAccountName).Context

$automationAccount = Get-AzAutomationAccount -ResourceGroupName $params.resourceGroupName -Name $params.automationAccountName

Write-Host "Uploading file to storage account" -ForegroundColor Green
Set-AzStorageBlobContent -File ./WindowsSensor.GovLaggar.exe -Blob "WindowsSensor.GovLaggar.exe" -Container "software" -Context $ctx -Force

Write-Host "Publishing runbook to automation account" -ForegroundColor Green
$automationAccount | Import-AzAutomationRunbook -Name deployWindowsSensor -Path .\deployWindowsSensor.ps1 -Type PowerShell -Force -Published

Write-Host "Generating webhook" -ForegroundColor Green
$wh = $automationAccount | New-AzAutomationWebhook -Name WH1 -ExpiryTime (Get-Date).AddYears(1) -RunbookName deployWindowsSensor -IsEnabled $true -Force

Write-Host "Deploying event grid subscription and software installation policy" -ForegroundColor Green
New-AzResourceGroupDeployment -ResourceGroupName $params.resourceGroupName `
    -TemplateFile .\eventgrid.bicep `
    -uri ($wh.WebhookURI | ConvertTo-SecureString -AsPlainText -Force) `
    -location $params.location `
    -topicName "PolicyStateChanges" `
    -Verbose


Write-Host "Deploying Policy Assignment Managed Identity" -ForegroundColor Green
# Use the $policyDef to get to the roleDefinitionIds array
$roleDefinitionIds = $policyDef.Properties.policyRule.then.details.roleDefinitionIds

if ($roleDefinitionIds.Count -gt 0)
{
    $roleDefinitionIds | ForEach-Object {
        $roleDefId = $_.Split("/") | Select-Object -Last 1
        New-AzRoleAssignment -Scope $resourceGroupName.ResourceId -ObjectId $assignment.Identity.PrincipalId -RoleDefinitionId $roleDefId
    }
}


    ##    Start-AzPolicyComplianceScan -ResourceGroupName SoftwareInstallation  ##    ## HKEY_LOCAL_MACHINE\SOFTWARE\CrowdStrike
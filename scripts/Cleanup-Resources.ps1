<#
.SYNOPSIS
    Cleans up all workshop Azure resources.

.DESCRIPTION
    Deletes ArcBox and Azure Migrate resource groups for all teams.
    Use with caution - this is destructive!

.PARAMETER Teams
    Array of team names to clean up.

.PARAMETER Confirm
    Skip confirmation prompt.

.PARAMETER WhatIf
    Show what would be deleted without actually deleting.

.EXAMPLE
    .\Cleanup-Resources.ps1 -Teams @("team1", "team2", "team3")

.EXAMPLE
    .\Cleanup-Resources.ps1 -Teams @("team1") -Confirm -WhatIf
#>

[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory = $true)]
    [string[]]$Teams,

    [switch]$Confirm
)

# Banner
Write-Host @"
╔══════════════════════════════════════════════════════════════╗
║         Azure Migration Workshop - Resource Cleanup           ║
╚══════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Red

Write-Host "`n⚠️  WARNING: This script will delete Azure resources!" -ForegroundColor Red
Write-Host "   The following resource groups will be deleted:" -ForegroundColor Yellow

# List resource groups
$resourceGroups = @()
foreach ($team in $Teams) {
    $arcboxRg = "rg-arcbox-$team"
    $migrateRg = "rg-migrate-$team"
    
    # Check if they exist
    $arcboxExists = az group exists --name $arcboxRg
    $migrateExists = az group exists --name $migrateRg
    
    if ($arcboxExists -eq "true") {
        Write-Host "   - $arcboxRg" -ForegroundColor Gray
        $resourceGroups += $arcboxRg
    }
    if ($migrateExists -eq "true") {
        Write-Host "   - $migrateRg" -ForegroundColor Gray
        $resourceGroups += $migrateRg
    }
}

if ($resourceGroups.Count -eq 0) {
    Write-Host "`n✅ No resource groups found to delete." -ForegroundColor Green
    exit
}

Write-Host "`n   Total: $($resourceGroups.Count) resource groups" -ForegroundColor Yellow

# Confirm
if (-not $Confirm) {
    $response = Read-Host "`nAre you sure you want to delete these resource groups? (yes/no)"
    if ($response -ne "yes") {
        Write-Host "Cleanup cancelled." -ForegroundColor Yellow
        exit
    }
}

# WhatIf mode
if ($WhatIfPreference) {
    Write-Host "`n[WhatIf] Would delete the following resource groups:" -ForegroundColor Cyan
    foreach ($rg in $resourceGroups) {
        Write-Host "   - $rg" -ForegroundColor Gray
    }
    exit
}

# Delete resource groups
Write-Host "`n🗑️  Deleting resource groups..." -ForegroundColor Yellow

$jobs = @()
foreach ($rg in $resourceGroups) {
    Write-Host "   Deleting $rg (async)..." -ForegroundColor Gray
    
    # Delete asynchronously
    az group delete --name $rg --yes --no-wait
    
    $jobs += @{
        ResourceGroup = $rg
        Status = "Deleting"
    }
}

Write-Host "`n⏳ Deletion initiated. Resource groups are being deleted in the background." -ForegroundColor Yellow
Write-Host "   This may take 10-20 minutes to complete." -ForegroundColor Gray

# Optional: Wait and verify
$waitForCompletion = Read-Host "`nWould you like to wait and verify deletion? (yes/no)"

if ($waitForCompletion -eq "yes") {
    Write-Host "`nWaiting for deletions to complete..." -ForegroundColor Yellow
    
    $allDeleted = $false
    $attempts = 0
    $maxAttempts = 30  # 30 minutes max wait
    
    while (-not $allDeleted -and $attempts -lt $maxAttempts) {
        Start-Sleep -Seconds 60
        $attempts++
        
        $allDeleted = $true
        foreach ($rg in $resourceGroups) {
            $exists = az group exists --name $rg
            if ($exists -eq "true") {
                $allDeleted = $false
                Write-Host "   ⏳ $rg still deleting... (attempt $attempts)" -ForegroundColor Gray
            }
            else {
                Write-Host "   ✅ $rg deleted" -ForegroundColor Green
            }
        }
    }
    
    if ($allDeleted) {
        Write-Host "`n✅ All resource groups deleted successfully!" -ForegroundColor Green
    }
    else {
        Write-Host "`n⚠️  Some resource groups may still be deleting. Check Azure portal." -ForegroundColor Yellow
    }
}

# Clean up local files
Write-Host "`n🧹 Cleaning up local files..." -ForegroundColor Yellow

$filesToClean = @(
    ".\workshop-scores.json",
    ".\workshop-credentials.txt"
)

foreach ($file in $filesToClean) {
    if (Test-Path $file) {
        $deleteFile = Read-Host "   Delete $file? (yes/no)"
        if ($deleteFile -eq "yes") {
            Remove-Item $file -Force
            Write-Host "   ✅ Deleted $file" -ForegroundColor Green
        }
    }
}

Write-Host "`n✅ Cleanup complete!" -ForegroundColor Green

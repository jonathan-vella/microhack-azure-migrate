<#
.SYNOPSIS
    Records scores for workshop teams.

.DESCRIPTION
    Helper script to track team scores throughout the workshop.
    Stores scores in a JSON file for leaderboard display.

.PARAMETER TeamName
    Name of the team to score.

.PARAMETER Challenge
    Challenge identifier (C0, C1, C2, C3, C4, C5, C6, C7).

.PARAMETER Score
    Points to award for this challenge.

.PARAMETER Notes
    Optional notes about the scoring.

.PARAMETER ScoreFile
    Path to the scores JSON file. Defaults to .\workshop-scores.json

.EXAMPLE
    .\Score-Team.ps1 -TeamName "team1" -Challenge "C1" -Score 20

.EXAMPLE
    .\Score-Team.ps1 -TeamName "team1" -Challenge "C2" -Score 25 -Notes "All VMs discovered"
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$TeamName,

    [Parameter(Mandatory = $true)]
    [ValidateSet("C0", "C1", "C2", "C3", "C4", "C5", "C6", "C7", "Bonus")]
    [string]$Challenge,

    [Parameter(Mandatory = $true)]
    [ValidateRange(0, 30)]
    [int]$Score,

    [Parameter(Mandatory = $false)]
    [string]$Notes = "",

    [Parameter(Mandatory = $false)]
    [string]$ScoreFile = ".\workshop-scores.json"
)

# Max points per challenge
$maxPoints = @{
    "C0" = 0
    "C1" = 25
    "C2" = 25
    "C3" = 20
    "C4" = 15
    "C5" = 10
    "C6" = 0
    "C7" = 5
    "Bonus" = 15
}

# Load existing scores or create new
if (Test-Path $ScoreFile) {
    $scores = Get-Content $ScoreFile | ConvertFrom-Json -AsHashtable
}
else {
    $scores = @{
        "metadata" = @{
            "workshop" = "Azure Migration Workshop"
            "created" = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
        }
        "teams" = @{}
    }
}

# Ensure team exists
if (-not $scores.teams.ContainsKey($TeamName)) {
    $scores.teams[$TeamName] = @{
        "name" = $TeamName
        "challenges" = @{}
        "total" = 0
    }
}

# Validate score
if ($Score -gt $maxPoints[$Challenge]) {
    Write-Warning "Score $Score exceeds max points ($($maxPoints[$Challenge])) for $Challenge. Capping at max."
    $Score = $maxPoints[$Challenge]
}

# Record score
$scores.teams[$TeamName].challenges[$Challenge] = @{
    "score" = $Score
    "max" = $maxPoints[$Challenge]
    "notes" = $Notes
    "timestamp" = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
}

# Calculate total
$total = 0
foreach ($ch in $scores.teams[$TeamName].challenges.Keys) {
    $total += $scores.teams[$TeamName].challenges[$ch].score
}
$scores.teams[$TeamName].total = $total

# Save scores
$scores | ConvertTo-Json -Depth 10 | Out-File $ScoreFile

# Display confirmation
Write-Host @"
╔══════════════════════════════════════════════════════════════╗
║                    Score Recorded                             ║
╚══════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Cyan

Write-Host "Team:      $TeamName" -ForegroundColor Yellow
Write-Host "Challenge: $Challenge" -ForegroundColor Yellow
Write-Host "Score:     $Score / $($maxPoints[$Challenge])" -ForegroundColor Green
if ($Notes) {
    Write-Host "Notes:     $Notes" -ForegroundColor Gray
}
Write-Host ""
Write-Host "Team Total: $total points" -ForegroundColor Cyan

# Show team's current standing
Write-Host "`nCurrent Scores for $TeamName:" -ForegroundColor Yellow
foreach ($ch in @("C1", "C2", "C3", "C4", "C5", "C7", "Bonus")) {
    if ($scores.teams[$TeamName].challenges.ContainsKey($ch)) {
        $chScore = $scores.teams[$TeamName].challenges[$ch]
        Write-Host "   $ch : $($chScore.score) / $($maxPoints[$ch])" -ForegroundColor Gray
    }
    else {
        Write-Host "   $ch : -- / $($maxPoints[$ch])" -ForegroundColor DarkGray
    }
}

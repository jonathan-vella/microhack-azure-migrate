<#
.SYNOPSIS
    Displays the workshop leaderboard.

.DESCRIPTION
    Reads team scores from the JSON file and displays a formatted leaderboard.

.PARAMETER ScoreFile
    Path to the scores JSON file. Defaults to .\workshop-scores.json

.PARAMETER Detailed
    Show detailed breakdown per challenge.

.EXAMPLE
    .\Get-Leaderboard.ps1

.EXAMPLE
    .\Get-Leaderboard.ps1 -Detailed
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$ScoreFile = ".\workshop-scores.json",

    [switch]$Detailed
)

# Check if score file exists
if (-not (Test-Path $ScoreFile)) {
    Write-Host "No scores file found. Use Score-Team.ps1 to record scores." -ForegroundColor Yellow
    exit
}

# Load scores
$scores = Get-Content $ScoreFile | ConvertFrom-Json -AsHashtable

# Sort teams by total score
$sortedTeams = $scores.teams.Values | Sort-Object -Property total -Descending

# Display header
Write-Host @"

╔══════════════════════════════════════════════════════════════════════════════╗
║                        🏆 WORKSHOP LEADERBOARD 🏆                             ║
╚══════════════════════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Cyan

# Display standings
$rank = 1
$medals = @("🥇", "🥈", "🥉")

Write-Host ""
Write-Host ("{0,-4} {1,-15} {2,-8} {3,-6} {4,-6} {5,-6} {6,-6} {7,-6} {8,-6} {9,-7}" -f "Rank", "Team", "Total", "C1", "C2", "C3", "C4", "C5", "C7") -ForegroundColor Yellow
Write-Host ("{0,-4} {1,-15} {2,-8} {3,-6} {4,-6} {5,-6} {6,-6} {7,-6} {8,-6} {9,-7}" -f "----", "----", "-----", "--", "--", "--", "--", "--", "--") -ForegroundColor Yellow

foreach ($team in $sortedTeams) {
    # Get individual challenge scores
    $c1 = if ($team.challenges.ContainsKey("C1")) { $team.challenges.C1.score } else { "-" }
    $c2 = if ($team.challenges.ContainsKey("C2")) { $team.challenges.C2.score } else { "-" }
    $c3 = if ($team.challenges.ContainsKey("C3")) { $team.challenges.C3.score } else { "-" }
    $c4 = if ($team.challenges.ContainsKey("C4")) { $team.challenges.C4.score } else { "-" }
    $c5 = if ($team.challenges.ContainsKey("C5")) { $team.challenges.C5.score } else { "-" }
    $c7 = if ($team.challenges.ContainsKey("C7")) { $team.challenges.C7.score } else { "-" }
    $bonus = if ($team.challenges.ContainsKey("Bonus")) { "+$($team.challenges.Bonus.score)" } else { "" }
    
    # Medal for top 3
    $medal = if ($rank -le 3) { $medals[$rank - 1] } else { "  " }
    
    # Color based on rank
    $color = switch ($rank) {
        1 { "Yellow" }
        2 { "White" }
        3 { "DarkYellow" }
        default { "Gray" }
    }
    
    $line = "{0,-4} {1,-15} {2,-8} {3,-6} {4,-6} {5,-6} {6,-6} {7,-6} {8,-6} {9,-7}" -f "$medal $rank", $team.name, "$($team.total)/100", $c1, $c2, $c3, $c4, $c5, $c7
    Write-Host $line -ForegroundColor $color
    
    $rank++
}

Write-Host ""

# Max points reference
Write-Host "Max Points:           100    25    25    20    15    10    5" -ForegroundColor DarkGray

# Detailed view
if ($Detailed) {
    Write-Host "`n" + "=" * 70 -ForegroundColor Cyan
    Write-Host "DETAILED BREAKDOWN" -ForegroundColor Cyan
    Write-Host "=" * 70 -ForegroundColor Cyan
    
    foreach ($team in $sortedTeams) {
        Write-Host "`n📋 $($team.name)" -ForegroundColor Yellow
        
        foreach ($ch in @("C1", "C2", "C3", "C4", "C5", "C7", "Bonus")) {
            if ($team.challenges.ContainsKey($ch)) {
                $chData = $team.challenges[$ch]
                $pct = if ($chData.max -gt 0) { [math]::Round(($chData.score / $chData.max) * 100) } else { 0 }
                $bar = "█" * [math]::Floor($pct / 10) + "░" * (10 - [math]::Floor($pct / 10))
                
                Write-Host ("   {0,-6} [{1}] {2,3}/{3,-3} ({4}%)" -f $ch, $bar, $chData.score, $chData.max, $pct) -ForegroundColor Gray
                
                if ($chData.notes) {
                    Write-Host "          └─ $($chData.notes)" -ForegroundColor DarkGray
                }
            }
        }
    }
}

Write-Host "`n" + "=" * 70 -ForegroundColor Cyan
Write-Host "Updated: $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor DarkGray

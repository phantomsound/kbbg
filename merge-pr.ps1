<#  merge-pr.ps1
    One-command PR merge helper for KBBG.

    Quick usage:
      ./merge-pr.ps1                         # merge newest origin/kbbg/* PR
      ./merge-pr.ps1 -Count 3                # merge 3 newest KBBG PRs (oldest->newest)
      ./merge-pr.ps1 -All                    # merge ALL origin/kbbg/* PRs
      ./merge-pr.ps1 -Branch kbbg/xyz        # merge a specific branch
      ./merge-pr.ps1 -PrNumber 42            # merge PR # via gh pr checkout
      ./merge-pr.ps1 -KeepBranch             # don't delete branches after merge
      ./merge-pr.ps1 -Pattern "kbbg/*next*" # filter branches by wildcard
      ./merge-pr.ps1 -DryRun                 # show what would happen

    Behavior:
      - Ensures clean tree (ignores changes to this script)
      - Fetches/prunes
      - Resolves branch list (Branch > PrNumber > Pattern/Count/All > newest kbbg/*)
      - For each branch (oldest→newest to minimize conflicts):
          * checkout/track
          * merge into main with `-X theirs`, push
          * optionally delete local+remote branch
      - Final status on main
#>

[CmdletBinding()]
param(
  [string] $Branch,
  [int]    $PrNumber,
  [switch] $All,
  [int]    $Count = 1,
  [string] $Pattern = "kbbg/*",
  [switch] $KeepBranch,
  [switch] $DryRun
)

$ErrorActionPreference = 'Stop'
$script:didSelfStash = $false

function Ensure-AtRepoRoot {
  if (-not (Test-Path ".git")) { throw "Run from repo root ('.git' required). Current: $(Get-Location)" }
}

function AutoStash-ThisScript {
  $selfDirty = git status --porcelain | Where-Object { $_ -match "\smerge-pr\.ps1$" }
  if ($selfDirty) { git stash push -m "auto: merge-pr.ps1" -- merge-pr.ps1 | Out-Host; $script:didSelfStash = $true }
}

function AutoUnstash-ThisScript {
  if ($script:didSelfStash) { try { git stash pop | Out-Host } catch {} }
}

function Assert-CleanTree {
  $status = git status --porcelain | Where-Object { $_ -notmatch "\smerge-pr\.ps1$" }
  if ($status) { throw "Working tree not clean (excluding merge-pr.ps1). Stash/commit first.`n$($status -join "`n")" }
}

function Fetch-All { git fetch --all --prune | Out-Host }

function Resolve-Branches {
  param([string]$Branch, [int]$PrNumber, [switch]$All, [int]$Count, [string]$Pattern)

  if ($Branch) { return @($Branch) }

  if ($PrNumber) {
    try {
      gh pr checkout $PrNumber | Out-Host
      $b = (git branch --show-current).Trim()
      if (-not $b) { throw "gh pr checkout didn't set a current branch." }
      return @($b)
    } catch { throw "Failed to checkout PR #$PrNumber via gh. $_" }
  }

  $remotes = git for-each-ref --sort=-committerdate --format='%(refname:short)' "refs/remotes/origin/$Pattern"
  if (-not $remotes) { throw "No origin/$Pattern branches found." }

  $short = $remotes | ForEach-Object { $_ -replace '^origin/','' }
  if ($All) { return $short }
  return $short | Select-Object -First $Count
}

function Checkout-Tracking {
  param([string]$Branch)
  $exists = ((git branch --list $Branch) | Out-String).Trim().Length -gt 0
  if (-not $exists) {
    git switch -c $Branch --track origin/$Branch | Out-Host
  } else {
    git switch $Branch | Out-Host
    git branch --set-upstream-to=origin/$Branch $Branch | Out-Host
    git pull | Out-Host
  }
}

function Merge-To-Main {
  param([string]$Branch, [switch]$DryRun)
  git switch main | Out-Host
  git pull origin main | Out-Host
  if ($DryRun) { Write-Host "[DRYRUN] would: git merge --no-edit -X theirs $Branch" -ForegroundColor Yellow; return }
  git merge --no-edit -X theirs $Branch | Out-Host
  git push origin main | Out-Host

  $local = (git rev-parse HEAD).Trim()
  $remote = (git rev-parse origin/main).Trim()
  if ($local -ne $remote) { throw "Post-merge SHA mismatch. Local: $local  Remote: $remote" }
}

function Cleanup-Branch {
  param([string]$Branch, [switch]$Keep)
  if ($Keep) { return }
  try { git branch -d $Branch | Out-Host } catch {}
  try { git push origin --delete $Branch | Out-Host } catch {}
}

try {
  Ensure-AtRepoRoot
  AutoStash-ThisScript
  Assert-CleanTree
  Fetch-All

  $branches = Resolve-Branches -Branch $Branch -PrNumber $PrNumber -All:$All -Count:$Count -Pattern $Pattern
  $branches = @($branches)[-1..-($branches.Count)]

  Write-Host "`n>>> Will process branches (oldest→newest):" -ForegroundColor Cyan
  $branches | ForEach-Object { Write-Host " - $_" -ForegroundColor Cyan }

  foreach ($b in $branches) {
    Write-Host "`n=== Processing $b ===" -ForegroundColor Green
    Checkout-Tracking -Branch $b
    Merge-To-Main -Branch $b -DryRun:$DryRun
    if (-not $DryRun) { Cleanup-Branch -Branch $b -Keep:$KeepBranch }
    Fetch-All
  }

  git switch main | Out-Host

  Write-Host "`n✅ Done. main is up to date." -ForegroundColor Green
  Write-Host "   You can run: ./start-kbbg.ps1" -ForegroundColor DarkGray
}
catch {
  Write-Host "`n❌ Error: $($_.Exception.Message)" -ForegroundColor Red
  Write-Host "   If an editor opened, press Esc then :wq Enter to continue."
  exit 1
}
finally {
  AutoUnstash-ThisScript
}

<#
.SYNOPSIS
	Cherry-picks a Git commit into one or more branches
.DESCRIPTION
	Cherry-picks a Git commit into one or more branches (branch names need to be separated by spaces)
	NOTE: in case of merge conflicts the script stops immediately! 
.PARAMETER CommitID
	Specifies the commit ID
.PARAMETER CommitMessage
	Specifies the commit message to use
.PARAMETER Branches
	Specifies the list of branches, separated by spaces
.PARAMETER RepoDir
	Specifies the path to the Git repository
.EXAMPLE
	PS> ./push-repo 93849f889 "Fix typo" "v1 v2 v3"
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

param([string]$CommitMessage = "", [string]$RepoDir = "$PWD")

try {
	
		if (-not(Test-Path "$RepoDir" -pathType container)) { throw "Can't access directory: $RepoDir" }
		Set-Location "$RepoDir"

	    if ($CommitMessage -eq "") { $CommitMessage = read-host "Enter the commit message to use" }
	
	    $StopWatch = [system.diagnostics.stopwatch]::startNew()
	
		"🍒 Add Files to commit..."
		& git add .
		if ($lastExitCode -ne "0") { throw "'git add files ' failed" }

		"🍒 Committing..."
		& git commit -m "$CommitMessage"
		if ($lastExitCode -ne "0") { throw "'git commit' failed" }

		"🍒 Pushing..."
		& git push
		if ($lastExitCode -ne "0") { throw "'git push' failed" }
	
	[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
	"✔️ Push repository in $Elapsed sec"
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
<#

#>

param([string]$CommitMessage = "", [string]$RepoDir = "$PWD")

try {
	
		if (-not(Test-Path "$RepoDir" -pathType container)) { throw "Can't access directory: $RepoDir" }
		Set-Location "$RepoDir"

	    if ($CommitMessage -eq "") { $CommitMessage = read-host "Enter the commit message to use" }
	
	    $StopWatch = [system.diagnostics.stopwatch]::startNew()
	
		"⏳ Add Files to commit..."
		& git add .
		if ($lastExitCode -ne "0") { throw "'git add files ' failed" }

		"⏳ Committing..."
		& git commit -m "$CommitMessage"
		if ($lastExitCode -ne "0") { throw "'git commit' failed" }

		"⏳ Pushing..."
		& git push		
		if ($lastExitCode -ne "0") { throw "'git push' failed" }
	
	[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
	"✔️ Push repository in $Elapsed sec"
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
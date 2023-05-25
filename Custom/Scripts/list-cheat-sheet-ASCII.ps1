<#

#>

try {
	
	& Show-Markdown -Path "$PSScriptRoot/../Data/Cheat-Sheet-ASCII.md"

	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
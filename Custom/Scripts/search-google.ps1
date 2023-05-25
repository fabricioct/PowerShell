<#

#>

param([string]$SearchMessage = "")

try {
	
   if ($SearchMessage -eq "") { $SearchMessage = read-host "Enter the message to search" }
	
	& "$PSScriptRoot/../../Scripts/open-default-browser.ps1" "https://www.google.com/search?q=$SearchMessage"

	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
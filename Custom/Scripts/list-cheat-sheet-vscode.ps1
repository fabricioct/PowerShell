<#

#>
param([bool]$OpenFile = $false)

try {
	
	if($OpenFile){ 	
		& Invoke-Item  "$PSScriptRoot/../Data/Cheat-Sheet-vs-code.md"
		exit 0 # success
	}

        & Write-Host "`r"	
	& Show-Markdown -Path "$PSScriptRoot/../Data/Cheat-Sheet-vs-code.md"

	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
<#

#>

try {

	& Invoke-Item (Get-PSReadlineOption).HistorySavePath;
	
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}

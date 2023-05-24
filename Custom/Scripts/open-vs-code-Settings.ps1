<#

#>

try {
	
	Invoke-Item $env:APPDATA\Code\User\settings.json;
	
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}

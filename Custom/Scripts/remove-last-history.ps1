<#

#>

try {



	(Get-Content (Get-PSReadlineOption).HistorySavePath | Select-Object -SkipLast 1) | Set-Content (Get-PSReadlineOption).HistorySavePath -Encoding UTF8

	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}

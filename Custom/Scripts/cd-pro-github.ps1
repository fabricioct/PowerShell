<#

#>

try {
	if ($IsLinux) {	$Path = "/" } else { $Path = "C:\Projetos\GitHub" }
	Set-Location "$Path"
	"📂$Path"
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}

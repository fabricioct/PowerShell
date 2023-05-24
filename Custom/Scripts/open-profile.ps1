<#

#>

try {
	
	Start-Process notepad++.exe $env:USERPROFILE\.config\powershell\user_profile.ps1;
	
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}

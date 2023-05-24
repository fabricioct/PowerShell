<#

#>

try {
	$Table = Import-CSV "$PSScriptRoot/../Data/jokes-pt-br.csv"

	$Generator = New-Object System.Random
	$Index = [int]$Generator.next(0, $Table.Count - 1)
	$Reply = $Table[$Index].Joke

	& "$PSScriptRoot/../../Scripts/speak-portuguese.ps1" "$Reply"
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}

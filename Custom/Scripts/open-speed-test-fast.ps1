﻿<#
.SYNOPSIS
	Opens Cloudflare's Speed Test
.DESCRIPTION
	This script launches the Web browser with Cloudflare's speed test website.
.EXAMPLE
	PS> ./open-speed-test
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

& "$PSScriptRoot/../../Scripts/open-default-browser.ps1" "https://fast.com/pt/"
exit 0 # success

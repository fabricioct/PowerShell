﻿<#
.SYNOPSIS
	Writes animated text
.DESCRIPTION
	This PowerShell script writes animated text.
.EXAMPLE
	PS> ./write-animated "Hello World"
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

param($Line1 = "", $Line2 = "", $Line3 = "", $Line4 = "", $Line5 = "", $Line6 = "", $Line7 = "", $Line8 = "", $Line9 = "", [int]$Speed = 30) # 30 ms pause

$TerminalWidth = 120 # characters

function WriteLine { param([string]$Line)
	[int]$Start = 1
	[int]$End = $Line.Length
	$StartPosition = $HOST.UI.RawUI.CursorPosition
	$Spaces = "                                                                     "

	if ($Line -eq "") { return }
	foreach ($Pos in $Start .. $End) {
		$TextToDisplay = $Spaces.Substring(0, $TerminalWidth / 2 - $pos / 2) + $Line.Substring(0, $Pos)
		Write-Host $TextToDisplay -noNewline
		Start-Sleep -milliseconds $Speed
		$HOST.UI.RawUI.CursorPosition = $StartPosition
	}
	Write-Host ""
}

if ($Line1 -eq "") {
	$Line1 = "Welcome to PowerShell Scripts"
	$Line2 = " "
	$Line3 = "This repository contains useful and cross-platform PowerShell scripts."
	$Line4 = " "
	$Line5 = "Best regards,"
	$Line6 = "Markus"
}

WriteLine $Line1 
WriteLine $Line2 
WriteLine $Line3 
WriteLine $Line4 
WriteLine $Line5 
WriteLine $Line6 
WriteLine $Line7
WriteLine $Line8
WriteLine $Line9
exit 0 # success

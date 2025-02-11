## The *write-animated.ps1* Script

This PowerShell script writes animated text.

## Parameters
```powershell
/home/mf/Repos/PowerShell/Scripts/write-animated.ps1 [[-Line1] <Object>] [[-Line2] <Object>] [[-Line3] <Object>] [[-Line4] <Object>] [[-Line5] <Object>] [[-Line6] <Object>] [[-Line7] <Object>] [[-Line8] <Object>] [[-Line9] <Object>] [[-Speed] <Int32>] [<CommonParameters>]

-Line1 <Object>
    
    Required?                    false
    Position?                    1
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false

-Line2 <Object>
    
    Required?                    false
    Position?                    2
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false

-Line3 <Object>
    
    Required?                    false
    Position?                    3
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false

-Line4 <Object>
    
    Required?                    false
    Position?                    4
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false

-Line5 <Object>
    
    Required?                    false
    Position?                    5
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false

-Line6 <Object>
    
    Required?                    false
    Position?                    6
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false

-Line7 <Object>
    
    Required?                    false
    Position?                    7
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false

-Line8 <Object>
    
    Required?                    false
    Position?                    8
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false

-Line9 <Object>
    
    Required?                    false
    Position?                    9
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false

-Speed <Int32>
    
    Required?                    false
    Position?                    10
    Default value                30
    Accept pipeline input?       false
    Accept wildcard characters?  false

[<CommonParameters>]
    This script supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

## Example
```powershell
PS> ./write-animated "Hello World"

```

## Notes
Author: Markus Fleschutz | License: CC0

## Related Links
https://github.com/fleschutz/PowerShell

## Source Code
```powershell
<#
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

function WriteLine { param([string]$Line, [int]$Speed)
	[int]$Start = 1
	[int]$End = $Line.Length
	$StartPosition = $HOST.UI.RawUI.CursorPosition
	$Spaces = "                                                                     "

	if ($Line -eq "") { return }
	foreach ($Pos in $Start .. $End) {
		$TextToDisplay = $Spaces.Substring(0, $TerminalWidth / 2 - $pos / 2) + $Line.Substring(0, $Pos)
		write-host -nonewline $TextToDisplay
		start-sleep -milliseconds $Speed
		$HOST.UI.RawUI.CursorPosition = $StartPosition
	}
	write-host ""
}

if ($Line1 -eq "") {
	$Line1 = "Welcome to PowerShell Scripts"
	$Line2 = " "
	$Line3 = "This repository contains useful and cross-platform PowerShell scripts."
	$Line4 = " "
	$Line5 = "Best regards,"
	$Line6 = "Markus"
}

WriteLine $Line1 $Speed
WriteLine $Line2 $Speed
WriteLine $Line3 $Speed
WriteLine $Line4 $Speed
WriteLine $Line5 $Speed
WriteLine $Line6 $Speed
WriteLine $Line7 $Speed
WriteLine $Line8 $Speed
WriteLine $Line9 $Speed
exit 0 # success
```

*Generated by convert-ps2md.ps1 using the comment-based help of write-animated.ps1*

$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Set-Alias -Name cat -Value bat -Option AllScope

# Use lsd instead of raw ls
Set-Alias -Name ls -Value lsd -Option AllScope

Function Lsd-L { lsd -l @args }
New-Alias -Name ll -Value Lsd-L

Function Lsd-A { lsd -a @args }
New-Alias -Name la -Value Lsd-A

Function Lsd-LA { lsd -la @args }
New-Alias -Name lla -Value Lsd-LA

Function Lsd-Tree { lsd --tree @args }
New-Alias -Name lt -Value Lsd-Tree
# ---

# --- PSReadLine ---
# Installation: `Install-Module PSReadLine`
Import-Module PSReadLine

# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Autocompleteion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History
# --- PSReadLine ---

if (Test-Path "C:\Users\XLor\.jabba\jabba.ps1") { . "C:\Users\XLor\.jabba\jabba.ps1" }
jabba use "openjdk@1.11.0"

Invoke-Expression (&starship init powershell)

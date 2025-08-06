$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# --- lsd start ---
Set-Alias -Name cat -Value bat -Option AllScope

Set-Alias -Name ls -Value lsd -Option AllScope

Function Get-LsdL { lsd -l @args }
New-Alias -Name ll -Value Get-LsdL

Function Get-LsdA { lsd -a @args }
New-Alias -Name la -Value Get-LsdA

Function Get-LsdLA { lsd -la @args }
New-Alias -Name lla -Value Get-LsdLA

Function Get-LsdTree { lsd --tree @args }
New-Alias -Name lt -Value Get-LsdTree
# --- lsd end ---

# Function Setup_Fnm {
#   fnm env --use-on-cd | Out-String | Invoke-Expression
#   Write-Output "node: $(node --version)"
#   Write-Output "npm:  v$(npm --version)"
# }
# New-Alias -Name setup-fnm -Value Setup_Fnm

# fnm env --use-on-cd | Out-String | Invoke-Expression

# mise start
$shimPath = "$env:USERPROFILE\AppData\Local\mise\shims"
$currentPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$newPath = $currentPath + ";" + $shimPath
[Environment]::SetEnvironmentVariable('Path', $newPath, 'User')
# mise end

if ($env:WT_SESSION) {
  # --- PSReadLine ---
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

  Invoke-Expression (&starship init powershell)
}

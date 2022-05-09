$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Set-Alias -Name cat -Value bat -Option AllScope

# Use lsd instead of raw ls
Set-Alias -Name ls -Value lsd -Option AllScope

Function Lsd-L { lsd -l }
New-Alias -Name ll -Value Lsd-L

Function Lsd-A { lsd -a }
New-Alias -Name la -Value Lsd-A

Function Lsd-LA { lsd -la }
New-Alias -Name lla -Value Lsd-LA

Function Lsd-Tree { lsd --tree }
New-Alias -Name lt -Value Lsd-Tree
# ---

if (Test-Path "C:\Users\XLor\.jabba\jabba.ps1") { . "C:\Users\XLor\.jabba\jabba.ps1" }
jabba use "openjdk@1.11.0"

Invoke-Expression (&starship init powershell)

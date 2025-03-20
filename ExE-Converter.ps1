# ======================================================#
#         ___  _   _ __   __ _____  _   _  _____ 
#        /   || \ | |\ \ / /|  _  || \ | ||  ___|
#       / /| ||  \| | \ V / | | | ||  \| || |__
#      / /_| || . ` |  \ /  | | | || . ` ||  __|
#      \___  || |\  |  | |  \ \_/ /| |\  || |___
#          |_/\_| \_/  \_/   \___/ \_| \_/\____/
#     Follow me on github: https://github.com/4NYONEx                                    
# ======================================================#

$ps1Path = Read-Host "Enter the full path of the PS1 file. (Example: .\path\script.ps1)"
$exePath = Read-Host "Enter the full path where the EXE will be saved. (Example: .\path\script.exe)"

if (-Not (Test-Path $ps1Path)) {
    Write-Host "Error: The PS1 file was not found!"
    exit
}

Write-Host "Converting $ps1Path to $exePath..."
Start-Process -NoNewWindow -Wait -FilePath "powershell" -ArgumentList "-Command ps2exe `"$ps1Path`" `"$exePath`""

if (Test-Path $exePath) {
    Write-Host "Conversion completed successfully! The EXE file was created at: $exePath"
}
else {
    Write-Host "Error creating the EXE."
}

Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
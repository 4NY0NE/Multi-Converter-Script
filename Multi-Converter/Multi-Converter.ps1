# ======================================================#
#         ___  _   _ __   __ _____  _   _  _____ 
#        /   || \ | |\ \ / /|  _  || \ | ||  ___|
#       / /| ||  \| | \ V / | | | ||  \| || |__
#      / /_| || .  |  \ /  | | | || .  ||  __|
#      \___  || |\  |  | |  \ \_/ /| |\  || |___
#          |_/\_| \_/  \_/   \___/ \_| \_/\____/
#     Follow me on github: https://github.com/4NYONEx
# ======================================================#

Write-Host "#======================================================#"
Write-Host "#              Multi-Converter.ps1                    #"
Write-Host "#======================================================#"

do {
    Write-Host "Choose an option:"
    Write-Host "1 - Convert PS1 to EXE"
    Write-Host "2 - Convert PY to EXE"
    Write-Host "3 - Convert C++ to EXE"
    Write-Host "0 - Exit"
    
    $option = Read-Host "Enter your choice"
    
    switch ($option) {
        "1" {
            $ps1Path = Read-Host "Enter the full path of the PS1 file"
            $exePath = Read-Host "Enter the full path where the EXE will be saved"
            
            if (-Not (Test-Path $ps1Path)) {
                Write-Host "Error: The PS1 file was not found!"
                continue
            }
            
            $addIcon = Read-Host "Do you want to add an icon to the EXE? (Y/N)"
            if ($addIcon -eq 'Y') {
                $iconPath = Read-Host "Enter the full path of the icon file (Example: .\path\icon.ico)"
                if (-Not (Test-Path $iconPath)) {
                    Write-Host "Error: The icon file was not found!"
                    continue
                }
                $iconArgument = "-icon `"$iconPath`""
            }
            else {
                $iconArgument = ""
            }

            Import-Module ps2exe
            Start-Process -NoNewWindow -Wait -FilePath "powershell" -ArgumentList "-ExecutionPolicy Bypass -Command ps2exe `"$ps1Path`" `"$exePath`" $iconArgument"
            
            if (Test-Path $exePath) {
                Write-Host "Conversion completed successfully!"
            }
            else {
                Write-Host "Error creating the EXE."
            }
        }
        "2" {
            $pyPath = Read-Host "Enter the full path of the PY file"
            $exePath = Read-Host "Enter the full path where the EXE will be saved"
            
            if (-Not (Test-Path $pyPath)) {
                Write-Host "Error: The PY file was not found!"
                continue
            }

            $addIcon = Read-Host "Do you want to add an icon to the EXE? (Y/N)"
            if ($addIcon -eq 'Y') {
                $iconPath = Read-Host "Enter the full path of the icon file (Example: .\path\icon.ico)"
                if (-Not (Test-Path $iconPath)) {
                    Write-Host "Error: The icon file was not found!"
                    continue
                }
                $iconArgument = "--icon=`"$iconPath`""
            }
            else {
                $iconArgument = ""
            }

            Write-Host "Converting $pyPath to $exePath..."
            Start-Process -NoNewWindow -Wait -FilePath "pyinstaller" -ArgumentList "--onefile --noconsole $iconArgument `"$pyPath`""
            
            if (Test-Path "$exePath") {
                Write-Host "Conversion completed successfully!"
            }
            else {
                Write-Host "Error creating the EXE."
            }
        }
        "3" {
            $cppPath = Read-Host "Enter the full path of the C++ file"
            $exePath = Read-Host "Enter the full path where the EXE will be saved"
            
            if (-Not (Test-Path $cppPath)) {
                Write-Host "Error: The C++ file was not found!"
                continue
            }
            
            $addIcon = Read-Host "Do you want to add an icon to the EXE? (Y/N)"
            if ($addIcon -eq 'Y') {
                $iconPath = Read-Host "Enter the full path of the icon file (Example: .\path\icon.ico)"
                if (-Not (Test-Path $iconPath)) {
                    Write-Host "Error: The icon file was not found!"
                    continue
                }
                $iconArgument = "-o `"$exePath`" --icon=`"$iconPath`""
            }
            else {
                $iconArgument = "-o `"$exePath`""
            }

            Write-Host "Converting $cppPath to $exePath..."
            Start-Process -NoNewWindow -Wait -FilePath "g++" -ArgumentList "`"$cppPath`" $iconArgument"
            
            if (Test-Path "$exePath") {
                Write-Host "Conversion completed successfully!"
            }
            else {
                Write-Host "Error creating the EXE."
            }
        }
        "0" {
            Write-Host "Exiting the script."
        }
        default {
            Write-Host "Invalid option! Please try again."
        }
    }
} while ($option -ne "0")

# parameters:
#    ConfigFile - text file containing "Advanced Configuration Options" to add to config.txt
#    Dir - location where program files should be extracted to
#    OutFolder - name of folder to be created in the directory
param(
    [string]$ConfigFile = "",
    [string]$Dir = ".",
    [string]$OutFolder = "parsec-flat-windows32"
)

# create directory and folder
New-Item "$Dir\$OutFolder" -ItemType Directory -Force | Out-Null

# download the latest build of the portable version (32 bit) of parsec
Invoke-WebRequest "https://builds.parsecgaming.com/package/parsec-flat-windows32.zip" -OutFile "$Dir\$OutFolder\$OutFolder.zip"

# extract the downloaded zip and then remove it
Expand-Archive "$Dir\$OutFolder\$OutFolder.zip" "$Dir\$OutFolder" -Force
Remove-Item "$Dir\$OutFolder\$OutFolder.zip" -Force

# check if a config file is passed, if so then append its settings to config.txt
if ($ConfigFile -and (Test-Path "$ConfigFile")){
    Get-Content "$ConfigFile" | Add-Content "$Dir\$OutFolder\config.txt"
}

# run parsec
Start-Process parsecd.exe -WorkingDirectory "$Dir\$OutFolder"
# clean previous files if needed
Remove-Item .\parsec.zip -ErrorAction Ignore -Force
Remove-Item .\parsec -Force -Recurse -ErrorAction Ignore

# download the latest build of the portable version (32 bit) of parsec
Invoke-WebRequest https://builds.parsecgaming.com/package/parsec-flat-windows32.zip -OutFile .\parsec.zip

# extract the downloaded zip and then delete it
Expand-Archive .\parsec.zip .\parsec
Remove-Item .\parsec.zip

# run parsec
Start-Process parsecd.exe -WorkingDirectory .\parsec
# quick-parsec-deploy


A simple Windows PowerShell script to download and run the latest portable version of
<a href="https://parsec.app/downloads">Parsec <img src="https://imgur.com/3QEwVvy.png" width=20 height=20></a>
 on any Windows 10/11 computer with a single command
 ##


### usage:
clone this repository, open PowerShell (5.1 or greater), and run
```powershell
main.ps1 [[-ConfigFile] <string>] [[-LoginFile] <string>] [[-Dir] <string>] [[-OutFolder] <string>]
```

- #### optional parameters 
```powershell
# ConfigFile - text file containing "Advanced Configuration Options" to add to config.txt
# LoginFile - bin file containing Parsec user login token to autologin
# Dir - location where program files should be extracted to
# OutFolder - name of folder to be created in the directory
```
parameters can be more easily called with its initial letter `[ -C | -L | -D | -O ]`
##


### examples:
- #### set initial state of Parsec's [config.txt](https://support.parsec.app/hc/en-us/articles/360003145951-Accessing-Your-Advanced-Settings) file by passing your own (see [All Advanced Configuration Options](https://support.parsec.app/hc/en-us/articles/360001562772-All-Advanced-Configuration-Options))
```powershell
PS C:\Users\Borgo> .\main.ps1 -ConfigFile .\client_config.txt
```
where in this example `client_config.txt` sets the installation to work as a client only:
```powershell
PS C:\Users\Borgo> Get-Content .\client_config.txt

app_host = 0
client_decoder_h265 = true
client_immersive = 1
client_overlay = 0
```
##

- #### set autologin at first boot, you need to provide a valid `user.bin` file taken from a Parsec installation where you've already loggen in
```powershell
PS C:\Users\Borgo> .\main.ps1 -LoginFile "token.bin"
```
where `token.bin` was taken previously with:
```powershell
PS C:\Users\Borgo> Copy-Item "C:\ProgramData\Parsec\user.bin" .
```
##

- #### choose where to save Parsec's folder
```powershell
PS C:\Users\Borgo> .\main.ps1 -Dir "~\Desktop"
# or 
PS C:\Users\Borgo> .\main.ps1 -D ".\remote"
# both are valid
```
##

- #### choose the name of Parsec's folder
```powershell
PS C:\Users\Borgo> .\main.ps1 -OutFolder scrtp
# or
PS C:\Users\Borgo> .\main.ps1 -O "parsec rocco"
```

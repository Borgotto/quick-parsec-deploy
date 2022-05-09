# ScriptBlock example to deploy parsec using this repo's client_config.txt file
# can be executed directly from Windows' search bar

powershell "cd ~; ni -Path .\parsec-flat-windows32\config.txt -Value (irm https://raw.githubusercontent.com/Borgotto/quick-parsec-deploy/main/examples/config_files/client_config.txt) -Force; iex(irm https://raw.githubusercontent.com/Borgotto/quick-parsec-deploy/main/qpd.ps1);"

mkdir "C:\dapr"
cd C:\dapr

powershell -Command "iwr -useb https://raw.githubusercontent.com/dapr/cli/master/install/install.ps1 | iex"

setx /M path "%path%;C:\dapr\"
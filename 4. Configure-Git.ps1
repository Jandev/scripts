git config --global core.excludesfile D:\OneDrive\Software\Devtools\Development\global.gitignore

# Copy bash stuff
Copy-Item "D:\OneDrive\Software\Devtools\Development\.bash_profile" -Destination "C:\Users\jan\.bash_profile"
Copy-Item "D:\OneDrive\Software\Devtools\Development\.bashrc" -Destination "C:\Users\jan\.bashrc"

# Copy SSH stuff
New-Item -Path "C:\Users\jan\" -Name ".ssh" -ItemType "directory"
Copy-Item "D:\OneDrive\Software\Devtools\Keys\jan" -Destination "C:\Users\jan\.ssh\jan"
Copy-Item "D:\OneDrive\Software\Devtools\Keys\config" -Destination "C:\Users\jan\.ssh\config"

# Check status of service
# Get-Service ssh-agent

# Check the start type of the service
# Get-Service ssh-agent | Select StartType

# Set the start type to manual
Get-Service -Name ssh-agent | Set-Service -StartupType Manual

# Start the service
Start-Service ssh-agent

ssh-add $env:USERPROFILE\.ssh\jan
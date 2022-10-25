git config --global core.excludesfile C:\Users\jandevries\OneDrive\Software\Devtools\Development\global.gitignore

git config --global core.fsmonitor true

# Copy bash stuff
Copy-Item "C:\Users\jandevries\OneDrive\Software\Devtools\Development\.bash_profile" -Destination "C:\Users\jandevries\.bash_profile"
Copy-Item "C:\Users\jandevries\OneDrive\Software\Devtools\Development\.bashrc" -Destination "C:\Users\jandevries\.bashrc"

# Copy SSH stuff
New-Item -Path "C:\Users\jandevries\" -Name ".ssh" -ItemType "directory"
Copy-Item "C:\Users\jandevries\OneDrive\Software\Devtools\Keys\jan" -Destination "C:\Users\jandevries\.ssh\jan"
Copy-Item "C:\Users\jandevries\OneDrive\Software\Devtools\Keys\config" -Destination "C:\Users\jandevries\.ssh\config"

# Check status of service
Get-Service ssh-agent

# Check the start type of the service
Get-Service ssh-agent | Select StartType

# Set the start type to manual
Get-Service -Name ssh-agent | Set-Service -StartupType Manual

# Start the service
Start-Service ssh-agent

ssh-add $env:USERPROFILE\.ssh\jan
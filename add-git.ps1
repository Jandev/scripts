# Check status of service
# Get-Service ssh-agent

# Check the start type of the service
# Get-Service ssh-agent | Select StartType

# Set the start type to manual
# Get-Service -Name ssh-agent | Set-Service -StartupType Manual

# Start the service
Start-Service ssh-agent

ssh-add $env:USERPROFILE\.ssh\jan
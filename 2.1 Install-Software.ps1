#Feed: https://chocolatey.org/packages

#Update Chocolatey
choco upgrade chocolatey

choco install boxstarter -y

# Install Hyper-V
dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All

# Install WSL2
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
Write-Host "Download new kernel from: https://aka.ms/wsl2kernel"

Write-Host "When running with the built-in Administrator, make sure to enable `UAC-Admin-Approval-Mode-for-the-Built-in-Administrator-account` "
Write-Host "https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/user-account-control-admin-approval-mode-for-the-built-in-administrator-account"
Write-Host "Edit group policy -> Computer Configuration\Windows Settings\Security Settings\Local Policies\Security Options"
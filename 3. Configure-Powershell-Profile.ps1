install-module powershellget -force
install-module posh-git -force
install-module oh-my-posh -force
update-module posh-git

Add-PoshGitToProfile 

# Remember to install the fonts
Write-Prompt "Install the fonts!"
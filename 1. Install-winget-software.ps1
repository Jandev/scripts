# This can't be run as Admin, so do this manually...
# Install Scoop, which is more convenient for CLIs and command line dev tools
Invoke-Expression (new-object net.webclient).downloadstring('https://get.scoop.sh')

winget install DominikReichl.KeePass
winget install SublimeHQ.SublimeText.3
winget install Microsoft.VisualStudioCode
winget install Microsoft.VisualStudio.2022.Enterprise
winget install JetBrains.Toolbox
winget install ScooterSoftware.BeyondCompare4
winget install Telerik.Fiddler.Classic
winget install Git.Git
winget install GitExtensionsTeam.GitExtensions
winget install Fork.Fork
winget install Microsoft.PowerShell
winget install Microsoft.AzureCLI
winget install JanDeDobbeleer.OhMyPosh
winget install Microsoft.PowerAppsCLI
winget install Microsoft.Office
winget install Microsoft.SQLServerManagementStudio
winget install File-New-Project.EarTrumpet
winget install --source winget --silent 7zip
winget install --source msstore --silent --accept-package-agreements "Adobe Acrobat Reader DC"
winget install --source msstore --silent --accept-package-agreements "Dynamics AX 2012 Expenses"
winget install --source msstore --silent --accept-package-agreements "9MTTCL66CPXJ" # Ubuntu 20.04.4 LTS

winget install --source winget --silent "Microsoft PowerBI Desktop"
winget install --source winget --silent "Microsoft.AzureDataStudio"
winget install --source winget --silent "Microsoft.AzureStorageExplorer"
winget install --source msstore --silent --accept-package-agreements "Cosmos DB Studio"
winget install --source winget --silent "Microsoft.azure-iot-explorer"
winget install --source winget --silent "Postman.Postman"
winget install --source winget --silent "Microsoft.AzureStorageEmulator"
winget install --source winget --silent "Microsoft.AzureFunctionsCoreTools"
winget install --source winget --silent "Microsoft.AzureCosmosEmulator"
winget install --id "Microsoft.dotnet" --version
winget install --id "Microsoft.dotnet" --version 3.1.410.15736
winget install --source winget --silent "Microsoft.OpenJDK.16"
winget install --source winget --silent "GoLang.Go"
winget install --source winget --silent "Python 3.9"
winget install --source winget --silent "OpenJS.NodeJS"
winget install TechSmith.Snagit --version 21.4.4.12541
winget install OBSProject.OBSStudio
winget install VideoLAN.VLC
winget install XP89DCGQ3K6VLD --silent # Power Toys
winget install LINQPad.LINQPad.6

scoop bucket add extras
scoop install curl grep sed less touch --global
scoop install jq --global
scoop install servicebusexplorer --global
scoop install ngrok --global

scoop install azure-cli --global
$azcliext = Get-Content "$originalExecPath\az-cli.extensions"
$azcliext | ForEach-Object { az extension add --name $_ }
scoop install bicep --global
scoop install aws --global
PreparePowerShell
Install-Module -Name Az -AllowClobber -Force
Install-Module -Name AzureAD -Force -SkipPublisherCheck
scoop install armclient --global
scoop install nuget --global
scoop install kubectl --global
scoop install helm --global
scoop install draft --global
scoop install cloudfoundry-cli@7.1.0 --global
scoop install openshift-origin-client --global
scoop install hugo

Enable-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V-All -Online -NoRestart
Enable-WindowsOptionalFeature -FeatureName Containers -Online -NoRestart
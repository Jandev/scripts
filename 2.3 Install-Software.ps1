#Feed: https://chocolatey.org/packages

#Update Chocolatey
choco upgrade chocolatey

choco install sudo -y
#Normal software
choco install keepass -y 
choco install 7zip.install -y 
choco install firefox -y 
refreshenv
choco install googlechrome -y 
refreshenv
choco install slack  -y 
refreshenv
choco install microsoft-teams -y
refreshenv
choco install sublimetext3  -y 
refreshenv
choco install vlc  -y 
refreshenv
choco install adobereader -y
refreshenv
choco install gpmdp -y
refreshenv
choco install snagit -y --params "/licensekey:ABCD-EFGH-IJKL /licensename:""Joe Bloggs"" /nodesktopshortcut"
choco install camtasia -y --params "/licensekey:ABCD-EFGH-IJKL /licensename:""Joe Bloggs"" /nodesktopshortcut"
refreshenv
#choco install darktable -y
choco install zoom -y
choco install obs-studio -y
choco install office365business -y
refreshenv
choco install franz -y
choco install skype -y

#Development software IDE
choco install visualstudio2019enterprise -y --package-parameters "--add Microsoft.VisualStudio.Workload.Azure;includeRecommended;includeOptional --add Microsoft.VisualStudio.Workload.NetWeb;includeRecommended;includeOptional --add Microsoft.VisualStudio.Workload.Node;includeRecommended;includeOptional"
refreshenv
choco install visualstudiocode -y 
choco install linqpad -y
choco install jetbrainstoolbox -y

#Development software tooling
choco install beyondcompare -y 
choco install fiddler -y 
refreshenv
choco install git -y  --params "/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf /WindowsTerminal /NoGuiHereIntegration /NoShellHereIntegration"
refreshenv
choco install gitextensions  -y 
refreshenv
choco install nodejs.install -y
refreshenv
#choco install zoomit -y
choco install python  -y
refreshenv
choco install git-fork -y
choco install servicebusexplorer -y

choco install archi -y
# choco install gimp -y

#choco install eartrumpet -y
choco install powertoys -y
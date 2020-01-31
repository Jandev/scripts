#Feed: https://chocolatey.org/packages

#Update Chocolatey
choco upgrade chocolatey

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
refreshenv
choco install darktable -y
choco install zoom -y
choco install obs-studio -y
choco install office365business -y
refreshenv

#Development software IDE
choco install visualstudio2019enterprise -y --package-parameters "--add Microsoft.VisualStudio.Workload.Azure;includeRecommended;includeOptional --add Microsoft.VisualStudio.Workload.NetWeb;includeRecommended;includeOptional --addMicrosoft.VisualStudio.Workload.Node;includeRecommended;includeOptional"
choco install visualstudiocode -y 
choco install sublimetext3 -y

#Development software tooling
choco install beyondcompare -y 
choco install fiddler -y 
refreshenv
#choco install resharper-platform -y #Gaat beter via de reguliere installer
refreshenv
choco install git -y  --params "/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf /WindowsTerminal /NoGuiHereIntegration /NoShellHereIntegration"
refreshenv
#choco install github  -y #Has wrong checksum
refreshenv
choco install gitextensions  -y 
refreshenv
choco install nodejs.install -y
refreshenv
choco install zoomit -y
choco install python  -y
refreshenv
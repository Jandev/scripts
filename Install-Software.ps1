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
choco install itunes -y 
refreshenv
#choco install icloud -y #Should done later when Outlook is properly configured
refreshenv
choco install crashplan -y 
refreshenv
choco install slack  -y 
choco install inputdirector -y 
#choco install paint.net -y  #Does not have checksums, discarded.
choco install sublimetext3  -y 
choco install vlc  -y 
refreshenv
choco install adobereader -y
refreshenv
choco install rdcman -y
refreshenv
#choco install spotify 
refreshenv

#Development software IDE
choco install visualstudiocode -y 
choco install visualstudio2015enterprise -y 

#Development software tooling
choco install beyondcompare -y 
choco install fiddler4 -y 
refreshenv
#choco install resharper-platform -y #Gaat beter via de reguliere installer
refreshenv
choco install git.install -y 
refreshenv
#choco install github  -y #Has wrong checksum
refreshenv
choco install sourcetree  -y 
refreshenv
choco install gitextensions  -y 
refreshenv
#choco install vmwareworkstation 
choco install nodejs.install -y
refreshenv
choco install zoomit -y
#choco install python2  -y
refreshenv
choco install python  -y
refreshenv
choco install gitkraken -y
refreshenv
choco install filezilla -y
choco install openlivewriter -y
choco install teamviewer -y
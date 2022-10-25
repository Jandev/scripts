#!/bin/bash
#
# General packages commonly used on my Linux Dev Machines
#

sudo apt update
sudo apt -y upgrade 

# Known bug in Ubuntu 16.04 with missing package for GTK 
sudo apt install -y gtk2-engines-pixbuf

sudo apt install -y tmux
sudo apt install -y debconf-utils
sudo apt install -y net-tools
sudo apt install -y dos2unix
sudo apt install -y unzip
sudo apt install -y curl

# Packages needed for USBIPD for USB support in WSL 2
# https://devblogs.microsoft.com/commandline/connecting-usb-devices-to-wsl/
sudo apt install -y linux-tools-5.4.0-77-generic hwdata   

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889
if [ "$ver" == "16.04" ]; then
    echo "deb http://miktex.org/download/ubuntu xenial universe" | sudo tee /etc/apt/sources.list.d/miktex.list
elif [ "$ver" == "18.04" ]; then
    echo "deb http://miktex.org/download/ubuntu bionic universe" | sudo tee /etc/apt/sources.list.d/miktex.list
elif [ "$ver" == "20.04" ]; then
echo "deb [arch=amd64] http://miktex.org/download/ubuntu focal universe" | sudo tee /etc/apt/sources.list.d/miktex.list
fi 
sudo apt update
sudo apt install -y miktex

sudo apt install -y ffmpeg
sudo apt install -y mencoder
sudo apt install -y libpng-dev

# Git including enabling large-file-store scenarios (git-lfs)
sudo apt install -y git
sudo apt install -y git-lfs

sudo apt install -y jq
sudo apt install -y zlib1g-dev
sudo apt install -y libxml2
sudo apt install -y build-essential


# Install 'homebrew' on Ubuntu per https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
#test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
# shellcheck disable=SC2046
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
#test -r ~/.bash_profile && echo eval" ($(brew --prefix)/bin/brew shellenv)" >> ~/.bash_profile
# shellcheck disable=SC2046
echo "eval $($(brew --prefix)/bin/brew shellenv)" >> ~/.profile

brew update



curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
sudo apt update
sudo sudo apt install -y mate-system-monitor
sudo ufw enable
sudo systemctl enable ufw
sudo ufw default deny incoming

#
# Install and configure sysstat tools (iostat, top etc.)
#
sudo apt-get install -y sysstat
awk '{gsub("ENABLED=\"false\"", "ENABLED=\"true\"")}1' /etc/default/sysstat | sudo tee /etc/default/sysstat

#
# Install docker engine
#

sudo apt -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update
sudo apt install -y docker-ce containerd.io	# Not installing docker-ce-cli because of using dvm for that

# groupadd was not needed after the installation
#sudo groupadd docker
sudo usermod -aG docker "$USER"

dockerEntryExists=$(cat ~/.profile | grep "# mszcool docker setup")
if [ ! "$dockerEntryExists" ]; then
    echo "# mszcool docker setup" >> ~/.profile
    echo "if service docker status 2>&1 | grep -q \"is not running\"; then" >> ~/.profile
    echo "    wsl.exe -d \"${WSL_DISTRO_NAME}\" -u root -e /usr/sbin/service docker start >/dev/null 2>&1" >> ~/.profile
    echo "fi" >> ~/.profile
fi

#
# Installing Python
#
sudo apt install -y python3
sudo apt install -y python3-pip
sudo apt install -y python3-venv
#sudo rm /usr/bin/python
#sudo ln /usr/bin/python3 /usr/bin/python
sudo -H python3 -m pip install --upgrade pip

# Create a default virtual environment
existspythondefault=$(grep "source ~/pythonvenv/default/bin/activate" ~/.profile)
if [ "$existspythondefault" == "" ]; then
    mkdir ~/pythonvenv
    python3 -m venv ~/pythonvenv/default
    echo "# mszcool default pyhton environment" >> ~/.profile
    echo "source ~/pythonvenv/default/bin/activate" >> ~/.profile
    source ~/.profile
else
    # Ensure packages are installed in default environment, only
    source ~/pythonvenv/default/bin/activate
fi

# Now install packages into that default virtual environment
pip3 install numpy
pip3 install pytest
pip3 install mock
pip3 install Pillow
pip3 install GhostScript
pip3 install matplotlib
pip3 install autopep8



#
# Installing Ruby on Rails
#
# Ruby and Jekyll for GitHub Pages

sudo apt install -y ruby-full

# shellcheck disable=SC1090
{
    echo "# Install Ruby Gems to ~/gems"
    echo "export GEM_HOME=\"$HOME/gems\"" 
    echo "export PATH=\"\$HOME/gems/bin:\$PATH\""
} >> ~/.bashrc

# shellcheck disable=SC1090
source ~/.bashrc

sudo gem install jekyll bundler


#
# Installing Go Language
#
wget -O go.tar.gz https://go.dev/dl/go1.17.5.linux-amd64.tar.gz
mkdir ~/go
tar -xvf go.tar.gz -C ~/
echo "export PATH=\"\$PATH:~/go/bin\"" >> ~/.profile
rm ~/go.tar.gz
source ~/.profile

#
# NodeJS Installation with NVM
#
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1090
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"	# Loading NVM into the current session
# shellcheck disable=SC1090
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Loading nvm bash_completion

# shellcheck disable=SC1090
source ~/.profile

nvm install --lts	# Install the latest LTS build of Node
npm install -g moment
npm install -g bower        # Consider replacing with WebPack, Yarn or Parcel 
npm install -g gulp
npm install -g autorest@3.0.6187
npm install -g swagger-tools@0.10.4

# This particular version 3.0.6187 of autorest depends on libssl1.0, hence on Ubuntu 20.04 need to install this version of the library, as well
if [ "$ver" == "20.04" ]; then
    wget -O libssl1.0.0_1.0.1t-1+deb8u12_amd64.deb http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u12_amd64.deb
    wget -O multiarch-support_2.19-18+deb8u10_amd64.deb http://ftp.de.debian.org/debian/pool/main/g/glibc/multiarch-support_2.19-18+deb8u10_amd64.deb

    sudo dpkg -i multiarch-support_2.19-18+deb8u10_amd64.deb
    sudo dpkg -i libssl1.0.0_1.0.1t-1+deb8u12_amd64.deb
fi


#
# Installing .Net core runtimes
#
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

if [ "$ver" == "16.04" ]; then        
    wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
elif [ "$ver" == "18.04" ]; then
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
elif [ "$ver" == "20.04" ]; then
    wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
fi
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# Needed on Ubuntu 18.04 in WSL
if [ "$ver" == "18.04" ]; then
    sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
    sudo apt update 
    sudo apt install -y libicu55
fi

sudo add-apt-repository universe
sudo apt update
sudo apt install -y apt-transport-https
sudo apt update

sudo apt install -y dotnet-sdk-6.0

# PowerShell for the .NET Developer
sudo apt install -y powershell

# Dotnet Core Tools
dotnet tool install --global dotnet-ef
dotnet tool install --global dotnet-trace
dotnet tool install --global dotnet-dump
dotnet tool install --global dotnet-counters
dotnet tool install --global dotnet-gcdump
dotnet tool install --global dotnet-format
dotnet tool install --global dotnet-aspnet-codegenerator
dotnet tool install --global dotnet-ildasm
dotnet tool install --global Microsoft.dotnet-openapi
dotnet tool install --global Swashbuckle.AspNetCore.Cli
dotnet tool install --global NSwag.ConsoleCore

# Credential Artifact Provider
# From https://github.com/Microsoft/artifacts-credprovider
wget -qO- https://aka.ms/install-artifacts-credprovider.sh | bash


#
# Installing various CLIs
#

# All goes into CLIs if not installed via package
mkdir ~/clis
existsclis=$(grep "$HOME/clis" ~/.profile)
if [ "$existsclis" == "" ]; then
    # shellcheck disable=SC1090
    echo "export PATH=\"\$HOME/clis:\$PATH\"" >> ~/.profile
    # shellcheck disable=SC1090
    source ~/.profile
fi

# Install Azure CLI and plug-ins
sudo apt update
sudo apt install ca-certificates curl apt-transport-https lsb-release gnupg
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt update
sudo apt install azure-cli

dos2unix az-cli.extensions
while read -r azext; do 
    az extension add --name "$azext"
done < az-cli.extensions

# Install other cloud provider CLIs
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "~/clis/awscliv2.zip"
unzip -d ~/clis/ ~/clis/awscliv2.zip
sudo ~/clis/aws/install
rm ~/clis/awscliv2.zip

# Install Docker CLI
#curl -L "https://download.docker.com/linux/static/stable/x86_64/docker-18.06.1-ce.tgz" | tar -xz
#mv ./docker/* ~/clis
#rm ./docker -R
curl -sL https://howtowhale.github.io/dvm/downloads/latest/install.sh | sh
# shellcheck disable=SC1090
echo "source ~/.dvm/dvm.sh" >> ~/.bashrc
# shellcheck disable=SC1090
source ~/.dvm/dvm.sh
dvm install 17.12.1-ce
dvm install 18.09.6

# Latest kubectl
kubeversion=$(curl -s "https://storage.googleapis.com/kubernetes-release/release/stable.txt")
wget -O ~/clis/kubectl "https://storage.googleapis.com/kubernetes-release/release/$kubeversion/bin/linux/amd64/kubectl"
chmod +x ~/clis/kubectl

# Krew extension manager
curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz"
tar zxvf krew.tar.gz
mv krew* ~/clis
KREW=~/clis/krew-"$(uname | tr '[:upper:]' '[:lower:]')_$(uname -m | sed -e 's/x86_64/amd64/' -e 's/arm.*$/arm/')"
"$KREW" install krew
cp "$KREW" ./krew
echo "export PATH=\"${KREW_ROOT:-$HOME/.krew}/bin:$PATH\"" >> ~/.profile
# shellcheck disable=SC1090
source ~/.profile
# Install the plug-ins
krew install krew
krew install exec-as

# Helm CLI
# curl -L "https://storage.googleapis.com/kubernetes-helm/helm-v2.11.0-linux-amd64.tar.gz" | tar -zx
# mv ./linux-amd64/* ~/clis
# rm ./linux-amd64 -R
curl -L https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Cloud Foundry CLI
curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github" | tar -zx
mv cf ~/clis

# OpenShift CLI
curl -L "https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz" | tar -zx
mv ./openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/* ~/clis 

# Remove Temporary files
rm ./LICENSE
rm ./NOTICE
rm ./openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit -r

# armclient GO-version for Linux
curl -sL https://github.com/yangl900/armclient-go/releases/download/v0.2.3/armclient-go_linux_64-bit.tar.gz | tar xz
mv armclient ~/clis
rm ./LICENSE
#!/bin/bash

sudo rm /etc/apt/sources.list && sudo touch /etc/apt/sources.list && sudo chmod 644 /etc/apt/sources.list && sudo printf "# See https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/
deb https://kali.download/kali kali-rolling main contrib non-free

# Additional line for source packages
# deb-src https://kali.download/kali kali-rolling main contrib non-free" | sudo tee -a /etc/apt/sources.list

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get dist-upgrade


sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev-is-python3
sudo apt-get install -y build-essential libssl-dev libffi-dev python2-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install pip
sudo pip install dnspython
sudo pip install requests
sudo pip install argparse
sudo apt autoremove
clear


# GO Installation
if ! [ -x "$(command -v go)" ]; then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("YES" "NO" "QUIT")
select choice in "${choices[@]}"; do
        case $choice in
                YES)
					echo "Installing Golang"
					wget https://golang.org/dl/go1.18.linux-amd64.tar.gz
					sudo rm -rf /usr/local/go 
					sudo tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz
                                        sudo cp /usr/local/go/bin/go /usr/bin
                                        echo 'export GOROOT=/usr/local/go' >> .bashrc
                                        echo 'export GOPATH=$HOME/go' >> .bashrc
                                        echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH' >> .bashrc 
					source .bashrc
                                        go version
                                        echo Done
					sleep 1
					break
					;;
				NO)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
				QUIT)
				     break
                    ;;
        *) echo "Invalid Option $REPLY";;	
	esac	
done
fi


# WPScan Installation
echo "Installing WPScan"
sudo apt-get install wpscan
sudo gem update wpscan
sudo wpscan --update
echo "DONE"


# httprobe Installation
echo "Installing httprobe"
sudo apt-get install httprobe
echo "DONE"


# Amass Installation
echo "Installing Amass"
sudo apt-get install amass
echo "DONE"


# Amass Installation
echo "Installing Assetfinder"
sudo apt-get install assetfinder
echo "DONE"


#create a Tools folder in ~/
mkdir ~/Tools
cd $HOME/Tools


# Nuclei Installation
echo "Installing Nuclei"
wget https://github.com/projectdiscovery/nuclei/releases/download/v2.6.3/nuclei_2.6.3_linux_amd64.zip
unzip -q nuclei_2.6.3_linux_amd64.zip
sudo mv nuclei /usr/bin
nuclei -update
nuclei -ut


# Sublist3r Installation
echo "Installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd $HOME/Tools
echo "DONE"


# Aquatone Installation
echo "Installing Aquatone"
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
unzip -q aquatone_linux_amd64_1.7.0.zip 
sudo mv aquatone /usr/bin
cd $HOME/Tools
echo "DONE"


# Dalfox Installation
echo "Installing Dalfox"
wget https://github.com/hahwul/dalfox/releases/download/v2.7.1/dalfox_2.7.1_linux_amd64.tar.gz
tar -xzf dalfox_2.7.1_linux_amd64.tar.gz
sudo mv dalfox /usr/bin
cd $HOME/Tools
echo "DONE"


# Paramspider Installation
echo "Installing Paramspider - Use Python 3.7+"
git clone https://github.com/devanshbatham/ParamSpider
cd ParamSpider
pip3 install -r requirements.txt
#python3 paramspider.py --domain hackerone.com
cd $HOME/Tools
echo "DONE"


# httpx Installation
echo "Installing httpx"
wget https://github.com/projectdiscovery/httpx/releases/download/v1.2.0/httpx_1.2.0_linux_amd64.zip
unzip -q httpx_1.2.0_linux_amd64.zip
sudo mv httpx /usr/bin
cd $HOME/Tools
echo "DONE"


# Naabu Installation
echo "Installing Naabu"
wget https://github.com/projectdiscovery/naabu/releases/download/v2.0.5/naabu_2.0.5_linux_amd64.zip
unzip -q naabu_2.0.5_linux_amd64.zip
sudo mv naabu /usr/bin
cd $HOME/Tools
echo "DONE"


# Subfinder Installation
echo "Installing Subfinder"
wget https://github.com/projectdiscovery/subfinder/releases/download/v2.5.0/subfinder_2.5.0_linux_amd64.zip
unzip -q subfinder_2.5.0_linux_amd64.zip
sudo mv subfinder /usr/bin
cd $HOME/Tools
echo "DONE"


# Simplehttpserver Installation
echo "Installing Simplehttpserver"
wget https://github.com/projectdiscovery/simplehttpserver/releases/download/v0.0.4/simplehttpserver_0.0.4_linux_amd64.tar.gz
tar -xzf simplehttpserver_0.0.4_linux_amd64.tar.gz
sudo mv simplehttpserver /usr/bin
cd $HOME/Tools
echo "DONE"


# Dirsearch Installation
echo "Installing dirsearch - Python 3.7+"
git clone https://github.com/maurosoria/dirsearch.git
cd dirsearch
pip3 install -r requirements.txt
#python3 dirsearch.py -u <URL> -e <EXTENSIONS>
cd $HOME/Tools
echo "DONE"


# Findomain Installation
echo "Installing findomain"
wget https://github.com/Findomain/Findomain/releases/download/7.0.1/findomain-linux
sudo mv findomain-linux /usr/bin
cd $HOME/Tools
echo "DONE"


# Subfinder Installation
echo "Installing Subfinder"
cd $HOME/Tools
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
cd $HOME/Tools
echo "DONE"

# GitDorker Installation
echo "Installing GitDorker"
cd $HOME/Tools
git clone https://github.com/obheda12/GitDorker.git
cd GitDorker/
pip3 install -r requirements.txt
cd $HOME/Tools
echo "DONE"


echo "Downloading Seclists"
cd $HOME/Tools
git clone https://github.com/danielmiessler/SecLists.git
cd $HOME/Tools
echo "DONE"


echo "Downloading PayloadAllThings"
cd $HOME/Tools
https://github.com/swisskyrepo/PayloadsAllTheThings.git
cd $HOME/Tools
echo "DONE"


echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All Tools are made up in ~/Tools"
cd $HOME/Tools
ls -la



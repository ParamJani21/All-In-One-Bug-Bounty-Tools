#!/bin/bash

sudo rm /etc/apt/sources.list && sudo touch /etc/apt/sources.list && sudo chmod 644 /etc/apt/sources.list && sudo printf "# See https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/
deb https://kali.download/kali kali-rolling main contrib non-free

# Additional line for source packages
# deb-src https://kali.download/kali kali-rolling main contrib non-free" | sudo tee -a /etc/apt/sources.list

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get dist-upgrade
sudo apt autoremove

sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y python-setuptools
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y git
sudo apt-get install -y rename



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


echo "Installing Nuclei"
wget https://github.com/projectdiscovery/nuclei/releases/download/v2.6.3/nuclei_2.6.3_linux_amd64.zip
unzip -q nuclei_2.6.3_linux_amd64.zip
sudo mv nuclei /usr/bin
nuclei -update
clear
nuclei -ut



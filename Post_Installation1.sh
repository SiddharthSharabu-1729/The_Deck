###update && upgrade
sudo apt update -y
sudo apt upgrade -y

###Basic Packages
sudo apt  install python3 python3-pip perl git curl wget -y
sudo apt install  openssh-server
sudo systemctl start sshd.service
sudo apt install apache2 -y
sudo apt install default-jdk -y
sudo apt install default-jre -y
sudo apt install terminator -y

##Installing ohmyzsh
sudo apt install zsh zsh-autosuggestions vim-syntastic zsh-theme-powerlevel9k zsh-synatx-highlighting
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

##Installing Tmux
sudo apt install tmux tmux-plugin-manager tmux-themepack-jimeh
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .


###Editors

#Vim
sudo apt-cache search vim | grep editor
sudo apt install vim

#Atom
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packagecloud.io/AtomEditor/atom/gpgkey -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"
sudo apt install atom

###Tools with standard package repositories
sudo apt install namp
sudo apt-get install -y netdiscover
sudo apt-get install -y recon-ng
sudo apt-get install nikto -y
sudo apt install sqlmap
sudo apt-get install -y arping

sudo apt install curl git libcurl4-openssl-dev make zlib1g-dev gawk g++ gcc libreadline6-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config ruby ruby-bundler ruby-dev -y
gem install wpscan

sudo apt-get install -y dirb
sudo apt install padbuster
sudo apt-get install -y crunch
sudo apt-get install -y hashcat

sudo apt install snapd
sudo snap install john-the-ripper

sudo apt-get install -y ncrack

sudo apt-get dist-upgrade
sudo apt-get install hydra-gtk
sudo apt-get purge hydra-gtk && sudo apt-get autoremove && sudo apt-get autoclean
sudo apt-get -y install build-essential
sudo apt-get install libssl-dev libssh-dev libidn11-dev libpcre3-dev \ libgtk2.0-dev libmysqlclient-dev libpq-dev libsvn-dev \ firebird-dev libncp-dev
sudo apt-get install -y aircrack-ng
sudo apt-get install -y wifite
sudo apt-get install dnschef
sudo apt-get install -y macchanger


sudo add-apt-repository universe
sudo apt install wireshark
sudo dpkg-reconfigure wireshark-common


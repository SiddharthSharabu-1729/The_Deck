###update && upgrade
for i in {1..2..1}
do 
    echo "_______________________________________________" 
done
echo " "
echo "---------------Updating and Upgrading--------------"
for i in {1..2..1}
do 
    echo "_______________________________________________" 
done

sudo apt update -y
sudo apt upgrade -y

###Basic Packages
echo "___________________________________________________________________"
echo " "
echo "----------Installing Basic Required Packages-----------------------"
echo "___________________________________________________________________"
sudo apt  install python3 python3-pip perl git curl wget -y
sudo apt install  openssh-server
sudo systemctl start sshd.service
echo "___________________________________________________"
echo " "
echo "----------Installing Apache-----------------------"
echo "__________________________________________________"
sudo apt install apache2 -y
echo "_______________________________________________"
echo " "
echo "----------Installing JDK-----------------------"
echo "________________________________________________"
sudo apt install default-jdk -y
echo "_______________________________________________"
echo " "
echo "----------Installing JRE-----------------------"
echo "________________________________________________"
sudo apt install default-jre -y
echo "_______________________________________________________"
echo " "
echo "----------Installing Terminator-----------------------"
echo "_______________________________________________________"
sudo apt install terminator -y

##Installing ohmyzsh
echo "___________________________________________________"
echo " "
echo "------------Installing OhMyZsh---------------------"
echo "____________________________________________________"
sudo apt install zsh zsh-autosuggestions vim-syntastic zsh-theme-powerlevel9k zsh-synatx-highlighting
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

##Installing Tmux
echo "_____________________________________________________________"
echo " "
echo "----------Installing & Configuring Tmux-----------------------"
echo "______________________________________________________________"

sudo apt install tmux tmux-plugin-manager tmux-themepack-jimeh
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .


###Editors
echo "_______________________________________________________"
echo " "
echo "--------------Installing Editors-----------------------"
echo "_______________________________________________________"

#Vim
echo "_________________________________________________"
echo " "
echo "----------Installing Vim Editor------------------"
echo "_________________________________________________"

sudo apt-cache search vim | grep editor
sudo apt install vim

#Atom
#Uncomment below lines to install Atom 
#sudo apt install software-properties-common apt-transport-https wget
#wget -q https://packagecloud.io/AtomEditor/atom/gpgkey -O- | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"
#sudo apt install atom

###Tools with standard package repositories
for i in {1..2..1}
do 
    echo "_______________________________________________________________________________" 
done
echo " "
echo "--------------Installing The Tools with standard package repositories--------------"
for i in {1..2..1}
do 
    echo "_________________________________________________________________________________" 
done

echo "_________________________________________________"
echo " "
echo "----------Installing Nmap------------------------"
echo "_________________________________________________"
sudo apt install namp
echo "_________________________________________________"
echo " "
echo "----------Installing NetDiscover------------------"
echo "_________________________________________________"
sudo apt-get install -y netdiscover
echo "_________________________________________________"
echo " "
echo "----------Installing Recon-ng------------------"
echo "_________________________________________________"
sudo apt-get install -y recon-ng
echo "_________________________________________________"
echo " "
echo "----------Installing Nikto-----------------------"
echo "_________________________________________________"
sudo apt-get install nikto -y
echo "_________________________________________________"
echo " "
echo "----------Installing SQL Map-----------------------"
echo "_________________________________________________"
sudo apt install sqlmap
echo "_________________________________________________"
echo " "
echo "----------Installing Arping-----------------------"
echo "_________________________________________________"
sudo apt-get install -y arping

echo "__________________________________________________"
echo " "
echo "----------Installing WpScan-----------------------"
echo "__________________________________________________"
sudo apt install curl git libcurl4-openssl-dev make zlib1g-dev gawk g++ gcc libreadline6-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config ruby ruby-bundler ruby-dev -y
gem install wpscan

echo "_________________________________________________"
echo " "
echo "----------Installing DirBuster-----------------------"
echo "_________________________________________________"
sudo apt-get install -y dirb
echo "_________________________________________________"
echo " "
echo "----------Installing PadBuster-----------------------"
echo "_________________________________________________"
sudo apt install padbuster
echo "_________________________________________________"
echo " "
echo "----------Installing Crunch-----------------------"
echo "_________________________________________________"
sudo apt-get install -y crunch
echo "_________________________________________________"
echo " "
echo "----------Installing HashCat-----------------------"
echo "_________________________________________________"
sudo apt-get install -y hashcat

echo "______________________________________________________________"
echo " "
echo "----------Installing Snapd & Snapd-core-----------------------"
echo "______________________________________________________________"
sudo apt install snapd
echo "_________________________________________________"
echo " "
echo "----------Installing JohnTheRipper-----------------------"
echo "_________________________________________________"
sudo snap install john-the-ripper

echo "_________________________________________________"
echo " "
echo "----------Installing N-Crack-----------------------"
echo "_________________________________________________"
sudo apt-get install -y ncrack

echo "________________________________________________________"
echo " "
echo "----------Installing Dist Upgrade-----------------------"
echo "________________________________________________________"
sudo apt-get dist-upgrade
echo "_________________________________________________"
echo " "
echo "----------Installing Hydra-----------------------"
echo "_________________________________________________"
sudo apt-get install hydra-gtk
sudo apt-get purge hydra-gtk && sudo apt-get autoremove && sudo apt-get autoclean
echo "_________________________________________________________________________"
echo " "
echo "----------Installing the Required build-Essentials-----------------------"
echo "_________________________________________________________________________"
sudo apt-get -y install build-essential
sudo apt-get install libssl-dev libssh-dev libidn11-dev libpcre3-dev \ libgtk2.0-dev libmysqlclient-dev libpq-dev libsvn-dev \ firebird-dev libncp-dev
echo "_______________________________________________________"
echo " "
echo "----------Installing Aircrack-ng-----------------------"
echo "_______________________________________________________"
sudo apt-get install -y aircrack-ng
echo "_______________________________________________________"
echo " "
echo "----------Installing Wifite-----------------------"
echo "_______________________________________________________"
sudo apt-get install -y wifite
echo "_______________________________________________________"
echo " "
echo "----------Installing DNS-chef-----------------------"
echo "_______________________________________________________"
sudo apt-get install dnschef
echo "_______________________________________________________"
echo " "
echo "----------Installing Mac changer-----------------------"
echo "_______________________________________________________"
sudo apt-get install -y macchanger

echo "_______________________________________________________"
echo " "
echo "----------Installing Wireshark-----------------------"
echo "_______________________________________________________"
sudo add-apt-repository universe
sudo apt install wireshark
sudo dpkg-reconfigure wireshark-common


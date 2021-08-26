### Upadte && upgrade
sudo apt update -y
sudo apt upgrade -y

### Tools that can be cloned by Git

# Installing Dirbuster
sudo apt install default-jre
git clone https://gitlab.com/kalilinux/packages/dirbuster.git



### Installing Metasploit-Framework
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y install oracle-java8-installer
sudo apt-get install build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev libyaml-dev curl zlib1g-dev gawk bison libffi-dev libgdbm-dev libncurses5-dev libtool sqlite3 libgmp-dev gnupg2 dirmngr

# Installing Ruby using rvm
gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
source ~/.bashrc
RUBYVERSION=$(wget https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version -q -O - )
rvm install $RUBYVERSION
rvm use $RUBYVERSION --default
ruby -v

cd /opt
sudo git clone https://github.com/rapid7/metasploit-framework.git
sudo chown -R `whoami` /opt/metasploit-framework
cd metasploit-framework

rvm --default use ruby-${RUBYVERSION}@metasploit-framework
gem install bundler
bundle install

sudo bash -c 'for MSF in $(ls msf*); do ln -s /opt/metasploit-framework/$MSF /usr/local/bin/$MSF;done'


### Installing Searchsploit
sudo git clone https://github.com/offensive-security/exploitdb.git /opt/exploitdb
sudo ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit
searchsploit -h
searchsploit -u


### Installing Social Engineering Toolkit
sudo gitclone https://github.com/trustedsec/social-engineer-toolkit.git
cd setoolkit
pip3 install -r requirements.txt
python setup.py


### Installing Bettercap
sudo apt install golang git build-essential libpcap-dev libusb-1.0-0-dev libnetfilter-queue-dev
go get -u github.com/bettercap/bettercap


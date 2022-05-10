#! /bin/bash

#######################################
# Shell script to install apps on a new system (Ubuntu)
#######################################

echo ".................................INSTALLNG JAVA..................................................."
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt-get update  # To get the latest package lists
sudo apt-get install openjdk-8-jdk -y
echo "JAVA_HOME=$(which java)" | sudo tee -a /etc/environment
source /etc/environment
echo $JAVA_HOME
java -version


echo ".................................INSTALLNG NODEJS..................................................."
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
nvm install 10.24.1
npm install -g grunt-cli
npm install -g pm2
npm install -g bower
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y


echo ".................................NPM REGISTRY..................................................."
npm set registry http://npm.psgsoftwaretechnologies.com


echo ".................................INSTALLNG NGINX..................................................."
sudo apt-get update
sudo apt-get install nginx
sudo systemctl start nginx
sudo systemctl status nginx
nginx -v

echo ".................................INSTALLNG GIT..................................................."
sudo apt-get install git 
git  --version


echo ".................................INSTALLNG MONGO DB..................................................."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl status mongod
mongod –version


echo ".................................INSTALLNG ERLANG..................................................."
sudo apt update
sudo apt install software-properties-common apt-transport-https
wget -O- https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo apt-key add -
echo "deb https://packages.erlang-solutions.com/ubuntu focal contrib" | sudo tee /etc/apt/sources.list.d/rabbitmq.list
sudo apt update
sudo apt install erlang
erl -v


echo ".................................INSTALLNG RABBIT MQ..................................................."
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.deb.sh | sudo bash
sudo apt update
sudo apt install rabbitmq-server
systemctl start rabbitmq-server.service
systemctl status rabbitmq-server.service
sudo rabbitmqctl add_user admin PsgSt02112016
sudo rabbitmqctl set_user_tags admin administrator
sudo rabbitmqctl set_permissions admin “.*” “.*” “.*”


echo ".................................INSTALLNG VERSIONS..................................................."

java -version
node -v
npm -v
nvm -v
nginx -v
git  --version
mongod -version
erl -v

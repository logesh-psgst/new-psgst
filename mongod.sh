#! /bin/bash

#######################################
# Shell script to install apps on a new system (Ubuntu)
#######################################

echo ".................................INSTALLNG JAVA..................................................."
sudo apt-get install software-properties-common  # Adding the ppa repository and install openjdk in ubuntu
sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt-get update  # To get the latest package lists
sudo apt-get install openjdk-8-jdk -y  #  Installing and Verifying Java
echo "JAVA_HOME=$(which java)" | sudo tee -a /etc/environment
source /etc/environment
echo $JAVA_HOME
java -version  # openjdk version "1.8.0_191"


echo ".................................INSTALLNG NODEJS..................................................."
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
nvm install 10.24.1  #  Installing and Verifying node
npm install -g grunt-cli   #  Installing and Verifying Grunt
npm install -g pm2  #  Installing and Verifying Pm2
npm install -g bower  #  Installing and Verifying bower
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y


echo ".................................NPM REGISTRY..................................................."
npm set registry http://npm.psgsoftwaretechnologies.com   # Setting NPM Registry 


echo ".................................INSTALLNG NGINX..................................................."
sudo apt-get update  # To get the latest package lists
sudo apt-get install nginx  #  Installing and Verifying Nginx
sudo systemctl start nginx
sudo systemctl enable nginx  #  Enable automatically starting Nginx when the system starts
sudo systemctl status nginx  #  Check Nginx status
nginx -v

echo ".................................INSTALLNG GIT..................................................."
sudo apt-get install git 
git  --version


echo ".................................INSTALLNG MONGO DB..................................................."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5  #  Adding MongoDB repository
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list  #  Createing a list file for MongoDB
sudo apt-get update  # To get the latest package lists
sudo apt-get install -y mongodb-org  #  Installing and Verifying MongoDB
sudo systemctl start mongod
sudo systemctl enable mongod  #  Enable automatically starting MongoDB when the system starts
sudo systemctl status mongod  #  Check MongoDB status
mongod –version  #  Check MongoDB version


echo ".................................INSTALLNG ERLANG..................................................."
sudo apt update  # To get the latest package lists
sudo apt install software-properties-common apt-transport-https
wget -O- https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo apt-key add -
echo "deb https://packages.erlang-solutions.com/ubuntu focal contrib" | sudo tee /etc/apt/sources.list.d/rabbitmq.list
sudo apt update  # To get the latest package lists
sudo apt install erlang
erl -v


echo ".................................INSTALLNG RABBIT MQ..................................................."
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.deb.sh | sudo bash
sudo apt update  # To get the latest package lists
sudo apt install rabbitmq-server  #  Installing and Verifying Rabbitmq
systemctl start rabbitmq-server.service  #  Start RabbitMQ Service
systemctl enable rabbitmq-server.service  # Enable auto start on machine reboot/restart
systemctl status rabbitmq-server.service
sudo rabbitmqctl add_user admin PsgSt02112016  #  Adding User to rabbitmq
sudo rabbitmqctl set_user_tags admin administrator  #  Set administrator previlage to user
sudo rabbitmqctl set_permissions admin “.*” “.*” “.*”  #  Set administrator privileges on vhost to use


echo ".................................INSTALLNG VERSIONS..................................................."

java -version
node -v
npm -v
nvm -v
nginx -v
git  --version
mongod -version
erl -v

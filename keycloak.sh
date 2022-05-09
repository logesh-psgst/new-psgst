#! /bin/bash


echo "..................................................INSTALLING KEYCLOAK........................................................."
tar -xzvf keycloak-3.4.0.tar.gz
mv /home/psg/new-psgst/home/psg/test/ /home/psg/new-psgst
mv /home/psg/new-psgst/test/keycloak-3.4.0.Final /home/psg/new-psgst/keycloak-3.4.0.Final


echo "..................................................INSTALLING POSTGRES........................................................."
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql-pgdg.list > /dev/null
sudo apt-get update
sudo apt-get install postgresql-9.5 postgresql-contrib-9.5
sudo -u postgres psql
sudo psql -U postgres
\password postgres
\l 
CREATE DATABASE keycloak;
\l
\Q

sudo -u postgres psql -U postgres -d keycloak -f test4keycloak20220212-0952.sq
sudo nohup ~/keycloak-3.4.0.Final/bin/standalone.sh -b 0.0.0.0>keycloak.log 1>&2 &

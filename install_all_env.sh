#!/bin/bash
# Installation complète de la suite d'outils Geonature du PNEcrins, pour un serveur Ubuntu 16.04 LTS

# Configuration initiale de l'installation serveur
. install_all.ini

# Make sure this script is NOT run as root
if [ "$(id -u)" == "0" ]; then
   echo -e "\e[91m\e[1mThis script should NOT be run as root\e[0m" >&2
   echo -e "\e[91m\e[1mLancez ce script avec l'utilisateur courant : '$monuser'\e[0m" >&2
   exit 1
fi

# Installation de l'environnement nécessaire à UsersHub, GeoNature, TaxHub et GeoNature-atlas
echo "Installation de l'environnement logiciel..."
#sudo sh -c 'echo "" >> /etc/apt/sources.list'
#sudo sh -c 'echo "#Backports" >> /etc/apt/sources.list'
#sudo sh -c 'echo "deb http://http.debian.net/debian jessie-backports main contrib non-free" >> /etc/apt/sources.list'

# ajout des repository nécessaires
sudo add-apt-repository ppa:ondrej/php -y

sudo apt-get update
sudo apt-get -y install ntpdate
sudo ntpdate-debian
sudo apt-get install -y curl unzip git
sudo apt-get install -y apache2 php5.6 libapache2-mod-php5.6 libapache2-mod-wsgi libapache2-mod-perl2 --allow-unauthenticated
sudo apt-get install -y php5.6-gd php5.6-pgsql
sudo apt-get install -y cgi-mapserver gdal-bin libgeos-dev
sudo apt-get install -y postgresql postgis postgresql-server-dev-9.5 --allow-unauthenticated
sudo apt-get install -y postgresql-client 
sudo apt-get install -y python-dev python-pip libpq-dev python-setuptools python-gdal python-virtualenv build-essential
sudo apt-get install -y npm --allow-unauthenticated
sudo apt-get install -y python3 python3-dev 
sudo apt-get install -y supervisor 

sudo pip install virtualenv

echo "Configuration de postgreSQL..."
sudo sed -e "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" -i /etc/postgresql/*/main/postgresql.conf
sudo sh -c 'echo "host    all             all             0.0.0.0/0            md5" >> /etc/postgresql/9.5/main/pg_hba.conf'
sudo /etc/init.d/postgresql restart

echo "Création des utilisateurs postgreSQL..."
sudo -n -u postgres -s psql -c "CREATE ROLE $user_pg WITH LOGIN PASSWORD '$user_pg_pass';"
sudo -n -u postgres -s psql -c "CREATE ROLE $user_atlas WITH LOGIN PASSWORD '$user_atlas_pass';"
#sudo -n -u postgres -s psql -c "CREATE ROLE $admin_pg WITH SUPERUSER LOGIN PASSWORD '$admin_pg_pass';" 

# Suppression de la notice au redémarrage d'apache
sudo sh -c 'echo "ServerName localhost" >> /etc/apache2/apache2.conf'
echo "Activation des modules apache rewrite, wsgi et cgi..."
sudo a2enmod rewrite
sudo a2enmod cgi
sudo a2enmod wsgi
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo apache2ctl restart


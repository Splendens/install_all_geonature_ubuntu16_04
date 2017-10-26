Installation globale de Geonature, UsersHub, TaxHub et Geonature-Atlas, pour un serveur Ubuntu 16.04
===============

Exemple repris à partir de l'`installation globale <http://geonature.readthedocs.io/fr/latest/install_all/README.html>`_ des applications Geonature de gestion de données naturalistes (`GeoNature <https://github.com/PnEcrins/GeoNature>`_ version 1.9.0, `UsersHub <https://github.com/PnEcrins/UsersHub>`_, `TaxHub <https://github.com/PnX-SI/TaxHub>`_ et `GeoNature-atlas <https://github.com/PnEcrins/GeoNature-atlas>`_).


Installation du serveur
------------

**Utilisateur**


On commence l'installation en se connectant au serveur en SSH avec l’utilisateur linux ROOT.

- Mis à jour la liste des dépôts Linux

	``apt-get update``


- Création d’un utilisateur linux nommé geonatureadmin (par exemple). Dans cet exemple, le répertoire de cet utilisateur est dans /home/geonatureadmin

    ``adduser --home /home/geonatureadmin geonatureadmin``

	+ Entrer les informations demandées, notamment le mot de passe de l'utilisateur


- Donner les droits sudo à l'utilisateur

    ``adduser geonatureadmin sudo``


- Ajout de l'utilisateur aux groupes www-data et root

	``usermod -g www-data geonatureadmin``

	``usermod -a -G root geonatureadmin``



Durant toute la procédure d’installation, travailler avec l’utilisateur geonatureadmin (ou tout autre utilisateur linux ayant les droits sudo). Ne changer d’utilisateur que lorsque que la documentation le spécifie.

Se reconnecter avec le nouvel utilisateur pour ne pas faire l’installation en ROOT.

Se placer dans le répertoire de l'utilisateur

	``cd /home/geonatureadmin``


**1) Récupérer les fichiers d'installation ``install_all.ini`` et ``install_all.sh``**

	``wget https://github.com/Splendens/install_all_geonature_ubuntu16_04/blob/master/install_all.ini``


	``wget https://github.com/Splendens/install_all_geonature_ubuntu16_04/blob/master/install_all.sh``


Changer les droits du fichier d’installation pour pouvoir l’éxecuter

	``sudo chmod +x install_all.sh``

Pour plus d'informations, consulter la `documentation <http://geonature.readthedocs.io/fr/latest/install_all/2016-12-exemple-deploiement-pnr.html#installation>`_ du projet Geonature.

- Renseigner les variables à utiliser dans le fichier de configuration ``install_all.ini``

	+ La clé IGN ``macleign`` peut être générée sur `professionnels.ign.fr <http://professionnels.ign.fr/>`_ : pour un déploiement en local, choisir un type de sécurisation ``Referer``, et des valeurs de sécuisation ``localhost, localhost/*`` (ou autre selon la configuration des VirtualHost d'Apache)

	+ Renseigner les différents mots de passe : ``monpassachanger``

	+ Renseigner la version de `UsersHub <https://github.com/PnEcrins/UsersHub/releases>`_ à installer : ``usershub_release``

	+ Renseigner la version de `TaxHub <https://github.com/PnX-SI/TaxHub/releases>`_ à installer : ``taxhub_release``

	+ Renseigner la version de `Geonature-atlas <https://github.com/PnEcrins/GeoNature-atlas/releases>`_ à installer : ``atlas_release``


- Lancer l’installation

    ``./install_all.sh``




**2) OU lancer l'installation commande par commande** 

**Environnement logiciel**


- Ajout des repository nécessaires 

	``add-apt-repository ppa:ondrej/php``

	``apt update``


- Installation des packages

	``sudo apt-get install -y apache2``

	``sudo apt-get install -y php5.6 --allow-unauthenticated``

	``sudo apt-get install -y curl``

	``sudo apt-get install -y unzip``

	``sudo apt-get install -y git``

	``sudo apt-get install -y libapache2-mod-php5.6``

	``sudo apt-get install -y libapache2-mod-wsgi``

	``sudo apt-get install -y libapache2-mod-perl2``

	``sudo apt-get install -y php5.6-gd``

	``sudo apt-get install -y php5.6-pgsql`` 

	``sudo apt-get install -y cgi-mapserver``

	``sudo apt-get install -y gdal-bin``

	``sudo apt-get install -y libgeos-dev``

	``sudo apt-get install -y postgresql``

	``sudo apt-get install -y postgis --allow-unauthenticated``

	``sudo apt-get install -y postgresql-server-dev-9.5 --allow-unauthenticated``

	``sudo apt-get install -y postgresql-client``

	``sudo apt-get install -y python-dev``

	``sudo apt-get install -y python-pip``

	``sudo apt-get install -y libpq-dev``

	``sudo apt-get install -y python-setuptools``

	``sudo apt-get install -y python-gdal``

	``sudo apt-get install -y python-virtualenv``

	``sudo apt-get install -y build-essential`` 

	``sudo apt-get install -y npm --allow-unauthenticated``  
 
	``sudo apt-get install -y python3``

	``sudo apt-get install -y python3-dev`` 

	``sudo apt-get install -y supervisor`` 

	``sudo pip install virtualenv`` 



- Si PHP 7 est installé et activé, et que vous souhaitez switcher sur PHP 5.6 :

	``sudo a2dismod php7.0``

	``sudo a2enmod php5.6``

	``sudo services restart apache2``



- Configuration de PostgreSQL

	``sudo sed -e "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" -i /etc/postgresql/*/main/postgresql.conf``

	``sudo sh -c 'echo "host    all             all             0.0.0.0/0            md5" >> /etc/postgresql/9.5/main/pg_hba.conf'``
	
	``sudo /etc/init.d/postgresql restart``


- Création des utilisateurs postgreSQL (renseigner les utilisateurs et mots de passe avant de lancer les commandes :)

	``sudo -n -u postgres -s psql -c "CREATE ROLE geonatuser WITH LOGIN PASSWORD 'user_pg_pass_a_changer';"``

	``sudo -n -u postgres -s psql -c "CREATE ROLE geonatatlas WITH LOGIN PASSWORD 'user_atlas_pass_a_changer';"``


	+ si l'utilisateur superuser de postgres n'a pas encore été créé 

	``sudo -n -u postgres -s psql -c "CREATE ROLE mon_admin_pg WITH SUPERUSER LOGIN PASSWORD 'admin_pg_pass_a_changer';"``

	+ Pour changer les mots de passe d'un user

	``sudo -n -u postgres -s psql -c "ALTER ROLE mon_admin_pg WITH SUPERUSER LOGIN PASSWORD 'admin_pg_pass_a_changer';"``
	 

- Activation des modules d'Apache

	``sudo a2enmod wsgi``

	``sudo a2enmod cgi``

	``sudo a2enmod rewrite``

	``sudo apache2ctl restart``


- Vérifier que le répertoire ``/tmp`` existe et que l’utilisateur ``www-data`` y a accès en lecture/écriture.




Geonature
------------

**Installation de la base de données**

#todo


**Installation de l'application**

#todo



UserHub
------------

**Installation de la base de données**

#todo


**Installation de l'application**

#todo




TaxHub
------------

**Installation de la base de données**

#todo



**Installation de l'application**

#todo





Geonature-atlas
------------

**Installation de la base de données**

#todo


**Installation de l'application**

#todo


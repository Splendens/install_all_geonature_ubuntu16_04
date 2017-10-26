Installation globale de Geonature, UsersHub, TaxHub et Geonature-Atlas, pour un serveur Ubuntu 16.04
===============

Exemple repris à partir de l'`installation globale <http://geonature.readthedocs.io/fr/latest/install_all/README.html>`_ des applications Geonature de gestion de données naturalistes (`GeoNature <https://github.com/PnEcrins/GeoNature>`_, `UsersHub <https://github.com/PnEcrins/UsersHub>`_, `TaxHub <https://github.com/PnX-SI/TaxHub>`_ et `GeoNature-atlas <https://github.com/PnEcrins/GeoNature-atlas>`_).


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



**Environnement logiciel**


	``add-apt-repository ppa:ondrej/php``

	``apt update``

	``sudo apt-get install -y php5.6 --allow-unauthenticated``

	``sudo apt-get install -y curl unzip git``

	``sudo apt-get install -y apache2``

	``sudo apt-get install -y libapache2-mod-php5.6``

	``sudo apt-get install -y libapache2-mod-wsgi``

	``sudo apt-get install -y libapache2-mod-perl2``

	``sudo apt-get install -y php5.6-gd``

	``sudo apt-get install -y php5.6-pgsql`` 

	``sudo apt-get install -y cgi-mapserver``

	``sudo apt-get install -y gdal-bin``

	``sudo apt-get install -y libgeos-dev``

	``sudo apt-get install -y postgresql postgis postgresql-server-dev-9.5``

	``sudo apt-get install -y postgis --allow-unauthenticated``

	``sudo apt-get install -y postgresql-server-dev-9.5``

	``sudo apt-get install -y python-dev python-pip libpq-dev python-setuptools python-gdal python-virtualenv build-essential`` # a verifier

	``sudo apt-get install -y npm``  # a verifier
 
	``sudo apt-get install -y python3 python3-dev``   # a verifier

	``sudo pip install virtualenv``  # a verifier



- Si PHP 7 est installé et activé, et que vous souhaitez switcher sur PHP 5.6 :

	``sudo a2dismod php7.0``

	``sudo a2enmod php5.6``

	``systemctl restart apache2``






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


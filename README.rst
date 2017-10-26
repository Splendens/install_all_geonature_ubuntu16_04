Installation globale de Geonature, UsersHub, TaxHub et Geonature-Atlas, pour un serveur Ubuntu 16.04
===============

Exemple repris à partir de l'`installation globale <http://geonature.readthedocs.io/fr/latest/install_all/README.html>`_ des applications Geonature de gestion de données naturalistes (`GeoNature <https://github.com/PnEcrins/GeoNature>`_, `UsersHub <https://github.com/PnEcrins/UsersHub>`_, `TaxHub <https://github.com/PnX-SI/TaxHub>`_ et `GeoNature-atlas <https://github.com/PnEcrins/GeoNature-atlas>`_).


Installation du serveur
------------

On commence l'installation en se connectant au serveur en SSH avec l’utilisateur linux ROOT.

- Mis à jour la liste des dépôts Linux

	``apt-get update``


- Création d’un utilisateur linux nommé geonatureadmin (par exemple). Dans cet exemple, le répertoire de cet utilisateur est dans /home/geonatureadmin

    ``adduser --home /home/geonatureadmin geonatureadmin``

+ Entrer les informations demandées, notamment le mot de passe de l'utilisateur geonatureadmin


- Donner les droits sudo à l'utilisateur

    ``adduser geonatureadmin sudo``

- Ajout de l'utilisateur aux groupes www-data et root

	``usermod -g www-data geonatureadmin``
	``usermod -a -G root geonatureadmin``



Durant toute la procédure d’installation, travailler avec l’utilisateur geonatureadmin (ou tout autre utilisateur linux ayant les droits sudo). Ne changer d’utilisateur que lorsque que la documentation le spécifie.



- Installation du serveur web

	``sudo apt-get install apache2``


	+Installation de PHP 5.6

	``add-apt-repository ppa:ondrej/php``
	``apt update``
	``sudo apt-get install php5.6 --allow-unauthenticated``


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


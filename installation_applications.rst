

Installation des applications
===============

Se placer dans le répertoire de l'utilisateur

	``cd /home/geonatureadmin``


1) Instalation automatique 
------------

- Récupérer les fichiers d'installation install_all.ini et install_all_app.sh

	``wget https://github.com/Splendens/install_all_geonature_ubuntu16_04/blob/master/install_all.ini``

	``wget https://github.com/Splendens/install_all_geonature_ubuntu16_04/blob/master/install_all_app.sh``


- Si ce n'est pas déjà fait, renseigner les variables à utiliser dans le fichier de configuration ``install_all.ini``

	+ La clé IGN ``macleign`` peut être générée sur `professionnels.ign.fr <http://professionnels.ign.fr/>`_ : pour un déploiement en local, choisir un type de sécurisation ``Referer``, et des valeurs de sécurisation ``localhost, localhost/*`` (ou autre selon la configuration des VirtualHost d'Apache)

	+ Renseigner les différents mots de passe : ``monpassachanger``

	+ Renseigner la version de `UsersHub <https://github.com/PnEcrins/UsersHub/releases>`_ à installer : ``usershub_release``

	+ Renseigner la version de `TaxHub <https://github.com/PnX-SI/TaxHub/releases>`_ à installer : ``taxhub_release``

	+ Renseigner la version de `Geonature-atlas <https://github.com/PnEcrins/GeoNature-atlas/releases>`_ à installer : ``atlas_release``


- Changer les droits du fichier d’installation pour pouvoir l’éxecuter

	``sudo chmod +x install_all_app.sh``


Le fichier install_all_app.sh va automatiquement installer les applications et leur base de données

- Lancer l’installation

    ``./install_all_app.sh``




2) OU installation détaillée
------------

Suivre la prodédure d'installation commande par commande


UserHub
------------

**Téléchargement de UsersHub**

Remplacer ``X.Y.Z`` par la version de `UsersHub <https://github.com/PnEcrins/UsersHub/releases>`_  à installer (par exemple 1.2.2)

	``cd /tmp``

	``wget https://github.com/PnEcrins/UsersHub/archive/X.Y.Z.zip``

	``unzip X.Y.Z.zip``

	``rm X.Y.Z.zip``

	``mv UsersHub-X.Y.Z /home/geonatureadmin/usershub/``

	``cd /home/geonatureadmin/usershub``



**Installation de la base de données**

#todo


**Installation de l'application**

#todo




Geonature
------------

**Téléchargement de Geonature**

Remplacer ``X.Y.Z`` par la version de `GeoNature <https://github.com/PnX-SI/GeoNature/releases>`_ à installer (par exemple 1.9.0)

	``cd /tmp``

	``wget https://github.com/PnEcrins/GeoNature/archive/X.Y.Z.zip``

	``unzip X.Y.Z.zip``

	``rm X.Y.Z.zip``

	``mv GeoNature-X.Y.Z /home/geonatureadmin/geonature/``

	``cd /home/geonatureadmin/geonature``


**Installation de la base de données**

#todo


**Installation de l'application**

#todo




TaxHub
------------

**Téléchargement de TaxHub**

Remplacer ``X.Y.Z`` par la version de `TaxHub <https://github.com/PnX-SI/TaxHub/releases>`_ à installer (par exemple 1.3.1)

	``cd /tmp``

	``wget https://github.com/PnX-SI/TaxHub/archive/X.Y.Z.zip``

	``unzip X.Y.Z.zip``

	``rm X.Y.Z.zip``

	``mv TaxHub-X.Y.Z /home/geonatureadmin/taxhub/``

	``cd /home/geonatureadmin/taxhub``



**Installation de la base de données**

#todo



**Installation de l'application**

#todo





Geonature-atlas
------------

**Téléchargement de Geonature-atlas**

Remplacer ``X.Y.Z`` par la version de `Geonature-atlas <https://github.com/PnEcrins/GeoNature-atlas/releases>`_ à installer (par exemple 1.2.6)

	``cd /tmp``

	``wget https://github.com/PnEcrins/GeoNature-atlas/archive/X.Y.Z.zip``

	``unzip X.Y.Z.zip``

	``rm X.Y.Z.zip``

	``mv GeoNature-atlas-X.Y.Z /home/geonatureadmin/atlas/``

	``cd /home/geonatureadmin/atlas``


**Installation de la base de données**

#todo


**Installation de l'application**

#todo


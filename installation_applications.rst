

Installation des applications
===============

Avant d'installer les applications, vérifier que le serveur répond à tous les prérequis : https://github.com/Splendens/install_all_geonature_ubuntu16_04/blob/master/installation_serveur.rst


Instalation 
------------


- Se placer dans le répertoire de l'utilisateur

	``cd /home/geonatureadmin``


- Récupérer les fichiers d'installation install_all.ini et install_all_app.sh

	``wget https://raw.githubusercontent.com/Splendens/install_all_geonature_ubuntu16_04/master/install_all.ini``

	``wget https://raw.githubusercontent.com/Splendens/install_all_geonature_ubuntu16_04/master/install_all_app.sh``


- Si ce n'est pas déjà fait, renseigner les variables à utiliser dans le fichier de configuration ``install_all.ini``

	+ La clé IGN ``macleign`` peut être générée sur `professionnels.ign.fr <http://professionnels.ign.fr/>`_ : pour un déploiement en local, choisir un type de sécurisation ``Referer``, et des valeurs de sécurisation ``localhost, localhost/*`` (ou autre selon la configuration des VirtualHost d'Apache)

	+ Renseigner les différents mots de passe : ``monpassachanger``

	+ Renseigner la version de `UsersHub <https://github.com/PnEcrins/UsersHub/releases>`_ à installer : ``usershub_release``

	+ Renseigner la version de `TaxHub <https://github.com/PnX-SI/TaxHub/releases>`_ à installer : ``taxhub_release``

	+ Renseigner la version de `Geonature-atlas <https://github.com/PnEcrins/GeoNature-atlas/releases>`_ à installer : ``atlas_release``


- Changer les droits du fichier d’installation pour pouvoir l’éxecuter

	``sudo chmod +x install_all_app.sh``


Le fichier install_all_app.sh va installer automatiquement les applications et leur base de données

- Lancer l’installation

    ``./install_all_app.sh``


Connexion aux applications
------------

Tester les applications dans un navigateur web avec l’utilisateur par défaut (admin / admin) : 

http://mondomaine/usershub

http://mondomaine/geonature

http://mondomaine/taxhub

http://mondomaine/atlas



Notes 
------------

Corrections apportées à l'installation globale.


**UserHub**





**Geonature**

Modifications du install_db : corrections des liens morts, ajout de l'extension postgis_topology.



**TaxHub**


port 5000 à la place 8000



**Geonature-atlas**


Modifications du install_db : corrections des liens morts, ajout de l'extension postgis_topology.




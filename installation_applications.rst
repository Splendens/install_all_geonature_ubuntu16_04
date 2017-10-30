

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

Corrections apportées à l'installation globale :

- **Geonature** - Modifications du install_db : corrections des liens morts, ajout de l'extension postgis_topology.

- **TaxHub** - Modification du paramétrage d'Apache : écoute sur le port 5000 à la place de 8000.

- **Geonature-atlas** - Modifications du install_db : corrections des liens morts, ajout de l'extension postgis_topology.


Adaptations des applications :

- **UsersHub** - vérifier que l'utilisateur propriétaire de la usershubdb est bien le même que celui de geonaturedb ; éditer manuellement le fichier config/dbconnexions.json et y ajouter les paramètres de connexions à toutes les bd qu’on souhaite synchroniser avec UsersHub

- **Geonature** - selon besoin, éditer les fichiers de configuration apache : apache/sf.conf, apache/synthese.conf, apache/wms.conf ; et éditer les fichiers de configuration de l'application : web/js/config.js, web/js/configmap.js, lib/sfGeonatureConfig.php 

- **TaxHub** - si TaxHub s'ouvre sur un page blanche, vérifier que le répertoire /static/node_modules/ est bien présent, s'il est absent se placer dans /static/ ``cd /home/geonatureadmin/taxhub/static/`` et lancer la commande ``sudo npm install`` ; si la commande n'a pas fonctionné (pas de création du répertoire /static/node_modules/), lancer les commandes ``npm config set registry http://registry.npmjs.org/`` puis ``npm install``

- **Geonature-atlas** - adapter le rendu sur sont territoire, voir : https://github.com/Splendens/atlas_biodiv_pdl/blob/master/modifdb/teritoires.rst


En cas d'erreurs ou pour plus d'informations sur les applications, leur installation et leur adaptation, se référer à la documentation de `UsersHub <http://usershub.readthedocs.io/fr/latest/installation.html#configuration-de-l-application>`_, `Geonature <http://geonature.readthedocs.io/fr/latest/installation.html#configuration-de-l-application>`_,  `TaxHub <http://taxhub.readthedocs.io/fr/latest/installation.html#creation-de-la-base-de-donnees>`_ et `Geonature-Atlas <https://github.com/PnEcrins/GeoNature-atlas/blob/master/docs/installation.rst>`_.



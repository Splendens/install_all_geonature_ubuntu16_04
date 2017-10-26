#!/bin/bash

if [ "$(id -u)" == "0" ]; then
   echo -e "\e[91m\e[1mThis script should NOT be run as root\e[0m" >&2
   exit 1
fi

virtualenv ./venv

. ./venv/bin/activate
pip install -r requirements.txt

mkdir ./static/custom/images/

cp ./main/configuration/config.py.sample ./main/configuration/config.py
cp ./main/configuration/settings.ini.sample ./main/configuration/settings.ini
cp ./static/custom/templates/footer.html.sample ./static/custom/templates/footer.html
cp ./static/custom/templates/introduction.html.sample ./static/custom/templates/introduction.html
cp ./static/custom/templates/presentation.html.sample ./static/custom/templates/presentation.html
cp ./static/custom/templates/credits.html.sample ./static/custom/templates/credits.html
cp ./static/custom/templates/mentions-legales.html.sample ./static/custom/templates/mentions-legales.html
cp ./static/custom/custom.css.sample ./static/custom/custom.css
cp ./static/custom/glossaire.json.sample ./static/custom/glossaire.json
cp ./static/images/sample.favicon.ico ./static/custom/images/favicon.ico
cp ./static/images/sample.accueil-intro.jpg ./static/custom/images/accueil-intro.jpg
cp ./static/images/sample.logo-structure.png ./static/custom/images/logo-structure.png
cp ./static/images/sample.logo_patrimonial.png ./static/custom/images/logo_patrimonial.png

cp ./data/ref/communes.dbf.sample ./data/ref/communes.dbf
cp ./data/ref/communes.prj.sample ./data/ref/communes.prj
cp ./data/ref/communes.shp.sample ./data/ref/communes.shp
cp ./data/ref/communes.shx.sample ./data/ref/communes.shx

cp ./data/ref/territoire.dbf.sample ./data/ref/territoire.dbf
cp ./data/ref/territoire.prj.sample ./data/ref/territoire.prj
cp ./data/ref/territoire.shp.sample ./data/ref/territoire.shp
cp ./data/ref/territoire.shx.sample ./data/ref/territoire.shx
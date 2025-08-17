# Docker images Python met MariaDB

## Installatie
* Open de hoofmap van de repository in Visual Studio Code (of andere editor)
* Open een terminal-venster
* Maak in de hoofdmap van de repository een map aan met de naam `db_data`.
* Daarna vanuit installeren met `docker-compose up`

Er worden 3 containers gestart:
* Python
* MariaDB
* PHPMyAdmin

## Python
* De app-map is de plek waar je de python-bestanden in opslaat.
* De modules in het bestand requirements.txt zijn al geïnstalleerd (zie Dockerfile)
* Je kunt python-scripts uitvoeren door eerst een interactieve terminal te starten:
    * Open een nieuw terminal-venster in je editor
    * `docker exec -it python-app-1 bash` (zie voor exacte naam `docker ps`)
    * Vervolgens kun je scripts starten op de gebruikelijke manier bijv. `python main.py`

## MariaDB
* In de db_init map staat een init.sql script. Tijdens `docker compose up` wordt dit bestand gekopieerd naar de maria-db server en uitgevoerd.
* Er worden twee databases aangemaakt en er wordt een user aangemaakt die je kunt gebruiken met PHPMyAdmin. (pas passwords aan!)
* In docker-compose.yml wordt een root-user met password gedefinieerd. (pas passwords hier ook aan!)
* Je kunt de database beheren met een mysql-client op je host systeem of je kunt gebruik maken van PHPMyAdmin.
* Om er voor te zorgen dat alle data niet verloren gaat, worden de data-bestanden opgeslagen in de map db_data op het host-systeem

## PHPMyAdmin
* Je kunt PHPMyAdmin gebruiken om de database-server (mariadb) te beheren.
* Ga met je browser naar `http://127.0.0.1:8080`
* Log in met de root-user en wachtwoord (zie docker-compose.yml)
* Je kunt ook inloggen met de speciale phpmyadmin_user (zie /db/init.sql)

# Docker images Python met MariaDB

## Installatie
* Open de hoofmap van de repository in Visual Studio Code (of andere editor)
* Open een terminal-venster
* Daarna vanuit de hoofdmap installeren met `docker-compose up`

Er worden 3 containers gestart:
* Python
* MariaDB
* PHPMyAdmin

## Python
* De app-map is de plek waar je de python-bestanden in opslaat.
* De modules in het bestand requirements.txt zijn al geïnstalleerd (zie Dockerfile)
* Je kunt python-scripts uitvoeren door eerst een interactieve terminal te starten:
    * Open een nieuw terminal-venster in je editor
    * `docker exec -it -u appuser python-app-1 bash` (zie voor exacte naam `docker ps`)
    * Vervolgens kun je scripts starten op de gebruikelijke manier bijv. `python main.py`

## MariaDB
* In docker-compose.yml is een user `root` met `password` gedefinieerd. (MARIADB_ROOT_PASSWORD)


## PHPMyAdmin
* Je kunt PHPMyAdmin gebruiken om de database-server (mariadb) te beheren.
* Ga met je browser naar `http://127.0.0.1:8082`
* Log in met de root-user en wachtwoord
* Je kunt ook inloggen met de speciale phpmyadmin_user (zie /db/init.sql)

## Installeren school database
* Ga naar PHPMyAdmin en log in.
* Maak een database aan met de naam `school`
* Importeer het sql-bestand [school.sql](https://static.edutorial.nl/dbq/school.sql)

## Backup maken van alle databases
* Maak een back up met `docker compose run --rm backup`
* Backups worden niet meegenomen in de synchronisatie naar github.

![setup docker_python containers](https://static.edutorial.nl/python/setup_docker.svg)
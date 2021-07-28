#!/bin/bash
#date du jour
DATE=`date +%d.%m.%Y_%H.%M`

#liste des dossier
LISTEBDD=$( echo 'show databases' | mysql -uroot -pYourPassWordHere )

#on boucle sur chaque dossier (for découpe automatiquement par l'espace)
for SQL in $LISTEBDD
do
	if [ $SQL != "information_schema" ] && [ $SQL != "mysql" ] && [ $SQL != "Database" ] && [ $SQL != "performance_schema" ]; then
		#echo $SQL
		mysqldump -uroot -pYourPassWordHere $SQL | gzip > /home/backups/fivem/mysql/$SQL"-"$DATE.sql.zip
	fi
done

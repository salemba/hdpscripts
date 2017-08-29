###############################################################################################################
# Utility script to start Solr server in cloud mode with remote ZK servers
#
#	Version : 1.0
#	Date	: 29/08/2017
###############################################################################################################
#!/bin/bash

if [ -f "config.properties" ]; then
        source config.properties
else
        echo "Configuration file not found..."
        exit
fi

echo -e "Lancement de Solr en mode Cloud avec Zookeeper sur $solr_server"

sudo /opt/lucidworks-hdpsearch/solr/bin/solr start -c -z $zk_cs >> /dev/null &

echo "Vérification de l'état du serveur Solr…."
sleep 30
RESULT=$(curl -s -o /dev/null -I -w '%{http_code}' http://$solr_server:8983/solr/admin/cores?action=STATUS)

if [ "$RESULT" -eq '200' ]; then
    echo -e "SOLR est maintenant lancé....................[${GREEN} OK ${NC}]"
else
    echo -e "Solr n'est pas démarré........................[${RED} NOK ${NC}]"

fi
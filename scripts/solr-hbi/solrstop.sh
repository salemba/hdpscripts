###############################################################################################################
# Utility script to stop Solr server in cloud mode with remote ZK servers
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
echo -e "Arrêt de Solr ......"

sudo $solr_home/bin/solr stop -all >> /dev/null &

echo "Vérification de l'état du serveur Solr…."
sleep 30
RESULT=$(curl -s -o /dev/null -I -w '%{http_code}' http://$solr_server:8983/solr/admin/cores?action=STATUS)

if [ "$RESULT" -ne '200' ]; then
    echo -e "SOLR est maintenant arrêté....................[${GREEN} OK ${NC}]"
else
    echo -e "Solr n'a pas pu être arrêté........................[${RED} NOK ${NC}]"

fi

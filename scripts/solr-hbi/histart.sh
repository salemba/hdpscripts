###############################################################################################################
# Utility script to start Hbase Indexer using remote ZK connection string
#
#	Version 1.0
#	Date	: 28/08/2017
###############################################################################################################
#!/bin/bash

if [ -f "config.properties" ]; then
        source config.properties
else
        echo "Configuration file not found..."
        exit
fi
echo "ZK connection String  :  $zk_cs"
echo "Using Hbase Indexer server : $hi_server"
echo -e "Démarrage de HBase-indexer ......"

nohup $hi_home/bin/hbase-indexer server -zookeeper $zk_cs >> /dev/null &

echo "Vérification de l'état du serveur Hbase-Indexer."
sleep 30
RESULT=$(curl -s -o /dev/null -I -w '%{http_code}' http://$hi_server:11060/indexer)

if [ "$RESULT" -eq '200' ]; then
    echo -e "HBase-Indexer est maintenant démarré....................[${GREEN} OK ${NC}]"
else
    echo -e "Hbase-Indexer n'est pas démarré........................[${RED} NOK ${NC}]"
fi

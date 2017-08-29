###############################################################################################################
# Utility script update HBase indexer configuration. XML Configuration file must be placed under 
#	$hi_home/mapping
#
#	Version : 1.0
#	Date	: 29/08/2017
###############################################################################################################
#!/bin/bash

if [ -f "config.properties" ]; then
        source config.properties
else
        echo "Script Configuration file not found..."
        exit
fi
if [ -f "$hi_home/mapping/$hi_mapping" ]; then
        sudo $hi_home/bin/hbase-indexer update-indexer -n $hi_indexer_name -c $hi_home/mapping/$hi_mapping  -cp solr.zk=$zk_cs -cp solr.collection=$collection_name --zookeeper $zk_cs
		echo -e "HBase-indexer server was updated successfully ..........................[${GREEN} NOK ${NC}]"
else
		echo "Missing configuration file $hi_home/mapping/$hi_mapping"
		echo -e "HBase-indexer server was not updated ...................................[${RED} NOK ${NC}]"
		exit
fi

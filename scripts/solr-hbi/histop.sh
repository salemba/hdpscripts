###############################################################################################################
# Utility script to stop Hbase Indexer using remote ZK connection string
#
#       Version : 1.0
#       Date    : 29/08/2017
###############################################################################################################
#!/bin/bash

if [ -f "config.properties" ]; then
        source config.properties
else
        echo "Configuration file not found..."
        exit
fi
echo "Using Hbase Indexer PN : $hbase_indexer_pn"

PID=$(ps aux | grep "$hbase_indexer_pn" | grep -v grep |awk '{print $2}')
if [ -n "$PID" ]; then

                echo "HBase Indexer Server is running [PID = $PID]... killing the process."
                sudo kill -9 $PID
        PID=$(ps aux | grep "hbase-indexer server" | grep -v grep |awk '{print $2}')
        if [ -n "$PID" ]; then
                echo -e "Could not stop HBase Indexer. ...........................[${RED} NOK ${NC}]"
                echo "Please run the command kill -9 $PID and check what went wrong with it."
        else
                echo -e "HBase-indexer stopped ...................................[${GREEN} OK ${NC}]"
        fi
else

                echo -e "HBase Indexer Server is already stopped..................[${GREEN} OK ${NC}]"

fi

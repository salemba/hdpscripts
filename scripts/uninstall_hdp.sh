GREEN='\033[0;32m'
NC='\033[0m'
echo -e "Removing HDP previously installed packages......"
sudo yum remove -d 0 -e 0 -y hive\*
sudo yum remove -d 0 -e 0 -y oozie\*
sudo yum remove -d 0 -e 0 -y pig\*
sudo yum remove -d 0 -e 0 -y zookeeper\*
sudo yum remove -d 0 -e 0 -y tez\*
sudo yum remove -d 0 -e 0 -y hbase\*
sudo yum remove -d 0 -e 0 -y ranger\*
sudo yum remove -d 0 -e 0 -y knox\*
sudo yum remove -d 0 -e 0 -y ranger\*
sudo yum remove -d 0 -e 0 -y storm\*
sudo yum remove -d 0 -e 0 -y hadoop\*
echo -e "Major components uninstalled.....................[${GREEN}OK${NC}]"
echo -e "Stopping ambari server..........................."
sudo ambari-server stop
echo -e "Stopped ambari server............................[${GREEN}OK${NC}]"
sudo ambari-server reset
echo -e "Ambari database reset............................[${GREEN}OK${NC}]"
sudo yum erase -d 0 -e 0 -y ambari-server
sudo yum erase -d 0 -e 0 -y hdp-select
sudo yum remove -d 0 -e 0 -y smartsense-hst
echo -e "Erased Ambari server............................[${GREEN}OK${NC}]"
sudo -u postgres psql -U postgres -c "drop database ambari"
sudo yum erase -y postgres\*
echo -e "Erased Postgres database........................[${GREEN}OK${NC}]"
sudo ambari-agent stop
sudo yum erase -y ambari-agent
echo -e "Erased Ambari agents............................[${GREEN}OK${NC}]"
sudo rm -Rf /usr/lib/flume
sudo rm -Rf /usr/lib/storm
sudo rm -Rf /var/lib/hadoop-hdfs
sudo rm -Rf /var/lib/hadoop-yarn
sudo rm -Rf /var/lib/hadoop-mapreduce
sudo rm -Rf /var/lib/flume
sudo rm -Rf /var/lib/knox
sudo rm -Rf /local/home/zookeeper/*
sudo rm -Rf /var/run/hadoop
sudo rm -Rf /var/run/hbase
sudo rm -Rf /var/run/hadoop-yarn
sudo rm -Rf /var/run/hadoop-mapreduce
sudo rm -Rf /var/run/hive
sudo rm -Rf /var/run/oozie
sudo rm -Rf /var/run/zookeeper
sudo rm -Rf /var/run/flume
sudo rm -Rf /var/run/hive-hcatalog
sudo rm -Rf /var/run/falcon
sudo rm -Rf /var/run/webhcat
sudo rm -Rf /var/run/knox
sudo rm -Rf /etc/hadoop
sudo rm -Rf /etc/hbase
sudo rm -Rf /etc/oozie
sudo rm -Rf /etc/phoenix
sudo rm -Rf /etc/hive
sudo rm -Rf /etc/zookeeper
sudo rm -Rf /etc/flume
sudo rm -Rf /etc/hive-hcatalog
sudo rm -Rf /etc/tez
sudo rm -Rf /etc/falcon
sudo rm -Rf /etc/knox
sudo rm -Rf /etc/hive-webhcat
sudo rm -Rf /etc/mahout
sudo rm -Rf /etc/pig
sudo rm -Rf /etc/hadoop-httpfs
sudo rm -Rf /usr/hdp/*
sudo rm -Rf /usr/bin/hadoop
sudo rm -Rf /tmp/hadoop
sudo rm -Rf /var/hadoop
sudo rm -Rf /hadoop/*
sudo rm -Rf /local/opt/hadoop
sudo rm -Rf /var/log/ambari-metrics-monitor
sudo rm -Rf /var/log/hadoop
sudo rm -Rf /var/log/hbase
sudo rm -Rf /var/log/hadoop-yarn
sudo rm -Rf /var/log/hadoop-mapreduce
sudo rm -Rf /var/log/hive
sudo rm -Rf /var/log/oozie
sudo rm -Rf /var/log/zookeeper
sudo rm -Rf /var/log/flume
sudo rm -Rf /var/log/hive-hcatalog
sudo rm -Rf /var/log/falcon
sudo rm -Rf /var/log/knox
sudo rm -Rf /var/lib/hive
sudo rm -Rf /var/lib/oozie
echo -e "Deleted Ambari related files and directories.........[${GREEN}OK${NC}]"
echo "Uninstalled All HDP components..........................[${GREEN}Finish${NC}]"
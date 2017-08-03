sudo yum remove -y hive\*
sudo yum remove -y oozie\*
sudo yum remove -y pig\*
sudo yum remove -y zookeeper\*
sudo yum remove -y tez\*
sudo yum remove -y hbase\*
sudo yum remove -y ranger\*
sudo yum remove -y knox\*
sudo yum remove -y ranger\*
sudo yum remove -y storm\*
sudo yum remove -y hadoop\*
sudo yum remove -y hadoop\*
sudo ambari-server stop
sudo yum erase -y ambari-server
sudo ambari-agent stop
sudo yum erase -y ambari-agent
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

echo "Uninstalled All HDP components"
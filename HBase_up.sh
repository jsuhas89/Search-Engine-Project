cd /root/software/hadoop-1.1.2/
. ./MultiNodesOneClickStartUp.sh  /root/software/jdk1.6.0_33/ nodes
cd /root/software/hbase-0.94.7/
./bin/start-hbase.sh
cp /root/software/hbase-0.94.7/conf/hbase-site.xml  /root/software/hadoop-1.1.2/conf/
cd /root/software/hadoop-1.1.2/
export HADOOP_CLASSPATH=`/root/software/hbase-0.94.7/bin/hbase classpath`
./bin/hadoop jar lib/cglHBaseMooc.jar iu.pti.hbaseapp.clueweb09.TableCreatorClueWeb09
mkdir -p /root/MoocHomeworks/HBaseWordCount/data/clueweb09/mrInput

./bin/hadoop jar lib/cglHBaseMooc.jar iu.pti.hbaseapp/clueweb09.Helpers create-mr-input /root/MoocHomeworks/HBaseWordCount/data/clueweb09/files/ /root/MoocHomeworks/HBaseWordCount/data/clueweb09/mrInput/ 1

./bin/hadoop dfs -copyFromLocal /root/MoocHomeworks/HBaseWordCount/data/clueweb09/mrInput/ /cw09LoadInput

./bin/hadoop dfs -ls /cw09LoadInput

./bin/hadoop jar lib/cglHBaseMooc.jar iu.pti.hbaseapp.clueweb09.DataLoaderClueWeb09 /cw09LoadInput

./bin/hadoop jar lib/cglHBaseMooc.jar iu.pti.hbaseapp.HBaseTableReader clueWeb09DataTable details string string string string 1 > dataTable1.txt







hdfs dfs -rm -f -R /Spark/

javac -cp /home/laboratory/hadoop-2.7.1/share/hadoop/common/hadoop-common-2.7.1.jar:/home/laboratory/hadoop-2.7.1/share/hadoop/mapreduce/hadoop-mapreduce-client-core-2.7.1.jar:/home/laboratory/hadoop-2.7.1/share/hadoop/mapreduce/hadoop-mapreduce-client-common-2.7.1.jar utilities/StringJoin.java -d .

javac -cp /home/laboratory/hadoop-2.7.1/share/hadoop/common/hadoop-common-2.7.1.jar:/home/laboratory/hadoop-2.7.1/share/hadoop/mapreduce/hadoop-mapreduce-client-core-2.7.1.jar:/home/laboratory/hadoop-2.7.1/share/hadoop/mapreduce/hadoop-mapreduce-client-common-2.7.1.jar:/home/laboratory/workspace/moead_parallel/commons-math-2.2-sources.jar:./ mop/CMoChromosome.java -d .

javac -cp /home/laboratory/hadoop-2.7.1/share/hadoop/common/hadoop-common-2.7.1.jar:/home/laboratory/hadoop-2.7.1/share/hadoop/mapreduce/hadoop-mapreduce-client-core-2.7.1.jar:/home/laboratory/hadoop-2.7.1/share/hadoop/mapreduce/hadoop-mapreduce-client-common-2.7.1.jar mop/Sorting.java -d .

javac -cp /home/laboratory/hadoop-2.7.1/share/hadoop/common/hadoop-common-2.7.1.jar:/home/laboratory/hadoop-2.7.1/share/hadoop/mapreduce/hadoop-mapreduce-client-core-2.7.1.jar:/home/laboratory/hadoop-2.7.1/share/hadoop/mapreduce/hadoop-mapreduce-client-common-2.7.1.jar:/home/laboratory/hadoop-2.7.1/share/hadoop/common/lib/commons-logging-1.1.3.jar:/home/laboratory/workspace/moead_parallel/apache-commons-lang.jar:/home/laboratory/workspace/moead_parallel/commons-math-2.2-sources.jar:./:/home/laboratory/spark-1.5.1-bin-hadoop2.6/lib/spark-assembly-1.5.1-hadoop2.6.0.jar sp/CheaSpPartition.java -d .       


jar -cvf CheaSpPartition.jar . 

export HADOOP_CONF_DIR=/home/laboratory/hadoop-2.7.1/etc/hadoop
#spark-submit --master yarn-client --name JavaWordCount --class practise.JavaWordCount --executor-memory 1G --total-executor-cores 2 ./JavaWordCount.jar hdfs://master/input/
#spark-submit --master spark://master:7077 --jars /home/laboratory/spark-1.5.1-bin-hadoop2.6/lib/spark-assembly-1.5.1-hadoop2.6.0.jar --name CheaSp --class sp.CheaSp --executor-memory 1G --total-executor-cores 4 ./CheaSp.jar 
#spark-submit --master spark://master:7077 --jars /home/laboratory/spark-1.5.1-bin-hadoop2.6/lib/spark-assembly-1.5.1-hadoop2.6.0.jar --name CheaSp --class sp.CheaSp --executor-memory 1G --total-executor-cores 2 ./CheaSp.jar 
spark-submit --master spark://master:7077 --jars /home/laboratory/spark-1.5.1-bin-hadoop2.6/lib/spark-assembly-1.5.1-hadoop2.6.0.jar --name CheaSpPartition --class sp.CheaSpPartition --executor-memory 1G --total-executor-cores 1 ./CheaSpPartition.jar 

#spark-submit --master yarn-cluster --jars /home/laboratory/spark-1.5.1-bin-hadoop2.6/lib/spark-assembly-1.5.1-hadoop2.6.0.jar --name CheaSp --class sp.CheaSp --executor-memory 1G --executor-cores 2 ./CheaSp.jar 
#hdfs dfs -mkdir practise
#hdfs dfs -put ./practise/* practise

#spark-class \
#org.apache.spark.deploy.yarn.Client \
#--jar /home/laboratory/spark-1.5.1-bin-hadoop2.6/lib/spark-assembly-1.5.1-hadoop2.6.0.jar  \
#--class practise.JavaWordCount \
#--arg yarn-standalone \
#--arg /input/

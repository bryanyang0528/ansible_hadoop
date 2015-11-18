#!/bin/bash
SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null
(rm -rf $SCRIPT_PATH/packages; mkdir $SCRIPT_PATH/packages)
(cd $SCRIPT_PATH/packages; wget -c http://archive.cloudera.com/cdh5/cdh/5/zookeeper-3.4.5-cdh5.4.7.tar.gz)
(cd $SCRIPT_PATH/packages; wget -c http://archive.cloudera.com/cdh5/cdh/5/hadoop-2.6.0-cdh5.4.7.tar.gz)
(cd $SCRIPT_PATH/packages; wget -c http://www.us.apache.org/dist/spark/spark-1.5.2/spark-1.5.2-bin-without-hadoop.tgz)
(cd $SCRIPT_PATH/packages; wget -c http://www.eu.apache.org/dist/kafka/0.8.2.2/kafka_2.10-0.8.2.2.tgz)

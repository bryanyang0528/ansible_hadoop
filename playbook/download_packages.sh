#!/bin/bash
SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null
#(rm -rf $SCRIPT_PATH/packages; mkdir $SCRIPT_PATH/packages)
(cd $SCRIPT_PATH/packages; wget -c http://archive.cloudera.com/cdh5/cdh/5/zookeeper-3.4.5-cdh5.4.7.tar.gz)
(cd $SCRIPT_PATH/packages; wget -c http://archive.cloudera.com/cdh5/cdh/5/hadoop-2.6.0-cdh5.4.7.tar.gz)
(cd $SCRIPT_PATH/packages; wget -c http://archive.cloudera.com/cdh5/cdh/5/hive-1.1.0-cdh5.4.7.tar.gz)
(cd $SCRIPT_PATH/packages; wget -c http://www.us.apache.org/dist/spark/spark-1.5.1/spark-1.5.1-bin-without-hadoop.tgz)

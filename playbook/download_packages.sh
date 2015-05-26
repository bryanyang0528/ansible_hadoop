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
(cd $SCRIPT_PATH/packages; wget http://archive.cloudera.com/cdh5/cdh/5/zookeeper-3.4.5-cdh5.4.2.tar.gz)
(cd $SCRIPT_PATH/packages; wget http://archive.cloudera.com/cdh5/cdh/5/hadoop-2.6.0-cdh5.4.2.tar.gz)
(cd $SCRIPT_PATH/packages; wget http://d3kbcqa49mib13.cloudfront.net/spark-1.3.1-bin-hadoop2.6.tgz)

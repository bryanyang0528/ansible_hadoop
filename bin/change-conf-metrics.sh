#!/bin/bash
SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null
$SCRIPT_PATH/stop-all.sh
ansible -i $SCRIPT_PATH/../hosts/ansible_hosts all --sudo -m copy -a "src=conf/hadoop-metrics2.properties dest=/usr/local/hadoop/etc/hadoop/hadoop-metrics2.properties"
$SCRIPT_PATH/start-all.sh

#!/bin/bash
SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null
ansible -i $SCRIPT_PATH/../playbook/hosts all --sudo -m raw -a "rm -rf /usr/local/hadoop/logs/*"
$SCRIPT_PATH/start-zk.sh
$SCRIPT_PATH/start-dfs.sh
$SCRIPT_PATH/start-yarn.sh
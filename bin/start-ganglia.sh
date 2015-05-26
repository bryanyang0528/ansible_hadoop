#!/bin/bash
SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null
ansible -i $SCRIPT_PATH/../playbook/hosts master --sudo -m raw -a "service gmetad start"
sleep 10
ansible -i $SCRIPT_PATH/../playbook/hosts all --sudo -m raw -a "service ganglia-monitor start"
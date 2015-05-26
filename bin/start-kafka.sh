#!/bin/bash
SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null
ansible -i $SCRIPT_PATH/../hosts/ansible_hosts slaves --sudo -m raw -a "sudo su - kafka -c '/usr/local/kafka/bin/kafka-server-start.sh -daemon /usr/local/kafka/config/server.properties'"

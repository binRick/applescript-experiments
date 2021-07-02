#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
while :; do 
  (
    date +%s
    echo -ne " "
    ./get_current_active_application.sh
    echo -e ""
  )|tr '\n' ' '|tr -s ' '|sed 's/[[:space:]]/ /g'; echo -e ""
  sleep 1

done



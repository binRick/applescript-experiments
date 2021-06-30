#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

./ls.sh |tr ' ' '_'| while read -r app; do
  echo -e "app=$app"
  script="./$app.osa"
  eval $script &
done

wait

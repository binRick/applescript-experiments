#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

while :; do
  ./GetNameAndTitleOfActiveWindow.osa
  sleep 5
done

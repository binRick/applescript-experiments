#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

./GetNameAndTitleOfActiveWindow.osa|cut -d, -f1



#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
PID="${1}"
tf=$(mktemp)

./exec_osa.sh set_pid_focus.osa $PID

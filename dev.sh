#!/usr/bin/env bash
set -e


script="setup.osa"
SCRIPT_CMD="command osascript $script"
OSASCRIPT="tell application \"System Events\" to get the name of every process whose background only is false"
CMD="echo \"Applications:\"; command osascript -e '$OSASCRIPT'; $SCRIPT_CMD"
#echo $CMD
#exit
nodemon -w . -e osa -x sh -- -c "$CMD"

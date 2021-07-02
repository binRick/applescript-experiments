#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
PID="${1}"
tf=$(mktemp)

osa_script="$1"
PID="$2"


rm_tf(){
 [[ -f $tf ]] && unlink $tf
 true
}
trap rm_tf EXIT


cat << EOF > $tf
#!/usr/bin/env osascript
set PID to $PID
EOF
cat $osa_script >> $tf

chmod +x $tf
eval $tf

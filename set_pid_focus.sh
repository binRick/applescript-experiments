#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
PID="${1}"
tf=$(mktemp)



rm_tf(){
 [[ -f $tf ]] && unlink $tf
 true
}
trap rm_tf EXIT


cat << EOF > $tf
#!/usr/bin/env osascript
set PID to $PID

tell application "System Events"
  set frontmost of every process whose unix id is PID to true
end tell
EOF

chmod +x $tf
eval $tf

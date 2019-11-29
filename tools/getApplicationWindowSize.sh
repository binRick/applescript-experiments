#!/usr/bin/env bash 

APP="$1"

F=$(mktemp)
echo -e "tell application \"System Events\" to tell application process \"${APP}\"" >> $F
echo -e "           get size of window 1" >> $F
echo -e "end tell" >> $F

CMD="osascript $F"
OUT="$(eval $CMD)"
exit_code=$?

echo $OUT

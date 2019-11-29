#!/usr/bin/env bash 

APP="$1"

CMD="osascript -e 'tell application \"${APP}\" to activate'"

OUT="$(eval $CMD)"
exit_code=$?


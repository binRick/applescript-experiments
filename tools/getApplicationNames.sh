#!/usr/bin/env bash 


CMD="osascript -e 'tell application \"System Events\" to get the name of every process whose background only is false'"

OUT="$(eval $CMD)"
exit_code=$?

echo $OUT \
    | tr ',' '\n' \
    |sed 's/^[[:space:]]//g' \
    |sort|uniq


#!/usr/bin/env bash 


osascript -e "tell application \"Google Chrome\" to return URL of active tab of front window"
osascript -e 'tell application "Google Chrome" to return title of active tab of front window'


osascript -e 'tell application id "com.google.Chrome"' \
          -e 'set win to make new window' \
          -e 'set URL of active tab of win to "%s"' \
          -e 'end tell'

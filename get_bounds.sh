#!/usr/bin/env osascript
app="$1"

tell application "$app"
    get bounds of window of desktop
end tell

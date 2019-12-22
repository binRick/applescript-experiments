#!/bin/bash


echo -ne "Current App: "

osascript -e 'tell application "System Events" to set frontApp to name of first process whose frontmost is true'




echo;
./getApplicationNames.sh|while IFS= read -r app; do 
    echo -e " ## $app ##"
    echo -ne "      position: "; 
    ./getApplicationWindowPosition.sh "$app" 2>/dev/null; 
    echo -ne "      size: "; 
    ./getApplicationWindowSize.sh "$app" 2>/dev/null
    echo
done

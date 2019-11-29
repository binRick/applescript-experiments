#!/usr/bin/env bash 



a(){
osascript   -e 'tell application "iTerm2"' \
            -e '      select first terminal window' \
            -e '      tell current window' \
            -e '        create tab with profile "MAC PRO"' \
            -e '      endtell' \
            -e '      tell first session of current tab of current window' \
            -e '        write text "coffee"' \
            -e '      endtell' \
            -e 'endtell' 
}

b(){
osascript   -e 'tell application "iTerm2"' \
            -e '      create window with default profile' \
            -e '      tell current session of current window' \
            -e '          split horizontally with profile "MAC PRO"' \
            -e '          split vertically with profile "Local Profile"' \
            -e '      end tell' \
            -e 'end tell'
}

c(){
osascript   -e 'tell application "iTerm2"' \
            -e '     set newWindow to (create window with default profile command "pwd")' \
            -e 'end tell'
}

d(){
osascript <<EOF
tell application "iTerm2"
    tell the current terminal
        tell the current session
            set the_name to get name
            tell i term application "System Events" to keystroke "d" using {command down, shift down}
        end tell

        tell the current session
            set name to the_name
        end tell
    end tell
end tell
EOF
}

e(){
osascript <<EOF
tell application "iTerm2"
  create window with default profile
end tell
EOF
}


f(){
    osascript <<EOF
    tell application "iTerm2"
        tell current window
            create tab with default profile
        end tell
    end tell
EOF
}


f

#osascript -e "tell application \"iTerm2\" to tell the current terminal"







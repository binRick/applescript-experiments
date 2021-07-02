#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ansi.sh
name="$1"
ALACRITTY_BINARY=/Applications/Alacritty.app/Contents/MacOS/alacritty
ALACRITTY_CONFIG=~/.alacritty-f29.yml
ALACRITTY_WINDOW_STARTUP_MODE=Windowed
X=0
Y=0
COLS=94
LINES=42

if [[ "$name" == "left" ]]; then
  ALACRITTY_FONT="Monaco"
  X=0
  Y=0
  COLS=94
  LINES=42
elif [[ "$name" == "right" ]]; then
  ALACRITTY_FONT="Menlo"
  X=1600
  Y=0
  COLS=107
  LINES=42
fi
ALACRITTY_FONT="Fira Code"


exec_name="alacritty-$name-dev"

if ! pgrep $exec_name >/dev/null 2>&1; then
  msg="$exec_name not running!"
  ansi --yellow --underline "$msg"
else
  pid="$(pgrep $exec_name|tr '\n' ' ')"
  msg="$exec_name running!    ::     $pid"
  ansi --green --underline "$msg"
  ./set_pid_focus.sh $pid
  exit
fi

tf="$(mktemp -d)/$exec_name"

rm_tf(){
 [[ -f $tf ]] && unlink $tf
 true
}
trap rm_tf EXIT

cp $ALACRITTY_BINARY $tf
chmod +x $tf


cmd="$tf --config-file $ALACRITTY_CONFIG -owindow.decorations=transparent -owindow.startup_mode=$ALACRITTY_WINDOW_STARTUP_MODE -ofont.normal.family=\"$ALACRITTY_FONT\" -owindow.position.x=$X -owindow.position.y=$Y -owindow.dimensions.columns=$COLS -owindow.dimensions.lines=$LINES"
echo -e "$cmd"
eval $cmd
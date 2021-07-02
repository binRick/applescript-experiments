#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ansi.sh

exec ./alacritty-dev.sh right

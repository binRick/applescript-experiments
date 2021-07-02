#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


get_system_fonts () {
	find /System/Library/Fonts ~/Library/Fonts /Library/Fonts -name "*.ttf" | sort -u | xargs -I % basename % | sort -u | sed 's/\.ttf$//g'
}
get_system_fonts 

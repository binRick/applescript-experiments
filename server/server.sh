#!/usr/bin/env bash
#INSTALL="1"
VENV=~/.venv-python3
MODULES="async psutil aiocache aiohttp aiohttp-jinja2 aiohttp_jinja2 aiodns"
cd $(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
command python3 --version >/dev/null 2>&1 || {
    echo python3 not found in path
    exit 1;
}

if [ ! -f $VENV/bin/activate ]; then
    if [ -e $VENV ]; then
        rm -rf $VENV
    fi
    python3 -m venv $VENV
fi

set -e
source $VENV/bin/activate
command which python
command which pip
python --version

if [ "$INSTALL" == "1" ]; then
    pip install pip --upgrade 2>/dev/null 
    pip install $MODULES --upgrade 2>/dev/null
    pip freeze
fi
clear
exec python3 _server.py 2>&1

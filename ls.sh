#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

./ls.osa|tr ',' '\n'|sed 's/^[[:space:]]//g'|sed 's/[[:space:]]$//g'|sort -u

#!/usr/bin/env bash
set -e

cat urls.txt|while IFS= read -r line; do
    echo "curl -X GET -H \"URL: $(echo $line|base64 -w0)\" http://localhost:40009/browser/open"
done
# | bash

#!/bin/bash

URL=$1
TITLE=$2
PARAMS=$@

ESC='\033'
OSC="${ESC}]"
OSC8="${OSC}8"
ST="${ESC}\\\\"

# printf '\033]8;;http://example.com\033\\This is a link\033]8;;\033\\\n'
# printf '"${OSC8};<PARAMS>;http://example.com\033\\This is a link${OSC8};;\033\\\n"'
printf "${OSC8};;${URL}${ST}${TITLE}${OSC8};;${ST}"
echo ""

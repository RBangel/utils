#!/bin/bash

# Enabled should be "true" or "false"
enabled=""

echoerr() {
  printf "%s\n" "$*" >&2;
}

help() {
  script=$(basename $0)
  echo "usage: $script (true | false)"

  if [[ "$1" != "" ]]; then
    echoerr "$1"
    exit -1
  fi

  exit 0
}

if [[ "$1" == "help" ]]; then
  help
elif [[ "$1" == "" ]]; then
  echo "Using default value of true"
  enabled="true"
elif [[ "$1" == "true" ]]; then
  enabled="true"
elif [[ "$1" == "false" ]]; then
  enabled="false"
else
  help "$1 is not an acceptable option"
fi

defaults write com.apple.finder CreateDesktop $enabled
killall Finder

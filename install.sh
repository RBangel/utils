#!/bin/bash

src_util="$1"

if [[ "$src_util" == "" ]]; then
  echo "You need to provide a util arg"
  exit -1
elif [[ ! -f "$src_util" ]]; then
  echo "$src_util doesn't exist"
  exit -1
elif [[ ! -x "$src_util" ]]; then
  echo "$src_util needs to be executable"
  exit -1
fi

dest_util=$(basename $src_util)

ln -s $(pwd)/$src_util ~/bin/$dest_util

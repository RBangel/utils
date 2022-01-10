#!/bin/bash

# Shamelessly stolen from
# https://unix.stackexchange.com/a/160129

# $1: start time
# $2: end time
# $3: log file to read
# $4: output file

# i.e. cat_slice.sh 18:33 19:40 /var/log/my.log /var/log/myslice.log

# if [[ $# != 4 ]] ; then 
# echo 'usage: log_slice.sh <start time> <end time> <log file> <output file>'
# echo
# exit;
# fi
# 
# if [ ! -f $3 ] ; then
# echo "'$3' doesn't seem to exit."
# echo 'exiting.'
# exit;
# fi
# 
# sline=$(grep -n " ${1}" $3|head -1|cut -d: -f1)  #what line number is first occurrance of start time
# eline=$(grep -n " ${2}" $3|head -1|cut -d: -f1)  #what line number is first occurrance of end time
# 
# linediff="$((eline-sline))"
# 
# tail -n+${sline} $3|head -n$linediff > $4

# tmp=${TMPDIR:-/tmp}/xx.$$    # Consider mktemp or something
# trap "rm -f $tmp.1; exit 1" 0 1 2 3 13 15  # Exit, HUP, INT, QUIT, PIPE, TERM
# 
# tee $tmp.1 |
# while read -a linA
# do
#     ...
# done
# 
# ...reprocess $tmp.1 here...
# 
# rm -f $tmp.1
# trap 0
# exit $exit_status

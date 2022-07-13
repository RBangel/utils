#!/bin/bash

account=$1
output_file=$(mktemp)
echo "Saving output to: $output_file"

continue=true
page=1
after=""

# set -x
while [[ "$continue" == "true" ]]; do
  echo "Pulling page $page"

  if [[ "$after" == "" ]]; then
    results=$(stripe transfers list --limit 100)
  else
    results=$(stripe transfers list --limit 100 --starting-after $(echo $after | sed 's/"//g'))
  fi

  # echo $results >> $output_file
  echo $results | jq ".data[] | select(.destination == \"$account\")" # >> $output_file
  echo "Last id: $(echo $results | jq '.data[-1].id')    Has more: $(echo $results | jq '.has_more')"

  if [[ $(echo $results | jq '.has_more') == 'true' ]]; then
    page=$((page + 1))
    after=$(echo $results | jq '.data[-1].id')
  else
    continue=false
  fi

  cat $output_file
done

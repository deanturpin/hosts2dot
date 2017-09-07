#!/bin/bash

[[ $# == 0 ]] && echo 'Usage: <list of hosts/IPs>' && exit  

echo "strict graph {"

for host in $@; do

  # Run tracepath for each host, skipping the first few uninteresting lines
  mapfile hops < <(tracepath -n $host | tail -n +3)

  ips=()

  for hop in "${hops[@]}"; do

    # Extract the IP
    [[ $hop =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]] && ips+=($BASH_REMATCH)
  done;

  # Print the connections
  echo -ne "\t\"soy-yo\""
  for ip in ${ips[@]}; do
    echo -n " -- \"$ip\""
  done
  echo " // $host"

done

echo "}"

#!/bin/bash

[[ $# == 0 ]] && echo 'Usage: <list of hosts/IPs>' && exit  

# Who am I?
readonly myip=$(hostname -I | cut -d' ' -f1)

cat <<!
strict graph {

  node [shape=rectangle style=filled fontname=helvetica]
  "soy yo" [label="$myip" fillcolor=green shape=oval fontcolor=white]

!

# Let's see if the hosts are responding
for host in $@; do

  ping -c 1 -w 1 $host >& /dev/null && color=green || color=red
  echo "  \"$host\" [fillcolor=$color shape=oval fontcolor=white]"
done

# Trace some routes and generate the dot links
for host in $@; do

  # Run tracepath for each host, skipping the first few uninteresting lines
  mapfile hops < <(traceroute -n $host | tail -n +2 | cut -d' ' -f4)

  # Clear down IP array
  ips=()

  # Extract the IPs
  for hop in "${hops[@]}"; do
    [[ $hop =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]] && ips+=($BASH_REMATCH)
  done;

  # Print the connections
  echo -ne "  \"soy yo\""
  for ip in ${ips[@]}; do
    echo -n "--\"$ip\""
  done
  echo "--\"$host\""
done

echo "}"

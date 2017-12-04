#!/bin/bash

[[ $# == 0 ]] && echo 'Usage: <list of hosts/IPs>' && exit

cat <<!
strict graph {

  node [shape=rectangle style=filled fontname=helvetica]
  "soy yo" [label="$(hostname) (soy yo)" fillcolor=orange shape=oval fontcolor=white]

!

# Let's see if the hosts are responding
for host in $@; do

  ping -c 1 -w 1 $host >& /dev/null && color=green || color=red
  echo "  \"$host\" [fillcolor=$color shape=oval fontcolor=white]"
done

# Trace some routes and generate the dot links
for host in $@; do

  # Clear down IP array
  ip_addresses=()

  # Match IPs in the traceroute output, the first two lines aren't interesting
  while read line; do
    [[ $line =~ ([^*\ ]+)\ +\(([0-9\.]+)\) ]] && ip_addresses+=(${BASH_REMATCH[1]})
  done < <(traceroute $host | tail -n +2)

  # Print the connections
  echo -ne "  \"soy yo\""
  for ip in ${ip_addresses[@]}; do
    echo -n "--\"$ip\""
  done
  echo "--\"$host\""
done

echo "}"

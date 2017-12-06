#!/bin/bash

[[ $# == 0 ]] && printf 'Usage: <list of hosts/IPs>\n' && exit

cat <<!
strict graph {

node [shape=rectangle style=filled fontname=helvetica]
soy_yo [label="$(hostname) (soy yo)" fillcolor=orange fontcolor=white]
!

# Let's see if the hosts are responding
printf "\n// hosts\n"
for host in $@; do

  ping -c 1 -w 1 $host >& /dev/null && color=green || color=red
  printf "\"$host\" [fillcolor=$color shape=oval fontcolor=white]\n"
done

# Trace some routes and generate the dot links
printf "\n// routes\n"
for host in $@; do

  # Clear down IP array
  ip_addr=()

  # Match IPs in the traceroute output, the first two lines aren't interesting
  while read line; do
    [[ $line =~ ([^*\ ]+)\ +\(([0-9\.]+)\) ]] && ip_addr+=(${BASH_REMATCH[1]})
  done < <(traceroute $host | tail -n +2)

  # Print the connections
  printf soy_yo--
  printf \"%s\"-- ${ip_addr[@]}
  printf \"$host\"\\n
done

printf "}\n"

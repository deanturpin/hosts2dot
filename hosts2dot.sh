#!/bin/bash

[[ $# == 0 ]] && echo 'Usage: <list of hosts/IPs>' && exit

cat <<!
strict graph {

fontname=helvetica
node [shape=rectangle style=filled fontname=helvetica]
soy_yo [label="$(hostname) (soy yo)" fillcolor=orange fontcolor=white]
graph [label="$0 - $(date)" labelloc=top labeljust=left]

!

# Let's see if the hosts are responding
echo // hosts
for host in $@; do
  ping -w 1 -c 1 $host >& /dev/null && color=green || color=red
  echo \"$host\" [fillcolor=$color shape=oval fontcolor=white]
done

# Trace some routes and generate the dot links
echo // routes
for host in $@; do

  # Print the start point (me)
  echo -n soy_yo--

  # Print the route
  tracepath $host | while read line; do
    [[ ! $line =~ 'no reply' ]] \
      && [[ $line =~ [[:digit:]]+:[[:space:]]+([[:graph:]]+) ]] \
        && echo -n \"${BASH_REMATCH[1]}\"--
  done

  # Print the end point
  echo \"$host\"

done

echo }

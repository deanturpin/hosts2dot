#!/bin/bash

[[ $# == 0 ]] && echo 'Usage: <list of hosts/IPs>' && exit

readonly hosts=$@

# Print the beginning of the dot file
cat <<!
strict graph {
fontname=helvetica
node [shape=rect style="filled,rounded" color=white fillcolor=lightgrey fontname=helvetica]
soy_yo [label="$(hostname) (soy yo)"]
graph [label="$0 - $(date)" labelloc=top labeljust=left]
!

# Trace some routes and generate the dot links
for host in $hosts; do

  # Is the host responding?
  ping -w 1 -c 1 $host >& /dev/null && color=green || color=red
  echo \"$host\" [fillcolor=$color fontcolor=white]

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

# Complete the dot file
echo }

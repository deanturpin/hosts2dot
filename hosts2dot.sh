#!/bin/bash

# Print the beginning of the dot file
cat <<!
strict graph {
fontname=helvetica
node [shape=rect style="filled,rounded" color=white fillcolor=lightgrey fontname=helvetica]
soy_yo [label="$(hostname)"]
graph [label="$0 - $(date)" labelloc=top labeljust=left]
!

# Parse each line of the hosts file passed on stdin
while read line; do

  # Extract the first host or IP on the line
  host=${line/\ *}

  # Surround the complete line with quotes so it prints nicely
  line=\"$line\"

  # Is the host responding?
  ping -w 1 -c 1 $host >& /dev/null && color=green || color=red
  echo $line [fillcolor=$color fontcolor=white]

  # Print the origin of the trace
  echo -n soy_yo--

  # Print the route
  tracepath $host | while read hop; do
    [[ ! $hop =~ 'no reply' ]] \
      && [[ $hop =~ [[:digit:]]+:[[:space:]]+([[:graph:]]+) ]] \
        && echo -n \"${BASH_REMATCH[1]}\"--
  done

  # Print the end point
  echo $line
done

# Complete the dot file
echo }

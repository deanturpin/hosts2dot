#!/bin/bash

# Print the beginning of the dot file
cat <<!
strict graph {
fontname=helvetica
node [shape=rect style="filled,rounded" color=white fillcolor=lightgrey fontname=helvetica]
soy_yo [label=$(hostname)]
graph [label="$0 - $(date)" labelloc=top labeljust=left]
!

# Trace some routes and generate the dot links
while read line; do

  host=${line/\ *}
  comment=${line/*\#}
  full_name=\"$line\"

  # Is the host responding?
  ping -w 1 -c 1 $host >& /dev/null && color=green || color=red
  echo $full_name [fillcolor=$color fontcolor=white]

  # Print the start point (me)
  echo // $line
  echo -n soy_yo--

  # Print the route
  tracepath $host | while read line; do
    [[ ! $line =~ 'no reply' ]] \
      && [[ $line =~ [[:digit:]]+:[[:space:]]+([[:graph:]]+) ]] \
        && echo -n \"${BASH_REMATCH[1]}\"--
  done

  # Print the end point
  echo $full_name
done

# Complete the dot file
echo }

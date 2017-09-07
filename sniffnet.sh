#!/bin/bash

echo sniffnet

hosts=(github.com 10.226.0.1)

for host in ${hosts[@]}; do

  echo -e "\ntracepath $host"

  # Run tracepath for each host, skipping the first few uninteresting lines
  mapfile hops < <(tracepath -n -m 8 $host | tail -n +3)

  ips=("me")

  for hop in "${hops[@]}"; do
    # echo -ne "\t$hop"

    # Extract the IP
    [[ $hop =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]] && echo $BASH_REMATCH
  done;
done

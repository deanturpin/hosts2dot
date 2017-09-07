#!/bin/bash

echo sniffnet

hosts=(github.com 10.226.0.1)

for host in ${hosts[@]}; do

  echo -e "\ntracepath $host"

  mapfile hops < <(tracepath -n -m 3 $host)

  ips=("me")

  for hop in "${hops[@]}"; do
    # echo -ne "\t$hop"

    # Extract the IP
    [[ $hop =~ [0-9]{1,3}\.[0-9]{1,3} ]] && echo $BASH_REMATCH
  done;
done

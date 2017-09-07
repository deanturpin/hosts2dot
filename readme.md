For each host supplied (see [makefile](makefile)) the script runs
```traceroute```, extracts the IP for each hop and constructs a dot file. The
dot renderer is then run to create the SVG.

This example is generated on my laptop using my iPhone as a tether.

![](example.svg)

Build
```bash
$ make clean
$ make
./twitcher.sh google.com github.com twitter.com facebook.com 4.4.4.4 4.4.8.8 | tee example.dot
strict graph {

  node [shape=rectangle style=filled]
  "soy yo" [fillcolor=green shape=oval fontcolor=white]

  "soy yo"--"172.20.10.1"--"10.248.28.145"--"10.247.84.25"--"10.247.84.6"--"10.247.84.9"--"10.247.84.18"--"87.237.20.224"--"87.237.20.73"--"google.com"
  "google.com" [fillcolor=orange shape=oval fontcolor=white]
  "soy yo"--"172.20.10.1"--"10.248.28.153"--"10.247.84.27"--"10.247.84.6"--"10.247.84.9"--"10.247.84.18"--"87.237.20.224"--"87.237.20.73"--"github.com"
  "github.com" [fillcolor=orange shape=oval fontcolor=white]
  "soy yo"--"172.20.10.1"--"10.248.28.145"--"10.247.84.25"--"10.247.84.6"--"10.247.84.9"--"10.247.84.18"--"87.237.20.224"--"87.237.20.73"--"twitter.com"
  "twitter.com" [fillcolor=orange shape=oval fontcolor=white]
  "soy yo"--"172.20.10.1"--"10.248.28.153"--"10.247.84.27"--"10.247.84.6"--"10.247.84.9"--"10.247.84.18"--"87.237.20.224"--"87.237.20.73"--"facebook.com"
  "facebook.com" [fillcolor=orange shape=oval fontcolor=white]
  "soy yo"--"172.20.10.1"--"10.248.28.145"--"10.247.84.25"--"10.247.84.6"--"10.247.84.9"--"10.247.84.18"--"87.237.20.224"--"87.237.20.73"--"4.4.4.4"
  "4.4.4.4" [fillcolor=orange shape=oval fontcolor=white]
  "soy yo"--"172.20.10.1"--"10.248.28.145"--"10.247.84.25"--"10.247.84.6"--"10.247.84.9"--"10.247.84.18"--"87.237.20.224"--"87.237.20.73"--"4.4.8.8"
  "4.4.8.8" [fillcolor=orange shape=oval fontcolor=white]
}
dot -T svg example.dot > example.svg
```

View the SVG in a web browser
```bash

$ firefox example.svg
```

For each host supplied (see [makefile](makefile)) the script runs
```traceroute```, extracts the IP for each hop and constructs a dot file. The
dot renderer is then run to create the SVG.

This example was generated on a Linux laptop using a public access point.

![](example.svg)

Build
```bash
$ make clean
$ make
./twitcher.sh google.com github.com twitter.com facebook.com 4.4.4.4 4.4.8.8 | tee example.dot
strict graph {

  node [shape=rectangle style=filled]
  "soy yo" [fillcolor=green shape=oval fontcolor=white]

	"soy yo"--"10.101.0.1"--"10.248.96.1"--"172.29.32.3"--"176.12.107.130"--"109.74.255.251"--"5.57.80.136"--"108.170.246.225"--"72.14.234.133"--"216.58.201.46"--"google.com"
	"google.com" [fillcolor=orange shape=oval fontcolor=white]
	"soy yo"--"10.101.0.1"--"10.248.96.1"--"172.29.32.3"--"176.12.107.130"--"109.74.255.242"--"109.74.255.81"--"4.15.136.22"--"github.com"
	"github.com" [fillcolor=orange shape=oval fontcolor=white]
	"soy yo"--"10.101.0.1"--"10.248.96.1"--"172.29.32.3"--"176.12.107.130"--"109.74.255.251"--"104.244.42.1"--"twitter.com"
	"twitter.com" [fillcolor=orange shape=oval fontcolor=white]
	"soy yo"--"10.101.0.1"--"10.248.96.1"--"172.29.32.3"--"176.12.107.130"--"109.74.255.251"--"195.66.225.121"--"157.240.34.219"--"173.252.67.75"--"facebook.com"
	"facebook.com" [fillcolor=orange shape=oval fontcolor=white]
	"soy yo"--"10.101.0.1"--"10.248.96.1"--"172.29.32.3"--"176.12.107.130"--"109.74.255.242"--"4.4.4.4"
	"4.4.4.4" [fillcolor=orange shape=oval fontcolor=white]
	"soy yo"--"10.101.0.1"--"10.248.96.1"--"172.29.32.3"--"176.12.107.130"--"109.74.255.242"--"4.4.8.8"
	"4.4.8.8" [fillcolor=orange shape=oval fontcolor=white]
}
dot -T svg example.dot > example.svg
```

View the SVG in a web browser
```bash

$ firefox example.svg
```

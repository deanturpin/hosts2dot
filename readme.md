For each host supplied (see [makefile](makefile)) the script runs
```traceroute```, extracts the IP for each hop and constructs a dot file. The
dot renderer is then run to create the SVG.

This example was generated on a Linux laptop using a public access point.

![](example.svg)

Build
```bash
$ make clean
$ make
./twitcher.sh github.com silobrighton.com instagram.com monzo.com infinityfoods.coop roli.com 4.4.4.4 | tee $@
strict graph {

  node [shape=rectangle style=filled fontname=helvetica]
  "soy yo" [fillcolor=green shape=oval fontcolor=white]

  "github.com" [fillcolor=green shape=oval fontcolor=white]
  "silobrighton.com" [fillcolor=red shape=oval fontcolor=white]
  "instagram.com" [fillcolor=green shape=oval fontcolor=white]
  "monzo.com" [fillcolor=green shape=oval fontcolor=white]
  "infinityfoods.coop" [fillcolor=green shape=oval fontcolor=white]
  "roli.com" [fillcolor=red shape=oval fontcolor=white]
  "4.4.4.4" [fillcolor=red shape=oval fontcolor=white]
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"4.53.116.102"--"192.30.253.113"--"github.com"
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"5.57.80.32"--"37.209.223.9"--"37.209.223.45"--"silobrighton.com"
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"4.79.22.74"--"54.239.110.195"--"instagram.com"
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"2.127.241.137"--"104.25.212.99"--"monzo.com"
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"5.57.80.240"--"80.88.212.56"--"80.88.202.138"--"37.200.112.58"--"213.129.95.153"--"37.200.112.61"--"infinityfoods.coop"
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"83.231.221.45"--"129.250.4.23"--"129.250.2.18"--"129.250.4.13"--"129.250.2.8"--"129.250.5.86"--"roli.com"
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"4.4.4.4"
}
dot -T svg example.dot > example.svg
```

View the SVG in a web browser
```bash

$ firefox example.svg
```

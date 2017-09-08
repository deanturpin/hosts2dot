For each host supplied (see [makefile](makefile)) the script runs
```traceroute```, extracts the IP for each hop and constructs a dot file. The
dot renderer is then run by ```make``` to create the SVG.

You can run it on the command line by passing a list of hosts. But I just run
it as a Jenkins nightly.

```bash
./twitcher.sh github.com silobrighton.com
```

![](example.svg)

Build
```bash
$ make clean
$ make
strict graph {

  node [shape=rectangle style=filled fontname=helvetica]
  "soy yo" [fillcolor=green shape=oval fontcolor=white]

  "google.com" [fillcolor=green shape=oval fontcolor=white]
  "deanturpin.github.io" [fillcolor=green shape=oval fontcolor=white]
  "github.com" [fillcolor=green shape=oval fontcolor=white]
  "silobrighton.com" [fillcolor=red shape=oval fontcolor=white]
  "instagram.com" [fillcolor=green shape=oval fontcolor=white]
  "monzo.com" [fillcolor=green shape=oval fontcolor=white]
  "infinityfoods.coop" [fillcolor=green shape=oval fontcolor=white]
  "roli.com" [fillcolor=red shape=oval fontcolor=white]
  "4.4.4.4" [fillcolor=red shape=oval fontcolor=white]
  "instragram.com" [fillcolor=red shape=oval fontcolor=white]
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"72.14.203.194"--"64.233.175.152"--"108.170.246.176"--"google.com"
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"deanturpin.github.io"
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"4.15.136.22"--"192.30.253.113"--"github.com"
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"5.57.80.32"--"37.209.223.9"--"37.209.223.57"--"37.209.223.45"--"silobrighton.com"
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"4.28.125.110"--"54.239.110.221"--"instagram.com"
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"2.127.241.137"--"104.25.211.99"--"monzo.com"
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"5.57.80.240"--"80.88.212.56"--"80.88.202.138"--"37.200.112.58"--"213.129.95.153"--"37.200.112.61"--"infinityfoods.coop"
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"83.231.221.45"--"129.250.4.23"--"129.250.2.18"--"129.250.4.13"--"129.250.2.8"--"129.250.5.86"--"roli.com"
  "soy yo"--"192.168.0.1"--"84.38.37.34"--"4.4.4.4"
  "soy yo"--"192.168.0.1"--"84.38.37.36"--"89.200.131.151"--"10.246.104.21"--"2.120.8.74"--"83.231.221.45"--"instragram.com"
}
dot -T svg example.dot > example.svg
```

View the SVG in a web browser
```bash

$ firefox example.svg
```

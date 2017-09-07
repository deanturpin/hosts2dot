For each host supplied (see [makefile](makefile)) the script runs
```traceroute```, extracts the IP for each hop and constructs a dot file. The
dot renderer is then run to create an SVG.

The example is generating on my laptop using my iPhone as a tether.

```bash
$ make clean
$ make
./sniffnet.sh google.com github.com | tee example.dot
strict graph {
          "soy-yo" -- "172.20.10.1" -- "10.248.28.145" -- "10.247.84.6" -- "10.247.84.9" -- "87.237.20.224" -- "87.237.20.73" -- "87.237.20.36" // google.com
                  "soy-yo" -- "172.20.10.1" -- "10.248.28.145" -- "10.247.84.6" -- "10.247.84.9" -- "87.237.20.224" -- "87.237.20.73" -- "87.237.20.36" -- "80.150.171.93" -- "80.150.170.106" -- "129.250.4.23" -- "129.250.2.18" -- "129.250.3.207" -- "129.250.2.149" -- "129.250.2.20" -- "129.250.5.182" -- "129.250.5.182" // github.com
}
dot -T svg example.dot > example.svg

$ firefox example.svg
```

![](example.svg)

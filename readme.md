The script takes a hosts file on stdin and generates a dot format
network topology of all the IPs encountered on the way. The dot renderer is then
run by ```make``` to create the SVG.
```bash
$ make clean
$ make
```

View the SVG in a web browser
```bash
$ firefox topology.svg
```

![](topology.svg)

Test it with a single host using the triple chevron syntax.
```bash
$ ./hosts2dot.sh <<< github.com
```

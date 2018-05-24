[![Build
Status](https://travis-ci.org/deanturpin/hosts2dot.svg?branch=master)](https://travis-ci.org/deanturpin/hosts2dot)

Pure bash script that takes a hosts file on stdin and generates a dot format
network topology of all the IPs encountered on the way. Edit ```hosts``` and
then run ```make``` to generate an SVG of key nodes in your netork.

View the SVG in a web browser.
```bash
$ firefox topology.svg
```

See the [full resolution file](topology.svg).

![](topology.svg)

Test the script with a single host using the triple chevron syntax.
```bash
$ ./hosts2dot.sh <<< github.com
```

# Hosts file format
The script accepts a standard system hosts file format but actually the script
actually only cares about the first host or IP on a line, the whole line is used
to name the leaf node. In fact, any file format may be used as long as each line
begins with something that can be pinged.

```bash
127.0.0.1 localhost # for local people
216.58.213.99 - google
silobrighton.com # Zero waste
```

At work I run it as a Jenkins nightly and the hosts file is a list of things I'm
interested in on the company Intranet.

# Dependencies
dot
```
sudo apt install graphviz
```

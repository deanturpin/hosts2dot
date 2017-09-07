all: example.svg

example.dot:
	./sniffnet.sh google.com github.com | tee $@

%.svg:%.dot
	dot -T svg $< > $@

all: example.svg

example.dot: hosts.txt
	./hosts2dot.sh `cat hosts.txt` | tee $@

%.svg: %.dot
	dot -T svg $< > $@

clean:
	rm -f example.dot example.svg

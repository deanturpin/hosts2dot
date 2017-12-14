all: example.svg

example.dot: hosts
	./hosts2dot.sh < hosts | tee $@

%.svg: %.dot
	dot -T svg $< > $@

clean:
	rm -f example.dot example.svg

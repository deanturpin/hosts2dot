all: topology.svg

topology.dot: hosts
	./hosts2dot.sh < hosts | tee $@

%.svg: %.dot
	dot -T svg $< > $@

clean:
	rm -f topology.dot topology.svg

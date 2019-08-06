all: topology.svg

.PHONY: topology.dot
topology.dot:
	./hosts2dot.sh < hosts | tee $@

%.svg: %.dot
	dot -T svg $< > $@

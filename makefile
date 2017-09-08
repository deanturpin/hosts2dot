all: example.svg

example.dot: hosts.txt
	./hosts2dot.sh `cat hosts.txt` | tee $@

%.svg:%.dot
	dot -T svg $< > $@

clean:
	rm -f example.dot example.svg

wait:
	while :; do inotifywait -qe modify hosts2dot.sh; ./hosts2dot.sh facebook.com 1.2.3.4; done

all: example.svg

example.dot: hosts.txt
	./twitcher.sh `cat hosts.txt` | tee $@

%.svg:%.dot
	dot -T svg $< > $@

clean:
	rm -f example.dot example.svg

wait:
	while :; do inotifywait -qe modify twitcher.sh; ./twitcher.sh facebook.com 1.2.3.4; done

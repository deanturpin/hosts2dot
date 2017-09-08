all: example.svg

example.dot:
	./twitcher.sh google.com github.com twitter.com facebook.com 4.4.4.4 4.4.8.8 1.2.3.4 | tee $@

%.svg:%.dot
	dot -T svg $< > $@

clean:
	rm -f example.dot example.svg

wait:
	while :; do inotifywait -qe modify twitcher.sh; ./twitcher.sh facebook.com 1.2.3.4; done

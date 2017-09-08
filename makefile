all: example.svg

example.dot:
	./twitcher.sh github.com silobrighton.com instagram.com monzo.com infinityfoods.coop roli.com 4.4.4.4 | tee $@

%.svg:%.dot
	dot -T svg $< > $@

clean:
	rm -f example.dot example.svg

wait:
	while :; do inotifywait -qe modify twitcher.sh; ./twitcher.sh facebook.com 1.2.3.4; done

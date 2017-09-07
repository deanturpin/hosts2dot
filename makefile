all: example.svg

example.dot:
	./twitcher.sh google.com github.com twitter.com facebook.com 4.4.4.4 4.4.8.8 | tee $@

%.svg:%.dot
	dot -T svg $< > $@

clean:
	rm -f example.dot example.svg

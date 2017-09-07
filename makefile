all: example.svg

example.dot:
	./twitcher.sh google.com github.com | tee $@

%.svg:%.dot
	circo -T svg $< > $@

clean:
	rm -f example.dot example.svg

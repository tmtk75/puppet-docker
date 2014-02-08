TARGET: install

install: ./modules/vagrant

./bin/librarian-puppet:
	bundle install --binstubs --path .bundle/vendor

./modules/vagrant: ./bin/librarian-puppet
	./bin/librarian-puppet install

update:
	./bin/librarian-puppet update

clean:
	rm -rf .bundle bin modules *.lock


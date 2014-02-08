TARGET: install

up: ./boot2docker.vmdk virtualbox
	./bin/boot2docker up

stop: ./boot2docker.vmdk
	./bin/boot2docker stop

install: ./boot2docker.vmdk

./boot2docker.vmdk: ./bin/boot2docker ./bin/docker
	./bin/boot2docker init

./bin/boot2docker: ./bin/librarian-puppet
	curl -s https://raw.github.com/steeve/boot2docker/master/boot2docker > ./bin/boot2docker
	chmod +x ./bin/boot2docker

./bin/docker:
	curl -o ./bin/docker http://get.docker.io/builds/Darwin/x86_64/docker-latest
	chmod +x ./bin/docker

virtualbox: ./bin/puppet ./modules/virtualbox
	sudo -E ./bin/puppet apply -e 'include virtualbox' --modulepath modules

./bin/librarian-puppet:
	bundle install --binstubs --path .bundle/vendor

./modules/virtualbox: ./bin/librarian-puppet
	./bin/librarian-puppet install

update:
	./bin/librarian-puppet update

clean:
	rm -rf .librarian .tmp .bundle bin modules *.lock


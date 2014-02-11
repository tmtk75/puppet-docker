TARGET: install

up: ./boot2docker.vmdk
	/usr/local/bin/boot2docker up

stop: ./boot2docker.vmdk
	/usr/local/bin/boot2docker stop

install: ./boot2docker.vmdk

./boot2docker.vmdk: /usr/local/bin/boot2docker /usr/local/bin/docker
	/usr/local/bin/boot2docker init

/usr/local/bin/boot2docker:
	brew install boot2docker

/usr/local/bin/docker:
	brew install docker

virtualbox: /usr/bin/VBoxManage

/usr/bin/VBoxManage: ./bin/librarian-puppet ./modules/virtualbox
	sudo -E ./bin/puppet apply -e 'include virtualbox' --modulepath modules

./bin/librarian-puppet:
	bundle install --binstubs --path .bundle/vendor

./modules/virtualbox: ./bin/librarian-puppet
	./bin/librarian-puppet install

clean:
	rm -rf .librarian .tmp .bundle bin modules *.lock


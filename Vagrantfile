# -*- mode: ruby -*-
Vagrant.configure("2") do |config|

  config.vm.box     = "centos65-x86_64-20140204-r10k-1.1.3"
  config.vm.box_url = "https://github.com/tmtk75/Vagrantfiles/releases/download/20140204-r10k/centos65-x86_64-20140204-r10k-1.1.3.box"

  config.vm.network :private_network, ip:"192.168.50.4"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :puppet do |puppet|
    #puppet.options     = "--verbose --debug"
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "default.pp"
    puppet.module_path    = "modules"
  end

end


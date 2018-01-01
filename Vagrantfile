# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "reahl/xenial64"

  config.vm.network "forwarded_port", guest: 5433, host: 5433

  config.vm.provision "shell", inline: <<-SHELL
   export DEBIAN_FRONTEND=noninteractive
   apt-get update
   apt-get install -y gdb
   apt-get install -y libpam0g-dev
   /vagrant/vagrant/installGemStone.sh
  SHELL

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
   cd /vagrant
   /vagrant/vagrant/setupGit.sh
   /vagrant/vagrant/defineGemStoneEnvironment.sh
  SHELL
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :ubuntu do |ubuntu|
    ubuntu.vm.box           = "trusty64"
    ubuntu.vm.box_url       = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"

    ubuntu.vm.provision "shell", inline: <<-EOS
      apt-get install -y ruby1.9.1-dev git
      gem install librarian-puppet --no-ri --no-rdoc
      cd armada/puppet && librarian-puppet install --verbose
    EOS

    ubuntu.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file  = "armada.pp"
      puppet.module_path    = "puppet/modules"
      puppet.options        = ["--verbose"]
    end

    config.vm.network "forwarded_port", guest: 2375, host: 40001
  end

  config.vm.synced_folder ".", "/home/vagrant/armada"

end

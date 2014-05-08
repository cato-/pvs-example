# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian7"

  # Port forwarding for Apache webserver.
  config.vm.network "forwarded_port", guest: 80, host: 8000,
    auto_correct: true

  # Salt provisioning.
  config.vm.synced_folder "salt/roots/", "/srv/"
  config.vm.provision :salt do |salt|
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
  end
end

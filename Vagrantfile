# -*- mode: ruby -*-
# vi: set ft=ruby :
# 

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.100.100"
  config.vm.hostname = "lampbox"
  config.vm.synced_folder "./httpdocs", "/var/www/vhosts/lampbox/httpdocs"

  config.berkshelf.enabled = true
  config.vm.provision "chef_solo" do |chef|
    chef.run_list = [
      'recipe[lampbox]',
      'recipe[lampbox::adminer]'
    ]
    chef.json = {
      :lampbox => {
        :document_root => '/var/www/vhosts/lampbox/httpdocs'
      }
    }
  end
end

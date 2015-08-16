# -*- mode: ruby -*-
# vi: set ft=ruby :

NUM_CLIENTS = 1
BOX = 'opscode-centos-6.6'

VAGRANTFILE_API_VERSION = '2'
Vagrant.require_version '>= 1.5.0'

Vagrant.configure(2) do |config|

  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = 'latest'
  end

  if Vagrant.has_plugin?("berkshelf")
    config.berkshelf.enabled = true
  end

  config.vm.box = "opscode-"

  config.vm.define "pulp-server" do |pulp|
    pulp.vm.box = BOX

    pulp.vm.host_name = "pulp-server"

    config.vm.provision :chef_solo do |chef|
      chef.json = {
      }

      chef.run_list = [
          'recipe[pulp::server]'
      ]
    end

  end


end

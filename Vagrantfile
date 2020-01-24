# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/bionic64"

  #provisioning with chef
  config.vm.provision "chef_solo" do |chef|
    #add recipe
    chef.cookbooks_path = 'cookbooks'
    chef.add_recipe "dev_env"

    #accepting licences
    chef.arguments = "--chef-license accept"
  end

  config.vm.synced_folder "./code", "/home/ubuntu/code/"

end

#
# Cookbook:: dev_env_cookbook
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'dev_env_cookbook::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'should run apt-get update' do
      expect(chef_run).to update_apt_update 'update_sources'
    end

    it 'should install python' do
      expect(chef_run).to install_package 'python3.8'
    end

    it 'should install pip' do
      expect(chef_run).to install_package 'python3-pip'
    end

    it 'should install bs4 using pip installer' do
      expect(chef_run).to run_execute('install bs4')
    end

    it 'should install requests using pip installer' do
      expect(chef_run).to run_execute('install requests')
    end

    it 'should install pytest using pip installer' do
      expect(chef_run).to run_execute('install pytest')
    end

    it 'should install configmanager using pip installer' do
      expect(chef_run).to run_execute('install configmanager')
    end

    it 'should install yum ' do
      expect(chef_run).to install_package 'yum-utils'
    end

    it 'should install java ' do
      expect(chef_run).to install_package 'java'
    end


  end


end

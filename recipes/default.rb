#
# Cookbook:: dev_env_cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
execute 'yum' do
  command 'sudo apt-get install -y yum-utils'
  action :run
end

package 'yum-utils' do
  action :install
end

execute 'java' do
  command 'sudo apt install default-jre -y'
  action :run
end

package 'java' do
  action :install
end

apt_update 'update_sources' do
  action :update
end


execute 'install python' do
  command 'sudo apt-get install python3.8 -y'
  action :run
end

execute 'upgrade packages' do
  command 'sudo apt -y upgrade'
  action :run
end

execute 'python3-pip' do
  command 'sudo apt install python3-pip -y'
  action :run
end

package 'python3.8' do
  action :install
end

package 'python3-pip' do
  options '--allow-unauthenticated'
  action :install
end

execute 'install bs4' do
  command 'pip3 install bs4'
  action :run
end

execute 'install requests' do
  command 'pip3 install requests'
  action :run
end

execute 'install pytest' do
  command 'pip3 install pytest'
  action :run
end

execute 'install configmanager' do
  command 'pip3 install configmanager'
  action :run
end

file '/home/ubuntu/code/src/__init__.py' do
  action :create
end

file '/home/ubuntu/code/src/csv_generators/__init__.py' do
  action :create
end

file '/home/ubuntu/code/src/itjobswatch_html_readers/__init__.py' do
  action :create
end

# Ensures pytest has write permission to path of Downloads folder

directory '/' do
  action :create
  mode '0777'
end

directory '/vagrant/' do
  action :create
  mode '0777'
end

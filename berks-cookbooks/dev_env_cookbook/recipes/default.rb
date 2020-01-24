#
# Cookbook:: dev_env_cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

apt_update 'update_sources' do
  action :update
end


execute 'install python' do
  command 'sudo -H apt-get install python3.8 -y'
  action :run
end

execute 'upgrade packages' do
  command 'sudo -H apt -y upgrade'
  action :run
end

execute 'python3-pip' do
  command 'sudo -H apt install python3-pip -y'
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
  command 'sudo -H pip3 install bs4'
  action :run
end

execute 'install requests' do
  command 'sudo -H pip3 install requests'
  action :run
end

execute 'install pytest' do
  command 'sudo -H pip3 install pytest'
  action :run
end

execute 'install configmanager' do
  command 'sudo -H pip3 install configmanager'
  action :run
end

directory '/home/ubuntu/code/' do
  action :create
  mode '0777'
end

template '/home/ubuntu/code/requirements.txt' do
  source 'requirements.txt.erb'
  owner 'root'
  group 'root'
  mode '0777'
end

execute 'install requirements' do
  command 'sudo -H pip3 install -r /home/ubuntu/code/requirements.txt'
  action :run
end

file '/home/ubuntu/code/requirements.txt' do
  action :delete
end

directory '/home/ubuntu/code/' do
  action :delete
end

# file '/home/ubuntu/code/src/__init__.py' do
#   action :create
# end
#
# file '/home/ubuntu/code/src/csv_generators/__init__.py' do
#   action :create
# end
#
# file '/home/ubuntu/code/src/itjobswatch_html_readers/__init__.py' do
#   action :create
# end
#
# # Ensures pytest has write permission to path of Downloads folder
#
# directory '/' do
#   action :create
#   mode '0777'
# end
#
# directory '/vagrant/' do
#   action :create
#   mode '0777'
# end

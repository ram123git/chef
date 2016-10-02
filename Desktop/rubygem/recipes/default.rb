#
# Cookbook Name:: rubygem
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
=begin
bash 'extract_module' do
    code <<-EOH
    wget https://rubygems.org/rubygems/rubygems-2.6.6.tgz
    cd rubygems-2.6.6/
    ruby setup.rb config
    ruby setup.rb setup
    ruby setup.rb install
    EOH
end

#bash 'extract_module' do
#    code <<-EOH
#    gem install rails -v 4.2.0
#    sudo yum -y install epel-release
#    sudo yum install nodejs
#    sudo yum install mariadb-server mariadb-devel
#    EOH
#end
=end

gem_package 'bundler' do
   action :purge
end

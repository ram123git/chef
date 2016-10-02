#
# Cookbook Name:: nginxpassenger
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{ epel-release yum-utils }.each do |pkg|
  package pkg
end
execute "yum-config-manager --enable epel"

%w{ pygpgme curl }.each do |pkg|
  package pkg
end

bash 'passenger_install' do
        code <<-EOF
    sudo curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo
    sudo yum install -y nginx passenger
  EOF
 end

service 'nginx' do
  action [:enable, :start]
end

template "/usr/share/nginx/html/index.html" do
  source "index.html.erb"
end

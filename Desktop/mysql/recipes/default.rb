#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "mysql-server" 

service 'mysqld' do
  action [:enable, :start]
end


#template "/etc/my.cnf" do
#  source "my.cnf.erb"
#  mode  644
#/bin/bash: indent: command not found

=begin

bash 'change_pass' do
    code <<-EOH
    mysql -u root -p 
    SET PASSWORD FOR 'root'@'localhost' = PASSWORD('');     
  EOH
end
=end

template "/home/ram/change.sh" do
  source "change.sh.erb"
  mode  777
end

#execute "./home/vagrant/change.sh"
=begin
bash 'change_pass' do
    code <<-EOH
    cd /home/vagrant/
    ./change.sh
  EOH
end

=end

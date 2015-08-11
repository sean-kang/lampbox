# Cookbook Name:: lampbox
# Recipe:: default

include_recipe 'lampbox::php'
include_recipe 'apache2'
include_recipe 'apache2::mod_ssl'
include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_deflate'
include_recipe 'apache2::mod_fcgid'
include_recipe 'mysql::server'
include_recipe 'mysql2_chef_gem'

document_root = node['lampbox']['document_root']

mysql_connection_info = {
  :host     => 'localhost',
  :username => 'root',
  :password => node.default['mysql']['server_root_password']
}

mysql_database 'lampbox' do
  connection mysql_connection_info
  action :create
end

mysql_database_user 'lampbox' do
  connection mysql_connection_info
  password 'lampbox'
  action :create
end

mysql_database_user 'lampbox' do
  connection mysql_connection_info
  database_name 'lampbox'
  privileges [:all]
  action :grant
end

package 'apache2-suexec'

["/var/www/vhosts/lampbox/cgi-bin", "#{document_root}"].each do |path|
  directory path do
    owner 'vagrant'
    group 'vagrant'
    mode  '0755'
    recursive true
    action :create
  end
end

template '/etc/apache2/sites-available/lampbox.conf' do
  source case node['platform']
    when 'ubuntu'
      'lampbox-ubuntu.conf.erb'
  end
  variables({
    :document_root => document_root
  })
  action :create
  notifies :restart, 'service[apache2]', :delayed
end

cookbook_file '/var/www/vhosts/lampbox/cgi-bin/fcgid-wrapper' do
  source 'fcgid-wrapper'
  mode  0755
  owner 'vagrant'
  group 'vagrant'
  action :create
  notifies :restart, 'service[apache2]', :delayed
end

apache_module 'suexec' do
  enable true
end

apache_site 'lampbox' do
  enable true
end

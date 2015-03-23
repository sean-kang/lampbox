# Cookbook Name:: lampbox
# Recipe:: default

include_recipe 'apache2'
include_recipe 'apache2::mod_ssl'
include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_deflate'
include_recipe 'apache2::mod_fcgid'
include_recipe 'php'
include_recipe 'mysql::server'
include_recipe 'mysql2_chef_gem'

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

%w[apache2-suexec php5-mysql].each do |p|
  package p
end

%w[/var/www/vhosts/lampbox/cgi-bin /var/www/vhosts/lampbox/httpdocs].each do |path|
  directory path do
    owner 'vagrant'
    group 'vagrant'
    mode  '0755'
    recursive true
    action :create
  end
end

cookbook_file '/etc/apache2/sites-available/lampbox.conf' do
  source case node['platform']
    when 'ubuntu'
      'lampbox-ubuntu.conf'
  end
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

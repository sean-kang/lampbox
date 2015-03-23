# Cookbook Name:: lampbox
# Recipe:: adminer

remote_file '/var/www/vhosts/lampbox/httpdocs/adminer.php' do
  source node.default['lampbox']['adminer_source']
  mode  0644
  owner 'vagrant'
  group 'vagrant'
  action :create
end

remote_file '/var/www/vhosts/lampbox/httpdocs/adminer.css' do
  source node.default['lampbox']['adminer_css_source']
  mode  0644
  owner 'vagrant'
  group 'vagrant'
  action :create
end

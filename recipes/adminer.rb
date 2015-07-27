# Cookbook Name:: lampbox
# Recipe:: adminer

directory node['lampbox']['adminer_folder'] do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
end

remote_file "#{node['lampbox']['adminer_folder']}/adminer.php" do
  source node.default['lampbox']['adminer_source']
  mode  0644
  owner 'vagrant'
  group 'vagrant'
  action :create
end

remote_file "#{node['lampbox']['adminer_folder']}/adminer.css" do
  source node.default['lampbox']['adminer_css_source']
  mode  0644
  owner 'vagrant'
  group 'vagrant'
  action :create
end

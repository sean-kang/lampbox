# Cookbook Name:: lampbox
# Recipe:: php

include_recipe 'php'

%w[php5-mysql php5-curl php5-mcrypt php5-gd].each do |p|
  package p
  execute "enable #{p}" do
    command "php5enmod #{p}"
    only_if "which php5enmod"
  end
end

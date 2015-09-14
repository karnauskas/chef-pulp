#
# Cookbook Name:: pulp
# Recipe:: server
#
# Copyright 2014-2015, Marius Karnauskas
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Pulp service which will provide repositories, etc.
#

%w(
  pulp-server
  pulp-rpm-plugins
  pulp-rpm-yumplugins 
  python-qpid-qmf
  python-gofer-qpid
  ).each do |pkg|
  package pkg do
    action :install
  end
end

%w(logging server/plugins.conf.d).each do |d|
  directory "/etc/pulp/#{d}"
end

template '/etc/pulp/server.conf' do
  source 'server.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables :conf => node['pulp']['server']
end

execute 'create-ca-certs' do
  command '/usr/bin/pulp-gen-ca-certificate'
  not_if 'test -f /etc/pki/pulp/ca.key'
end

execute 'pulp-manage-db' do
  command '/usr/bin/pulp-manage-db'
  user 'apache'
  group 'apache'
  creates '/var/lib/pulp/.dbmanage.stamp'
end

if node.recipes.include?('apache2::mod_python')
  raise 'apache2::mod_python should not be used with apache2::mod_wsgi'
end

include_recipe 'apache2::mod_wsgi'
include_recipe 'apache2::mod_ssl'

apache_conf 'pulp'
apache_conf 'pulp_rpm'

template '/etc/default/pulp_resource_manager' do
  source 'pulp_resource_manager.erb'
end

service 'pulp_resource_manager' do
  action [:enable, :start]
end

template '/etc/default/pulp_celerybeat' do
  source 'pulp_celerybeat.erb'
end

service 'pulp_celerybeat' do
  action [:enable, :start]
end

template '/etc/default/pulp_workers' do
  source 'pulp_workers.erb'
end

service 'pulp_workers' do
  action [:enable, :start]
end

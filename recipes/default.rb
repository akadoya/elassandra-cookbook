#
# Cookbook:: elassandra
# Recipe:: default
#
# Copyright:: 2017, Aoi Kadoya, All Rights Reserved.
#

# elassandra requires java 8+.
node.default['java']['jdk_version'] = '8'
node.default['java']['install_flavor'] = 'oracle'
node.default['java']['oracle']['accept_oracle_download_terms'] = true
include_recipe 'java'

include_recipe "elassandra::_install_#{node['elassandra']['install_type']}"
include_recipe 'elassandra::_install_extra' if node['elassandra']['cassandra']['cqlsh']['enabled']
include_recipe 'elassandra::_service'

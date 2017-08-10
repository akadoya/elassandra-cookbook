#
# Cookbook:: elassandra
# Recipe:: _install_tar
#
# Copyright:: 2017, Aoi Kadoya, All Rights Reserved.
#

# create group
group node['elassandra']['group'] do
  system true
  action :create
end

# create user
user node['elassandra']['user'] do
  comment 'Cassandra User'
  gid node['elassandra']['group']
  system true
  action :create
end

# pid file dir
pid_basedir = ::File.dirname(node['elassandra']['pid'])
directory pid_basedir.to_s do
  owner node['elassandra']['user']
  group node['elassandra']['group']
  mode '755'
  recursive true
end

installation_path = "#{node['elassandra']['install_prefix']}/elassandra-#{node['elassandra']['release_version']}"

remote_file "#{Chef::Config[:file_cache_path]}/elassandra-#{node['elassandra']['release_version']}.tar.gz" do
  source node['elassandra']['tar']['download_url']
  checksum node['elassandra']['tar']['checksum']
  action :create
  not_if { ::File.exist?(installation_path) }
end

bash 'extract_tar_ball' do
  code <<-EOH
    mkdir -p #{node['elassandra']['install_prefix']}
    tar xzf #{Chef::Config[:file_cache_path]}/elassandra-#{node['elassandra']['release_version']}.tar.gz -C #{node['elassandra']['install_prefix']}
    chown -R #{node['elassandra']['user']}:#{node['elassandra']['group']} #{node['elassandra']['install_prefix']}/
    EOH
  not_if { ::File.exist?(installation_path) }
end

#
# Cookbook:: elassandra
# Recipe:: _service
#
# Copyright:: 2017, Aoi Kadoya, All Rights Reserved.
#

template '/etc/default/cassandra' do
  source 'default_cassandra.erb'
  mode 0644
  variables(
    install_dir: "#{node['elassandra']['install_prefix']}/elassandra-#{node['elassandra']['release_version']}",
    conf_dir: "#{node['elassandra']['install_prefix']}/elassandra-#{node['elassandra']['release_version']}/conf",
    log_dir: "#{node['elassandra']['install_prefix']}/elassandra-#{node['elassandra']['release_version']}/logs",
    data_dir: "#{node['elassandra']['install_prefix']}/elassandra-#{node['elassandra']['release_version']}/data"
  )
end

directory '/usr/lib/systemd/system' do
  owner 'root'
  group 'root'
end

template '/usr/lib/systemd/system/elassandra.service' do
  source 'service_elassandra.erb'
  mode 0644
  variables(
    install_dir: "#{node['elassandra']['install_prefix']}/elassandra-#{node['elassandra']['release_version']}",
    pid_file: node['elassandra']['pid'],
    user: node['elassandra']['user'],
    group: node['elassandra']['group']
  )
end

service 'elassandra' do
  supports status: true, restart: true
  action [:enable]
end
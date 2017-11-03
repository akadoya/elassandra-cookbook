#
# Cookbook:: elassandra
# Attribute:: default
#
# Copyright:: 2017, Aoi Kadoya, All Rights Reserved.
#

default['elassandra']['install_type'] = 'tar'
default['elassandra']['release_version'] = '5.5.0.3'
default['elassandra']['install_prefix'] = '/opt/elassandra'

default['elassandra']['tar']['download_url'] = "https://github.com/strapdata/elassandra/releases/download/v#{node['elassandra']['release_version']}/elassandra-#{node['elassandra']['release_version']}.tar.gz"
default['elassandra']['tar']['checksum'] = '6961c9feca886422b396b6c10735363daea89f632c462f1983740fa9998dc679'

default['elassandra']['pid'] = '/var/run/cassandra/cassandra.pid'
default['elassandra']['user'] = 'cassandra'
default['elassandra']['group'] = 'cassandra'

default['elassandra']['cassandra']['cqlsh']['enabled'] = true
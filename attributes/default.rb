#
# Cookbook:: elassandra
# Attribute:: default
#
# Copyright:: 2017, Aoi Kadoya, All Rights Reserved.
#

default['elassandra']['install_type'] = 'tar'
default['elassandra']['release_version'] = '2.4.5.3'
default['elassandra']['install_prefix'] = '/opt/elassandra'

default['elassandra']['tar']['download_url'] = "https://github.com/strapdata/elassandra/releases/download/v#{node['elassandra']['release_version']}/elassandra-#{node['elassandra']['release_version']}.tar.gz"
default['elassandra']['tar']['checksum'] = '34b8599a9806870b3fbe7e638fb38233dd1df459b9601efa724b9b2c4023a4b3'

default['elassandra']['pid'] = '/var/run/cassandra/cassandra.pid'
default['elassandra']['user'] = 'cassandra'
default['elassandra']['group'] = 'cassandra'

default['elassandra']['cassandra']['cqlsh']['enabled'] = true
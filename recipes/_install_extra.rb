#
# Cookbook:: elassandra
# Recipe:: _install_extra
#
# Copyright:: 2017, Aoi Kadoya, All Rights Reserved.
#

# enable cqlsh
node.default['poise-python']['install_python3'] = true
include_recipe 'poise-python'
python_package 'cassandra-driver'

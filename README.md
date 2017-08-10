Description
===========

Installs [Elassandra](http://elassandra.readthedocs.io/) service.

Requirements
============

Cookbook:
- `java`
- `poise-python`

Platform:
- Ubuntu 16.04

Attributes
==========

default
-------

| Attribute                                    | Default                                | Description                       |
|----------------------------------------------|:--------------------------------------:|-----------------------------------|
| `node['elassandra']['install_type']`         | `'tar'`                                | The type of install: only `tar` works for now. |
| `node['elassandra']['release_version']`      | `'2.4.5.3'`                            | The version to install.  |
| `node['elassandra']['install_prefix']`       | `'/opt/elassandra'`                    | The parent directory path for elassandra installation  |
| `node['elassandra']['tar']['download_url']`  | `'https://github.com/strapdata/elassandra/releases/download/v#{node['elassandra']['release_version']}/elassandra-#{node['elassandra']['release_version']}.tar.gz'` | The download url for tar ball |
| `node['elassandra']['tar']['checksum']`      | `'34b8599a9806870b3fbe7e638fb38233dd1df459b9601efa724b9b2c4023a4b3'` | The SHA256 checksum of Elassandra tar archive |
| `node['elassandra']['pid']`                  | `'/var/run/cassandra/cassandra.pid'`   | The pid file location             |
| `node['elassandra']['user']`                 | `'cassandra'`                          | Elassandra service user           |
| `node['elassandra']['group']`                | `'cassandra'`                          | Elassandra service group          |
| `node['cassandra']['cqlsh']['enabled']`      | `true`                                 | Whether to enable cqlsh           |


Recipes
=======

default
-------

The default recipe will:
- Install elassandra
- Define elassandra service

**Note**

This default recipe doesn't start the elassandra service.

Usage
=====

Simply include `elassandra::default` in your wrapper recipe and configure `conf/cassandra.yaml`, then start the service.

Wrapper recipe example
----------------------

```ruby
include_recipe 'elassandra::default'
installation_path = "#{node['elassandra']['install_prefix']}/elassandra-#{node['elassandra']['release_version']}"
template "#{installation_path}"/conf/cassandra.yaml do
  source "cassandra.yaml.erb"
  mode 0644
  variables(
   :cluster_name => 'cassandra-cluster',
   :datacenter => 'datacenter1'
  )
  notifies :start, 'service[elassandra]', :delayed
end
```


License and Author
==================

Author:: Aoi Kadoya

Copyright:: 2017, Aoi Kadoya

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

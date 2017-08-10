name 'elassandra'
maintainer 'Aoi Kadoya'
maintainer_email 'cadyan.aoi@gmail.com'
license 'Apache v2.0'
description 'Installs elassandra'
long_description 'Installs elassandra'
version '0.1.0'
chef_version '>= 12.9' if respond_to?(:chef_version)

issues_url 'https://github.com/akadoya/elassandra-cookbook/issues'
source_url 'https://github.com/akadoya/elassandra-cookbook'

supports 'ubuntu', '= 16.04'

depends 'java'
depends 'poise-python'

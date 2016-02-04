name 'pulp'
maintainer 'Marius Karnauskas'
maintainer_email 'marius@karnauskas.lt'
license 'Apache 2.0'
description 'Installs/Configures pulp'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
issues_url 'https://github.com/nkts/chef-pulp/issues'
source_url 'https://github.com/nkts/chef-pulp'
version '0.2.0'

supports 'centos'
supports 'amazon'
supports 'redhat'
supports 'fedora', '<= 22'

depends 'apache2'
depends 'yum'

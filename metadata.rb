name             'ca-certificates'
maintainer       'Jason Barnett - Mindjet LLC'
maintainer_email 'J@sonBarnett.com'
license          'MIT'
description      'Installs/Configures ca-certificates'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w( redhat centos amazon scientific oracle ).each do |os|
  supports os
end

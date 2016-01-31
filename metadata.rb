name             'ca-certificates'
maintainer       'Jason Barnett'
maintainer_email 'J@sonBarnett.com'
license          'MIT'
description      'Installs/Configures ca-certificates'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

%w( redhat centos amazon scientific oracle debian ).each do |os|
  supports os
end

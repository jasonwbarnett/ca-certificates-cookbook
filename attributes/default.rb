case node['platform_family']
when 'rhel'
  default['ca-certificates']['package'] = 'ca-certificates'
  default['ca-certificates']['ca-bundle_path'] = '/etc/pki/tls/certs/ca-bundle.crt'
else
  default['ca-certificates']['package'] = 'ca-certificates'
  default['ca-certificates']['ca-bundle_path'] = '/etc/pki/tls/certs/ca-bundle.crt'
end

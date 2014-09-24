case node['platform_family']
  when 'rhel'
    default['ca-certificates']['ca-bundle_file'] = '/etc/pki/tls/certs/ca-bundle.crt'
    default['ca-certificates']['certificates_directory'] = '/etc/pki/ca-trust/source/anchors'
    default['ca-certificates']['update_command'] = '/usr/bin/update-ca-trust'
    default['ca-certificates']['owner'] = 'root'
    default['ca-certificates']['group'] = 'root'
    case node['platform_version']
      when /^5\./
        default['ca-certificates']['package'] = 'openssl'
      when /^6\./
        default['ca-certificates']['package'] = 'ca-certificates'
      else
        default['ca-certificates']['package'] = 'ca-certificates'
      end
  when 'debian'
    default['ca-certificates']['ca-bundle_file'] = '/etc/ssl/certs/ca-certificates.crt'
    default['ca-certificates']['package'] = 'ca-certificates'
    default['ca-certificates']['certificates_directory'] = '/usr/local/share/ca-certificates'
    default['ca-certificates']['update_command'] = '/usr/sbin/update-ca-certificates'
    default['ca-certificates']['owner'] = 'root'
    default['ca-certificates']['group'] = 'staff'
  else
    default['ca-certificates']['package'] = 'ca-certificates'
    default['ca-certificates']['ca-bundle_file'] = '/etc/pki/tls/certs/ca-bundle.crt'
    default['ca-certificates']['owner'] = 'root'
    default['ca-certificates']['group'] = 'root'
end


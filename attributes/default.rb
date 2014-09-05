case node['platform_family']
  when 'rhel'
    default['ca-certificates']['ca-bundle_path'] = '/etc/pki/tls/certs/ca-bundle.crt'
    case node['platform_version']
      when /^5\./
        default['ca-certificates']['package'] = 'openssl'
      when /^6\./
        default['ca-certificates']['package'] = 'ca-certificates'
      else
        default['ca-certificates']['package'] = 'ca-certificates'
      end
  else
    default['ca-certificates']['package'] = 'ca-certificates'
    default['ca-certificates']['ca-bundle_path'] = '/etc/pki/tls/certs/ca-bundle.crt'
end


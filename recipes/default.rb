#
# Cookbook Name:: ca-certificates
# Recipe:: default
#
# Copyright 2014, Jason Barnett - Mindjet LLC
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

package node['ca-certificates']['package'] do
  action :upgrade
end

if platform_family?('rhel')
  execute "append_certs_to_ca-bundle" do
    command "cat #{node['ca-certificates']['certificates_directory']}/* >> #{node['ca-certificates']['ca-bundle_file']}"
    action :nothing
  end

  cookbook_file node['ca-certificates']['ca-bundle_file'] do
    owner 'root'
    group node['root_group']
    source 'ca-bundle.crt'
    action :nothing
    subscribes :run, "package[#{node['ca-certificates']['package']}]",                         :immediately
    subscribes :run, "remote_directory[#{node['ca-certificates']['certificates_directory']}]", :immediately
    notifies   :run, 'execute[append_certs_to_ca-bundle]',                                     :delayed
  end
end

if platform_family?('debian') || node['ca-certificates']['update-ca-trust']
  execute 'update-ca-certs' do
    command node['ca-certificates']['update_command']
    action :nothing
    subscribes :run, "package[#{node['ca-certificates']['package']}]",                         :immediately
    subscribes :run, "remote_directory[#{node['ca-certificates']['certificates_directory']}]", :immediately
  end
end

remote_directory node['ca-certificates']['certificates_directory'] do
  owner 'root'
  group node['root_group']
  action :create
  source 'certificates_directory'
end


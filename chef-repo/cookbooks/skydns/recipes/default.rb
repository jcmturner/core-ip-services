include_recipe 'coreip-common::default'
include_recipe 'coreip-common::local-yum-repo'

package "skydns" do
  action :install
  flush_cache [:before]
end

template '/opt/skydns/conf/environment' do
  source 'skydns-environment.erb'
  owner 'root'
  group 'root'
  mode '0640'
  variables({
    "etcd_urls" => "http://10.80.31.11:4001,http://10.80.31.12:4001"
  })
end

service 'etcd' do
  action [:stop, :disable]
end

service 'skydns' do
  action [:restart, :enable]
end

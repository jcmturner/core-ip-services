include_recipe 'coreip-common::default'

package 'etcd'

host_net_ip = node[:network][:interfaces][:enp0s8][:addresses].detect{|k,v| v[:family] == "inet" }.first

template '/etc/etcd/etcd.conf' do
  source 'etcd.conf.erb'
  owner 'root'
  group 'root'
  mode '0640'
  variables({
    "host_net_ip" => host_net_ip
  })
end

service 'etcd' do
  action [:enable, :start]
end

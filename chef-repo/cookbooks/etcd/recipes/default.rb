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

include_recipe 'coreip-common::resolv'

service 'etcd' do
  action [:enable, :start]
end

# Following is commented out as cannot set value until all etcd hosts are up. Has to execute on etc1 before etcd2 is up and therefore fails.
## Had to put sleep in to wait for the service to start
#execute 'insert_test_skyDNS_entry' do
#  command "sleep 10; /bin/etcdctl set /skydns/com/#{node[:coreip][:domain]}/test \'{\"host\":\"1.2.3.4\"}\'"
#end

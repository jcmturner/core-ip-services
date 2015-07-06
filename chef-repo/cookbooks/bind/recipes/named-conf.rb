host_net_ip = node[:network][:interfaces][:enp0s8][:addresses].detect{|k,v| v[:family] == "inet" }.first

template '/etc/named.conf' do
  source 'named.conf.erb'
  owner 'root'
  group 'named'
  mode '0640'
  variables({
    "host_net_ip" => host_net_ip
  })
end

template '/var/named/data/db.coreip.intranet' do
  source 'db.coreip.intranet.erb'
  owner 'root'
  group 'named'
  mode '0640'
  variables({
    "host_net_ip" => host_net_ip
  })
end

template '/etc/named/coreip.conf' do
  source 'coreip.conf.erb'
  owner 'root'
  group 'named'
  mode '0640'
end

service 'named' do
  action [:restart]
end


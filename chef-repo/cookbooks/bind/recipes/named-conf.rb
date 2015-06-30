template '/etc/named.conf' do
  source 'named.conf.erb'
  owner 'root'
  group 'named'
  mode '0640'
end

template '/etc/named/forwarders-skydns.conf' do
  source 'forwarders.conf.erb'
  owner 'root'
  group 'named'
  mode '0640'
end


service 'named' do
  action [:restart]
end


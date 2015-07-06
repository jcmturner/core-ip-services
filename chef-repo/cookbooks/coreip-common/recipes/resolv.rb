template '/etc/resolv.conf' do
  source 'resolv.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

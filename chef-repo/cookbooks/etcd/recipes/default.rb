include_recipe 'coreip-common::default'

package 'etcd'

service 'etcd' do
  action [:enable, :start]
end

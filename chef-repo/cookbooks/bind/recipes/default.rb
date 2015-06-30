include_recipe 'coreip-common::default'

package 'bind'

service 'named' do
  action [:enable, :start]
end

include_recipe 'bind::named-conf'

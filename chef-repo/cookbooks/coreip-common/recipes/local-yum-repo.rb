package "createrepo"

bash 'create-repo' do
  user 'root'
  cwd '/vagrant/yum-repo'
  code <<-EOH
  createrepo /vagrant/yum-repo
  EOH
end

template '/etc/yum.repos.d/vagrantlocal.repo' do
  source 'vagrantlocal.repo.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

cd /vagrant/chef-repo
chef-client --local-mode --runlist "recipe[$1]"

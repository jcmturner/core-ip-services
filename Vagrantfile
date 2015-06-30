Vagrant.configure("2") do |config|
  config.vm.box = "chef/centos-7.0"
  #config.vm.box_url = "http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/fedora/linux/releases/22/Cloud/x86_64/Images/Fedora-Cloud-Base-Vagrant-22-20150521.x86_64.vagrant-virtualbox.box"
  #config.vm.box_download_checksum = "2513342f70c00310e161a110e34973a133691fedd866859e65904fa056ae7a0c"
  #config.vm.box_download_checksum_type = "sha256"
  config.vm.provider "virtualbox" do |v|
    v.memory = 768
    v.cpus = 1
  end
  #config.vm.provision "chef_solo" do |chef|
  #  #Specify the local paths where Chef data is stored
  #  chef.cookbooks_path = "chef-repo/cookbooks"
  #  chef.roles_path = "chef-repo/roles"
  #end


#etcd cluster coreip1.com
#  (1..3).each do |i|
#    config.vm.define "etcd#{i}", primary: true do |etcd|
#      etcd.vm.hostname = "etcd#{i}.coreip1.com"
#      etcd.vm.network "private_network", ip: "10.80.31.1#{i}", netmask: "255.255.0.0"
#      #etcd.vm.provision "chef_solo" do |chef|
#      #  chef.add_recipe "coreip-common"
#      #end
#      etcd.vm.provision :shell, path: "bootstrap.sh"
#      etcd.vm.provision :shell, path: "bootstrap-chef-trigger.sh", args: "etcd"
#    end
#  end

#skydns headend nodes coreip1.com
#  (1..2).each do |i|
#    config.vm.define "skydns#{i}", primary: true do |skydns|
#      skydns.vm.hostname = "skydns#{i}.coreip1.com"
#      skydns.vm.network "private_network", ip: "10.80.21.1#{i}", netmask: "255.255.0.0"
#      skydns.vm.provision :shell, path: "bootstrap.sh"
#      skydns.vm.provision :shell, path: "bootstrap-chef-trigger.sh", args: "skydns"
#    end
#  end
  
#bind caching recursive resolver layer
  (1..1).each do |i|
    config.vm.define "bind#{i}", primary: true do |bind|
      bind.vm.hostname = "bind#{i}.coreip.com"
      bind.vm.network "private_network", ip: "10.80.10.1#{i}", netmask: "255.255.0.0"
      bind.vm.provision :shell, path: "bootstrap.sh"
      bind.vm.provision :shell, path: "bootstrap-chef-trigger.sh", args: "bind"
    end
  end


end

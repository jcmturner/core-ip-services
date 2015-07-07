Vagrant.configure("2") do |config|
  config.vm.box = "chef/centos-7.0"
  ### The following is to use fedora as a base box but this does not work well with chef due to F22 using dnf rather than yum
  #config.vm.box_url = "http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/fedora/linux/releases/22/Cloud/x86_64/Images/Fedora-Cloud-Base-Vagrant-22-20150521.x86_64.vagrant-virtualbox.box"
  #config.vm.box_download_checksum = "2513342f70c00310e161a110e34973a133691fedd866859e65904fa056ae7a0c"
  #config.vm.box_download_checksum_type = "sha256"
  ###
  config.vm.provider "virtualbox" do |v|
    v.memory = 768
    v.cpus = 1
  end

### bind caching recursive resolver layer and etcd cluster discovery zone
  (1..1).each do |i|
    config.vm.define "bind#{i}", primary: true do |bind|
      bind.vm.hostname = "bind#{i}.coreip.intranet"
      bind.vm.network "private_network", ip: "10.80.10.1#{i}", netmask: "255.255.0.0"
      bind.vm.provision :shell, path: "bootstrap.sh"
      bind.vm.provision :shell, path: "bootstrap-chef-trigger.sh", args: "bind"
    end
  end


### etcd cluster coreip-a.com
  (1..2).each do |i|
    config.vm.define "etcd-a#{i}", primary: true do |etcda|
      etcda.vm.hostname = "etcd-a#{i}.coreip.intranet"
      etcda.vm.network "private_network", ip: "10.80.31.1#{i}", netmask: "255.255.0.0"
      #etcda.vm.provision "chef_solo" do |chef|
      #  chef.add_recipe "coreip-common"
      #end
      etcda.vm.provision :shell, path: "bootstrap.sh"
      etcda.vm.provision :shell, path: "bootstrap-chef-trigger.sh", args: ["etcd", "coreip-a"]
    end
  end

### skydns headend nodes coreip-a.com
  (1..1).each do |i|
    config.vm.define "skydns-a#{i}", primary: true do |skydnsa|
      skydnsa.vm.hostname = "skydns-a#{i}.coreip.intranet"
      skydnsa.vm.network "private_network", ip: "10.80.21.1#{i}", netmask: "255.255.0.0"
      skydnsa.vm.provision :shell, path: "bootstrap.sh"
      skydnsa.vm.provision :shell, path: "bootstrap-chef-trigger.sh", args: ["skydns", "coreip-a"]
    end
  end

### etcd cluster coreip-b.com
  (1..2).each do |i|
    config.vm.define "etcd-b#{i}", primary: true do |etcdb|
      etcdb.vm.hostname = "etcd-b#{i}.coreip.intranet"
      etcdb.vm.network "private_network", ip: "10.80.32.1#{i}", netmask: "255.255.0.0"
      #etcdb.vm.provision "chef_solo" do |chef|
      #  chef.add_recipe "coreip-common"
      #end
      etcdb.vm.provision :shell, path: "bootstrap.sh"
      etcdb.vm.provision :shell, path: "bootstrap-chef-trigger.sh", args: ["etcd", "coreip-b"]
    end
  end

### skydns headend nodes coreip-b.com
  (1..1).each do |i|
    config.vm.define "skydns-b#{i}", primary: true do |skydnsb|
      skydnsb.vm.hostname = "skydns-b#{i}.coreip.intranet"
      skydnsb.vm.network "private_network", ip: "10.80.22.1#{i}", netmask: "255.255.0.0"
      skydnsb.vm.provision :shell, path: "bootstrap.sh"
      skydnsb.vm.provision :shell, path: "bootstrap-chef-trigger.sh", args: ["skydns", "coreip-b"]
    end
  end
  


end

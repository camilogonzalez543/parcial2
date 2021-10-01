# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
if Vagrant.has_plugin? "vagrant-vbguest"
  config.vbguest.no_install = true
  config.vbguest.auto_update = false
  config.vbguest.no_remote = true
end
config.vm.define :servidor2 do |servidor2|
servidor2.vm.box = "bento/centos-7.9"
servidor2.vm.network :private_network, ip: "209.191.100.2"
servidor2.vm.network :forwarded_port, guest: 4422, host:8022
servidor2.vm.provision "shell", path: "serv2.sh"
servidor2.vm.hostname = "servidor2"
end
config.vm.define :firewall do |firewall|
firewall.vm.box = "bento/centos-7.9"
firewall.vm.network :public_network, ip: "192.168.0.177"
firewall.vm.network :private_network, ip: "192.168.100.3"
firewall.vm.provision "shell", path: "script.sh"
firewall.vm.hostname = "firewall"
end
config.vm.define :servidor do |servidor|
servidor.vm.box = "bento/centos-7.9"
servidor.vm.network :private_network, ip: "192.168.100.4"
servidor.vm.provision "shell", path: "serv.sh"
servidor.vm.hostname = "servidor"
end
end
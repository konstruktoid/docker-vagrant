Vagrant.configure(2) do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.box = "ubuntu-cloud-image"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.provision :shell, path: "setup.sh"

  config.vm.define "stable" do |stable|
    stable.vm.network :private_network, ip: "192.168.10.10"
    stable.vm.hostname = "stable"
  end

  config.vm.define "experimental" do |experimental|
    experimental.vm.network :private_network, ip: "192.168.10.15"
    experimental.vm.hostname = "experimental"
  end
end

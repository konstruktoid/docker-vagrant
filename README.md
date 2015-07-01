# docker-vagrant

Replacing `boot2docker` with `Vagrant`.

## Requirements
[Vagrant](https://www.vagrantup.com/)

## Files
`Vagrantfile` Vagrant configuration file for `stable` and `experimental`  
`docker-vagrant` shell script for smoother management  
`setup.sh` host setup script, executed from inside `Vagrantfile`  

## Usage
```sh
vagrant up
./docker-vagrant help
./docker-vagrant experimental version
./docker-vagrant stable version
./docker-vagrant experimental run --restart=always -d -p 80:80 nginx
./docker-vagrant experimental ps
```

### Port forwarding
Add `experimental.vm.network :forwarded_port, guest: 80, host: 8080` to the
`Vagrantfile` if you want to forward Vagrant host port 8080 to port 80 on the
host running the experimental Docker version.

```sh
  config.vm.define "experimental" do |experimental|
    experimental.vm.network :private_network, ip: "192.168.10.15"
    experimental.vm.hostname = "experimental"
    experimental.vm.network :forwarded_port, guest: 80, host: 8080
  end
```

After the configuration change run `vagrant reload experimental`. If you
didn't use `--restart=always` when starting your container, you have to
run `./docker-vagrant experimental start CONTAINER ID` after Vagrant has
reloaded the configuration.



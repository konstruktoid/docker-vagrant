#!/usr/bin/env bash

case "$(hostname -s)" in
  (stable*) curl -sSL https://get.docker.com/ | sh ;;
  (experimental*) curl -sSL https://experimental.docker.com/ | sh ;;
  (*)   echo "Unknown hostname" ;;
esac

usermod -aG docker vagrant

wget -q -O /tmp/baselineDockerHost.sh https://raw.githubusercontent.com/konstruktoid/Docker/master/Security/baselineDockerHost.sh 
bash /tmp/baselineDockerHost.sh


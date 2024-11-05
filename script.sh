#!/bin/bash

docker run --name fedora -it -d pycontribs/fedora
docker run --name ubuntu -it -d ubuntu
docker run --name centos7 -it -d centos:centos7

docker exec ubuntu apt-get update
docker exec ubuntu apt-get install python3 -y
ansible-playbook --vault-password-file /home/user/ansible/mnt-homeworks/08-ansible-01-base/playbook/pass  -i inventory/prod.yml site.yml

docker stop $(docker ps -a -q)
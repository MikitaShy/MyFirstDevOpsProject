#!/usr/bin/env bash
usermod vagrant -aG root
sudo apt-get clean all
sudo apt update -y 
sudo apt-get install -y git
sudo apt install software-properties-common
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update -y
sudo apt install ansible -y
sudo echo "Centos  ansible_host=10.0.0.120  ansible_user=vagrant   ansible_password=vagrant" | sudo tee -a /etc/ansible/hosts
#sudo ansible-playbook /home/vagrant/jenkins.yml
echo "+++++++++++++++++++++++++++++++Installed"
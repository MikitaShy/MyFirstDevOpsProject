!/bin/bash
echo "Enter username"
read username
echo "Enter password"
read password

if [[ ( $username == "admin" && $password == "123!GTE" ) ]]; then
echo "create or destroy VM (c or d)"
read edit
if [[ ( $edit == "c" ) ]]; then
echo "Welcome $username to Linux"
vagrant --version
echo "====Create 2 VM===="
vagrant up
sleep 3
echo "====Ansible Install Jenkins in Centos===="
vagrant ssh Ubuntu -- -t 'mkdir ~/ansible/; cd ~/ansible/; git init; git clone https://github.com/MikitaShy/MyFirstDevOpsProject.git; cd MyVagrant-Ansible/; sudo ansible-playbook jenkins.yml; sudo ansible-playbook playbook_centos_install_docker.yml'
sleep 3
echo "====Install Docker and run MyStatic_Site===="
vagrant ssh Centos -- -t 'mkdir ~/docker/; cd docker/; git init; git clone https://github.com/MikitaShy/Docker_MyStatic_Site.git ;  sudo docker build -t m.shylau/nginx ~/docker/Docker_MyStatic_Site/static-site/ ; sudo docker run -dit -p 8888:80 m.shylau/nginx'
sleep 3
elif [[ ( $edit == "d" ) ]]; then
vagrant destroy
else
echo "====Invalid===="
return
fi
$SHELL
else
echo "====Invalid User===="
fi

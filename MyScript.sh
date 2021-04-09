!/bin/bash
echo "create or destroy VM (c or d)"
read edit
if [[ ( $edit == "c" ) ]]; then
echo "Welcome $username to Linux"
vagrant --version
echo "====Create 2 VM===="
vagrant up
echo "====Ansible Install Jenkins in Centos===="
vagrant ssh Ubuntu -- -t 'mkdir ~/ansible/; cd ~/ansible/; git init; git clone https://github.com/MikitaShy/MyFirstDevOpsProject.git; 
cd MyFirstDevOpsProject./MyS/; sudo ansible-playbook jenkins.yml; sudo ansible-playbook playbook_centos_install_docker.yml'
sleep 3
echo "====Install Docker and run MyStatic_Site===="
vagrant ssh Centos -- -t 'mkdir ~/docker/; cd docker/; git init; git clone https://github.com/MikitaShy/Docker_MyStatic_Site.git; 
sudo docker build -t mish0421/nginx ~/docker/Docker_MyStatic_Site/static-site/ ; sudo docker run -dit -p 8888:80 mish0421/nginx'
elif [[ ( $edit == "d" ) ]]; then
vagrant destroy
else
echo "====Invalid===="
return
fi
$SHELL
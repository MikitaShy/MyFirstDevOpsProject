Vagrant.configure("2") do |config|
        #тачка первая
        config.vm.define "Ubuntu"  do |master|
        master.vm.box = "ubuntu/trusty64"
        master.vm.box_check_update = false
        master.vm.hostname = "ubuntu"
        config.ssh.username = "vagrant"
        config.ssh.password = "vagrant"  
        master.vm.network "private_network", ip: "10.0.0.119"		      
        #master.vm.synced_folder "ansible/", "/home/vagrant"
        master.vm.provision :shell, :path => "launching_programs.sh"
        end

        #тачка вторая
        config.vm.define "Centos" do |homestead|
        homestead.vm.box = "bento/centos-7"
        homestead.vm.box_check_update = false
        homestead.vm.hostname = "centos"
        homestead.vm.network "private_network", ip: "10.0.0.120"
        homestead.vm.network "forwarded_port", guest: 8080, host: 8080
        homestead.vm.network "forwarded_port", guest: 8888, host: 8888
        homestead.vm.provision "shell", inline: <<-SHELL											
         usermod vagrant -aG root
         sudo su -
         sudo yum update -y \
         && sudo yum install -y git openjdk-8-jdk
         git --version
	     sudo yum -y install python-pip
	     sudo yum install python27
         echo "Installing is compleated"
        SHELL
        end
end

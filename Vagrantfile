require 'yaml'

current_dir    = File.dirname(File.expand_path(__FILE__))
configs        = YAML.load_file("#{current_dir}/config.yaml")
vagrant_config = configs['configs'][configs['configs']['use']]


Vagrant.configure("2") do |config|
    config.vm.box = vagrant_config['box']
    config.vm.provider :virtualbox do |vb|
      vb.name = vagrant_config['vb-name']
    end
    config.vm.hostname = vagrant_config['hostname']
    config.vm.network vagrant_config['network_type'], bridge: vagrant_config['network_interface'], ip: vagrant_config['public_ip']
    config.vm.provision "shell" do |s|
      ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
      s.inline = <<-SHELL
        ## user setup
        useradd -m -s /bin/bash -U ubuntu -u 666 
        cp -pr /home/vagrant/.ssh /home/ubuntu/
        chown -R ubuntu:ubuntu /home/ubuntu
        echo "%ubuntuun ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ubuntu
        echo #{ssh_pub_key} >> /home/ubuntu/.ssh/authorized_keys
        echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
        echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
        date > /etc/vagrant_provisioned_at
      SHELL
    end
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "setup.yaml"  
      ansible.compatibility_mode = "2.0"
    end
  end
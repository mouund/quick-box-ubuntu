# Use this to instanciate a test box running ubuntu in a timely manner

** Requirements:
* Virtualbox 
* Vagrant

`cd quick-ubuntu-box`
`vagrant up`
`ssh ubuntu@192.168.1.40`

That's all :D

# Configuration
To customize the VM parameters use the `config.yaml` file

IP is currently hardcoded @192.168.1.40

make sure to adapt it to your need 

Make sure to set the network interface you want to use from your host machine

use
` ip a`

Pre-installed:
- docker
- localstack
- awscli


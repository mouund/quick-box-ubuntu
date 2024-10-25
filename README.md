## Use this to instantiate a test box running Ubuntu in a timely manner

**Requirements:** 

* Virtualbox
* Vagrant

````
cd quick-ubuntu-box
vagrant up
ssh ubuntu@192.168.1.40
````

**Configuration**

- config.yaml is used to customize VM parameters

- IP is currently hard-coded @192.168.1.40

- Make sure to set the network interface you want to use from your host machine 

Pre-installed:

- docker
- localstack
- awscli

**Ansible**

On host conf:

````
ansible --version
ansible [core 2.17.5]
python version = 3.10.12 (main, Sep 11 2024, 15:47:36) [GCC 11.4.0] (/usr/bin/python3)
  jinja version = 3.1.3
  libyaml = True
````
Roles that are played

````
   - role: install_packages
````
Install packages listed at `quick-box/group_vars/all/packages.yaml`

````
- role: deploy_docker
````
Deploy docker repository and adds users to docker group to avoid using sudo to start containers

````
   - role: copy_files
````
Copies files present in `quick-box/group_vars/all/files.yaml`
````
   - role: git
````
Clone repos present in `quick-box/group_vars/all/git.yaml`

Feel free to modify whatever config needs to. I made it only to skip the hassle of vm creation.real	

````
time vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'ubuntu/jammy64'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'ubuntu/jammy64' version '20241002.0.0' is up to date...
==> default: Setting the name of the VM: ubuntu
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration..

[...]

6m38,155s
user	0m27,173s
sys	0m10,284s
````



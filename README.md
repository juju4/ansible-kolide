[![Build Status - Master](https://travis-ci.org/juju4/ansible-kolide.svg?branch=master)](https://travis-ci.org/juju4/ansible-kolide)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-kolide.svg?branch=devel)](https://travis-ci.org/juju4/ansible-kolide/branches)
# kolide ansible role

Ansible role to setup kolide, osquery central console
https://kolide.co/
(need a license to use, trial on demand)

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.2
 * 2.3
 * 2.5
 * 2.9

### Operating systems

Ubuntu 14.04, 16.04, 18.04 and Centos7

## Example Playbook

Just include this role in your list.
For example

```
- hosts: all
  roles:
    - juju4.kolide
```

## Variables

Nothing specific for now.

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.kolide
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.kolide/test/vagrant
$ vagrant up
$ vagrant ssh
```

Role has also a packer config which allows to create image for virtualbox and vmware based on https://github.com/jonashackt/ansible-windows-docker-springboot/ and https://github.com/boxcutter/windows.
Plan for about 50GB of free disk space and 1h to build one image.
```
$ cd /path/to/packer-build
$ cp -Rd /path/to/juju4.kolide/packer .
## update packer-*.json with your current absolute ansible role path for the main role
$ cd packer
$ packer build *.json
$ packer build -only=virtualbox-iso *.json
## if you want to enable extra log
$ PACKER_LOG_PATH="packerlog.txt" PACKER_LOG=1 packer build *.json
# for Azure, add ansible.cfg with roles_path
$ . ~/.azure/credentials
$ packer build azure-packer-kolide-centos7.json
$ packer build -var-file=variables.json azure-packer-kolide-centos7.json
```

## Troubleshooting & Known issues

* Centos7 with default mariadb 5.5
```
FAIL 20161118212436_CreateTableDistributedQueryCampaigns.go (Error 1293: In    correct table definition; there can be only one TIMESTAMP column with CURRENT_TIMESTAMP in DEFAULT or ON UPDATE clause), quitting migration.
```
= Use more recent mysql variant

* mysql-azure tasks file uses some module requiring ansible 2.9+. If you must use an older ansible version, either not include this file or adapt it.

## License

BSD 2-clause


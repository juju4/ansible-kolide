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

## Troubleshooting & Known issues

* Centos7 with default mariadb 5.5
```
FAIL 20161118212436_CreateTableDistributedQueryCampaigns.go (Error 1293: In    correct table definition; there can be only one TIMESTAMP column with CURRENT_TIMESTAMP in DEFAULT or ON UPDATE clause), quitting migration.
```
= Use more recent mysql variant


## License

BSD 2-clause


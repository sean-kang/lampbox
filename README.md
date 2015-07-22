Lampbox Cookbook
================
This cookbook launches a LAMP stack in vagrant instance.

Requirements
------------
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/downloads.html) - to provision a virtual machine
* [Vagrant Berkshelf Plugin](https://github.com/berkshelf/vagrant-berkshelf) - to handle cookbook dependencies
* [ChefDK](https://downloads.chef.io/chef-dk) - to set up berkshelf

Usage
-----
* To start a vagrant instance, run `vagrant up`
* To SSH to the vagrant instance, run `vagrant ssh`
* To access database via web UI, access `http://192.168.100.100/adminer.php`
* Your local `httpdocs` is the document root and will be synchronized with `/var/www/vhosts/lampbox/httpdocs` in vagrant instance.

| Key               | Value           |
| ----------------- | --------------- |
| IP address        | 192.168.100.100 |
| Database name     | lampbox         |
| Database user     | lampbox         |
| Database password | lampbox         |

License and Authors
-------------------
Author: Sean Kang

Copyright 2015 Sean Kang

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

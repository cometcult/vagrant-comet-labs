Vagrant & Puppet setup for Comet Labs

1) Requirements
---------------
* [VirtualBox 4.3.x](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant 1.4.x](http://vagrantup.com/)
* [Puppet 3.3.x](http://docs.puppetlabs.com/guides/installation.html)
* NFS (This comes pre-installed on Mac OS X, and is typically a simple package install on Linux)


2) Installing
-------------

git archive this repository and included in your Comet Labs project

3) Vagrant
----------

Start Vagrant with:
```bash
vagrant up --provision
```
Keep in mind that the first start may take a while. If you're done with development you can [suspend the VM](http://docs.vagrantup.com/v2/getting-started/teardown.html)

4) Symfony
----------

To check status of your local Symfony project visit:

```bash
http://comet-labs.dev/app_dev.php
```
and

```bash
http://comet-labs.dev/app_dev.php/demo/
```


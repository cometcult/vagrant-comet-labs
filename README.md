Vagrant & Puppet setup for Comet Labs

1) Requirements
---------------
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://vagrantup.com/)
* [Puppet](http://docs.puppetlabs.com/guides/installation.html)
* NFS (This comes pre-installed on Mac OS X, and is typically a simple package install on Linux)


2) Installing
-------------

Inside your project's directory clone the setup:

```bash
git clone git@github.com:cometcult/vagrant-comet-labs.git .puppet
cd .puppet
git submodule update --init --recursive
```

Create a Vagrantfile and configure manifests and module paths. You can use provided example:
Please remember to check if your .puppet/ has most recent master branch checked out.

```bash
cat .puppet/Vagrantfile |
    sed -e 's/module_path = "modules"/module_path = ".puppet\/modules"/g' |
    sed -e 's/manifests_path = "manifests"/manifests_path = ".puppet\/manifests"/g' > Vagrantfile
```

3) Vagrant
----------

Start Vagrant with:
```bash
vagrant up
```
Keep in mind that the first start may take a while. If you're done with development you can [suspend the VM](http://docs.vagrantup.com/v2/getting-started/teardown.html)
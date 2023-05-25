# Packer templates for Ubuntu 16.10

Templates to create Vagrant boxes for Ubuntu 16.10 (amd64).

## Prerequisites

* [Packer] v0.8.6+
* [Vagrant] v1.7.3+
* [VirtualBox] Version 5.1.6+
* [VMware] Workstation v11.1.0+ / VMware Fusion v8.0+
* [ESXi] (vSphere Hypervisor) v5.5+

[ESXi]: http://www.vmware.com/products/vsphere-hypervisor
        "Free VMware vSphere Hypervisor, Free Virtualization (ESXi)"
[Packer]: https://www.packer.io/ "Packer by HashiCorp"
[Vagrant]: https://www.vagrantup.com/ "Vagrant"
[VirtualBox]: https://www.virtualbox.org/ "Oracle VM VirtualBox"
[VMware]: http://www.vmware.com/ "VMware Virtualization for Desktop &amp; Server, Application, Public &amp; Hybrid Clouds"

## Provisioned software tools

* VirtualBox Guest Additions
* `vagrant` user and its insecure public key

## How to create a box

From the terminal, invoke the following command for VirtualBox provider:

	packer build -only=virtualbox-iso ubuntu-16.10-server-minimal.json
or:

	packer build -only=vmware-iso ubuntu-16.10-server-minimal.json

for VMware provider.
You will find a vagrant box file named `Ubuntu-16.10-server-amd64-minimal-v1610.0.0-virtualbox.box`
in the same directory after the command has succeeded.

Then you can add the box named `Ubuntu-16.10-server-amd64-minimal-v1610.0.0-virtualbox` to your box list
by the following command (for example of VirtualBox provider):


	vagrant box add Ubuntu-16.10-server-amd64-minimal-v1610.0.0-virtualbox.box --name Ubuntu-16.10-server-amd64-minimal-v1610.0.0-virtualbox


## Building a VM image on ESXi

In order to build a VM image on ESXi, you need to provide the following environment variables:

* `REMOTE_HOST` - ESXi host name or IP address
* `REMOTE_USERNAME` - ESXi login user name
* `REMOTE_PASSWORD` - ESXi login password
* `REMOTE_DATASTORE` - ESXi datastore name where a VM image will be created

You also have to enable SSH and VNC on ESXi host.

The following command will build a VM image on your ESXi:

    packer build -only=esxi-iso ubuntu-16.10-server-minimal.json

(Note that created VM will be unregistered from your Inventory.)

## Variants

* `packer build ubuntu-16.10-desktop.json` - Ubuntu Desktop 16.10
* `packer build ubuntu-16.10-server-minimal.json` - Ubuntu Server 16.10
* `packer build ubuntu-16.10-server-ansible.json` - Ubuntu Server 16.10 + [Ansible] + [Testinfra]
* `packer build lubuntu-16.10-desktop.json` - Lubuntu 16.10
* `packer build xubuntu-16.10-desktop.json` - Xubuntu 16.10

[Ansible]: https://www.ansible.com/ "Ansible is Simple IT Automation"
[Testinfra]: https://testinfra.readthedocs.io/en/latest/ "Testinfra test your infrastructure &mdash; testinfra 1.4.2 documentation"

## Build parameters

The following parameters can be set at build time by supplying `-var` or `-var-file` command line options to `packer`:

* `vm_name` - VM name.  This also affects box file name and output directory name.
* `mem_size` - RAM size of the created VM.  Default value is `512` which means 512MB.
* `disk_size` - Disk size of the created VM.  Default value is `40960` which means 40GB.
* `root_password` - Password for `root` user.  Default value is `vagrant`.
* `vagrant_username` - User name used for run time.  Vagrant box is set for this user.  Default value is `vagrant`.
  This is also used for SSH user name during build time.
* `vagrant_password` - Password for `vagrant_username`.  Default value is `vagrant`.
  This is also used for SSH password during build time.

- - -

Copyright &copy; 2016 Upper Stream Software.

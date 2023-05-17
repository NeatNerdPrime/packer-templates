# Packer templates for Debian 7.9

Templates to create Vagrant boxes for Debian 7.9 (amd64).

## Prerequisites

* [Packer] v0.8.6+
* [Vagrant] v1.7.3+
* [VirtualBox]
	* Version 4.3.28+ for Windows
	* Version 4.3.28+ for Mac OS X (You may want to stay with 4.3.28 which allows [HAXM] to work in parallel.)
* [ESXi] (vSphere Hypervisor) v5.5+

[ESXi]: http://www.vmware.com/products/vsphere-hypervisor
        "Free VMware vSphere Hypervisor, Free Virtualization (ESXi)"
[HAXM]: https://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager
        "Intel&reg; Hardware Accelerated Execution Manager"
[Packer]: https://www.packer.io/ "Packer by HashiCorp"
[Vagrant]: https://www.vagrantup.com/ "Vagrant"
[VirtualBox]: https://www.virtualbox.org/ "Oracle VM VirtualBox"

## Provisioned software tools

* VirtualBox Guest Additions or [open-vm-tools]
* curl
* sshd
* sudo
* rsync
* `vagrant` user and its insecure public key

[open-vm-tools]: https://github.com/vmware/open-vm-tools "Official repository of VMware open-vm-tools project"

## How to create a box

From the terminal, invoke the following command:

	packer build debian-7.9.0-amd64-minimal.json

and you will find a vagrant box file named `Debian-7.9.0-amd64-minimal-v2-virtualbox.box`
in the same directory after the command has succeeded.

Then you can add the box named `Debian-7.9.0-amd64-minimal-v2-virtualbox` to your box list
by the following command:

	vagrant box add Debian-7.9.0-amd64-minimal-v2-virtualbox.box --name Debian-7.9.0-amd64-minimal-v2-virtualbox

## Building a VM image on ESXi

In order to build a VM image on ESXi, you need to provide the following environment variables:

* `REMOTE_HOST` - ESXi host name or IP address
* `REMOTE_USERNAME` - ESXi login user name
* `REMOTE_PASSWORD` - ESXi login password
* `REMOTE_DATASTORE` - ESXi datastore name where a VM image will be created

You also have to enable SSH and VNC on ESXi host.

The following command will build a VM image on your ESXi (Created VM will be unregistered from your Inventory):

    packer build -only=vmware-iso debian-7.9.0-amd64-minimal.json

## Variants

* `debian-7.9.0-amd64-minimal.json` - Debian 7.9 minimal installation
* `debian-7.9.0-amd64-docker.json` - provided with [Docker] and Kernel 3.8+ in addition to Debian 7.9 minimal installation.
* `debian-7.9.0-amd64-xfce.json` - provided with [Xfce] and [xrdp] in addition to Debian 7.9 minimal installation.

[Docker]: https://www.docker.com/ "Docker - Build, Ship and Run Any App, Anywhere"
[Xfce]: http://www.xfce.org/ "Xfce Desktop Environment"
[xrdp]: http://www.xrdp.org/ "xrdp"

## Build parameters

The following parameters can be set at build time by supplying `-var` or `-var-file` command line options to `packer`:

* `root_password` - Password for `root` user.  Default value is `vagrant`.
* `vagrant_username` - User name used for run time.  Vagrant box is set for this user.  Default value is `vagrant`.
* `vagrant_password` - Password for `vagrant_username`.  Default value is `vagrant`.

- - -

Copyright &copy; 2016 Upper Stream Software.

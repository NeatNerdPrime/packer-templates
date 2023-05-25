# Packer templates for Ubuntu 15.04

Templates creating Vagrant boxes for Ubuntu 15.04 (x86_64).

## Prerequisites

* [Packer] v0.6.1
* [Vagrant] v1.6.5
* [VirtualBox]
	* Version 4.3.16 for Windows
	* Version 4.2.8 for Mac OS X (which allows [HAXM] to work in parallel)

[Packer]: https://www.packer.io/ "Packer by HashiCorp"
[Vagrant]: https://www.vagrantup.com/ "Vagrant"
[VirtualBox]: https://www.virtualbox.org/ "Oracle VM VirtualBox"
[HAXM]: https://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager
        "Intel&reg; Hardware Accelerated Execution Manager"

## Provisioned software tools

* VirtualBox Guest Additions
* `vagrant` user and its insecure public key
* ... and their dependencies

## How to create a box

From the terminal, invoke the following command:

	packer build xubuntu-15.04-minimal.json

and you will find a vagrant box file named `Xubuntu-15.04-amd64-minimal.box`
in the same directory after the command has succeeded.

Then you can add the box named `Xubuntu-15.04-amd64-minimal` to your box list
by the following command:

	vagrant box add Xubuntu-15.04-amd64-minimal.box --name Xubuntu-15.04-amd64-minimal

## Variants

* `ubuntu-15.04-desktop-minimal.json` - Ubuntu Desktop 15.04 
* `ubuntu-15.04-server-minimal.json` - Ubuntu Server 15.04
* `xubuntu-15.04-minimal.json` - Xubuntu 15.04


- - -

Copyright &copy; 2014, 2015 Upper Stream Software.

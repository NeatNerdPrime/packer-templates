# Packer templates for CentOS 5.11

Templates creating Vagrant boxes for CentOS 5.11 minimal installation (x86_64 and i386).

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
* curl
* sshd
* sudo
* rsync
* `vagrant` user and its insecure public key
* ... and their dependencies

## How to create a box

From the terminal, invoke the following command:

	packer build centos-5.11-x86_64-minimal.json

and you will find a vagrant box file named `CentOS-5.11-x86_64-minimal.box`
in the same directory after the command has succeeded.

Then you can add the box named `CentOS-5.11-x86_64-minimal` to your box list
by the following command:

	vagrant box add CentOS-5.11-x86_64-minimal.box --name CentOS-5.11-x86_64-minimal

## Variants

* `centos-5.11-x86_64-minimal.json` - CentOS 5.11 (x86_64) minimal installation
* `centos-5.11-i386-minimal.json` - CentOS 5.11 (i386) minimal installation

- - -

Copyright &copy; 2015 Upper Stream Software.

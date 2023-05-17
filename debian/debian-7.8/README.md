# Packer templates for Debian 7.8

Templates to create Vagrant boxes for Debian 7.8 (amd64).

## Prerequisites

* [Packer] v0.8.6+
* [Vagrant] v1.7.3+
* [VirtualBox]
	* Version 4.3.28+ for Windows
	* Version 4.3.28+ for Mac OS X (You may want to stay with 4.3.28 which allows [HAXM] to work in parallel.)

[HAXM]: https://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager
        "Intel&reg; Hardware Accelerated Execution Manager"
[Packer]: https://www.packer.io/ "Packer by HashiCorp"
[Vagrant]: https://www.vagrantup.com/ "Vagrant"
[VirtualBox]: https://www.virtualbox.org/ "Oracle VM VirtualBox"

## Provisioned software tools

* VirtualBox Guest Additions
* curl
* sshd
* sudo
* rsync
* `vagrant` user and its insecure public key

## How to create a box

From the terminal, invoke the following command:

	packer build debian-7.8.0-amd64-minimal.json

and you will find a vagrant box file named `Debian-7.8.0-amd64-minimal-v3.box`
in the same directory after the command has succeeded.

Then you can add the box named `Debian-7.8.0-amd64-minimal-v3` to your box list
by the following command:

	vagrant box add Debian-7.8.0-amd64-minimal-v3.box --name Debian-7.8.0-amd64-minimal-v3

## Variants

* `debian-7.8.0-amd64-minimal.json` - Debian 7.8 minimal installation
* `debian-7.8.0-amd64-docker.json` - provided with [Docker] and Kernel 3.10+ in addition to Debian 7.8 minimal installation.

[Docker]: https://www.docker.com/ "Docker - Build, Ship and Run Any App, Anywhere"

## Build parameters

The following parameters can be set at build time by supplying `-var` or `-var-file` command line options to `packer`:

* `root_password` - Password for `root` user.  Default value is `vagrant`.
* `vagrant_username` - User name used for run time.  Vagrant box is set for this user.  Default value is `vagrant`.
* `vagrant_password` - Password for `vagrant_username`.  Default value is `vagrant`.

- - -

Copyright &copy; 2015, 2016 Upper Stream Software.

# Packer templates for Ubuntu 14.04.5

Templates creating Vagrant boxes for Ubuntu 14.04.5 (x86_64).

## Prerequisites

* [Packer][] v0.6.1
* [Vagrant][] v1.6.5
* [VirtualBox][] Version 4.3.36 for Windows

[Packer]: https://www.packer.io/ "Packer by HashiCorp"
[Vagrant]: https://www.vagrantup.com/ "Vagrant"
[VirtualBox]: https://www.virtualbox.org/ "Oracle VM VirtualBox"

## Provisioned software tools

* VirtualBox Guest Additions
* `vagrant` user and its insecure public key
* ... and their dependencies

## How to create a box

From the terminal, invoke the following command:

    packer build ubuntu-14.04-server-minimal.json

and you will find a vagrant box file named `Ubuntu-14.04-server-amd64-minimal-v1404.5.20170520.box`
in the same directory after the command has succeeded.

Then you can add the box named `Ubuntu-14.04-server-amd64-minimal-v1404.5.20170520` to your box list
by the following command:

    vagrant box add Ubuntu-14.04-server-amd64-minimal-v1404.5.20170520.box --name Ubuntu-14.04-server-amd64-minimal-v1404.5.20170520

## Variants

* `ubuntu-14.04-desktop-minimal.json` - Ubuntu Desktop 14.04.5 LTS
* `ubuntu-14.04-server-minimal.json` - Ubuntu Server 14.04.5 LTS
* `xubuntu-14.04-minimal.json` - Xubuntu 14.04.5 LTS minimal installation

## Build parameter

The following parameter can be set at build time by supplying `-var` or `-var-file` command line options to `packer`:

* `headless` - Launch the virtual machine in headless mode if set to `true`.  Default value is `false`.

- - -

Copyright &copy; 2014, 2015, 2017 Upper Stream Software.

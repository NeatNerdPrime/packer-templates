# Packer templates for Arch Linux

Templates to create Vagrant boxes for Arch Linux.


## Prerequisites

* [Packer][] v1.1.0+
* [Vagrant][] v1.9.8+
* [VirtualBox][] Version 5.2.8+, on which Linux 4.15 can run
* [VMware][] Workstation v11.1.0+ / VMware Fusion v8.0+
* [ESXi][] (vSphere Hypervisor) v5.5+

[ESXi]: http://www.vmware.com/products/vsphere-hypervisor
    "Free VMware vSphere Hypervisor, Free Virtualization (ESXi)"
[Packer]: https://www.packer.io/ "Packer by HashiCorp"
[Vagrant]: https://www.vagrantup.com/ "Vagrant"
[VirtualBox]: https://www.virtualbox.org/ "Oracle VM VirtualBox"
[VMware]: http://www.vmware.com/
    "VMware Virtualization for Desktop &amp; Server, Application, Public &amp; Hybrid Clouds"


## How to create a box

### VirtualBox

From the terminal, invoke the following command for VirtualBox provider:

    packer build -only=virtualbox-iso archlinux-minimal.json

You will find a vagrant box file named `ArchLinux-x86_64-minimal-v20180401.0-virtualbox.box`
in the same directory after the command has succeeded.

Then you can add the box named `ArchLinux-x86_64-minimal-v20180401.0-virtualbox`
 to your box list by the following command:

    vagrant box add ArchLinux-x86_64-minimal-v20180401.0-virtualbox.box --name ArchLinux-x86_64-minimal-v20180401.0-virtualbox

### VMware

From the terminal, invoke the following command for VMware provider:

    packer build -only=vmware-iso archlinux-minimal.json

You will find a vagrant box file named `ArchLinux-x86_64-minimal-v20180401.0-vmware.box`
in the same directory after the command has succeeded.

Then you can add the box named `ArchLinux-x86_64-minimal-v20180401.0-vmware`
to your box list by the following command:

    vagrant box add ArchLinux-x86_64-minimal-v20180401.0-vmware.box --name ArchLinux-x86_64-minimal-v20180401.0-vmware

In the `output` directory you will also find a VM image that can be
directly imported from VMware.


## Building a VM image on ESXi

In order to build a VM image on ESXi, you need to provide the following
environment variables:

* `REMOTE_HOST` - ESXi host name or IP address
* `REMOTE_USERNAME` - ESXi login user name
* `REMOTE_PASSWORD` - ESXi login password
* `REMOTE_DATASTORE` - ESXi datastore name where a VM image will be
   created

You also have to enable SSH and VNC on ESXi host.

The following command will build a VM image on your ESXi:

    packer build -only=esxi-iso archlinux-minimal.json

(Note that created VM will be unregistered from your Inventory.)


## Variants

`sudo` is enabled with all variants.

* `packer build archlinux-minimal.json` - Arch Linux
* `packer build archlinux-docker.json` - Arch Linux with [Docker][]

[Docker]: https://www.docker.com/
    "Docker - Build, Ship and Run Any App, Anywhere"


## Build parameters

The following parameters can be set at build time by supplying `-var`
or `-var-file` command line options to `packer`:

* `vm_name` - VM name.  This also affects box file name and output
  directory name.
* `num_cpus` - Number of virtual CPUs.  Default value is 2.
* `mem_size` - RAM size of the created VM.  Default value is `512`
  which means 512MB.
* `disk_size` - Disk size of the created VM.  Default value is `40960`
  which means 40GB.
* `vagrant_username` - User name used for run time.  Vagrant box is set
  for this user.  Default value is `vagrant`.
* `vagrant_password` - Password for `vagrant_username`.  Default value
  is `vagrant`.
* `vagrant_group` - Group name that `vagrant_username` belongs to.
  Default value is `vagrant`.
* `headless` - Launch the virtual machine in headless mode if set to
  `true`.  Default value is `false`.


- - -

Copyright &copy; 2017, 2018 Upperstream Software.

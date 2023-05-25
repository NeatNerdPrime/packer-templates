# Packer templates for NetBSD 5.2.3

Templates to create Vagrant box for NetBSD 5.2.3 (amd64 and i386).

## Prerequisites

* [Packer] v0.7.2+
* [Vagrant] v1.7.2+
* [VirtualBox]
	* Version 4.3.28+ for Windows
	* Version 4.3.28+ for Mac OS X (You may want to stay with 4.3.28 which allows [HAXM] to work in parallel.)
* [VMware] Workstation v11.1.0+ / VMware Fusion v8.0+
* [ESXi] (vSphere Hypervisor) v5.5+

[ESXi]: http://www.vmware.com/products/vsphere-hypervisor
        "Free VMware vSphere Hypervisor, Free Virtualization (ESXi)"
[HAXM]: https://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager
        "Intel&reg; Hardware Accelerated Execution Manager"
[Packer]: https://www.packer.io/ "Packer by HashiCorp"
[Vagrant]: https://www.vagrantup.com/ "Vagrant"
[VirtualBox]: https://www.virtualbox.org/ "Oracle VM VirtualBox"
[VMware]: http://www.vmware.com/ "VMware Virtualization for Desktop &amp; Server, Application, Public &amp; Hybrid Clouds"

## Provisioned software tools

* sshd
* sudo
* ntpd
* rsync
* NFS client
* `vagrant` user and its insecure public key
* ... and their dependencies

## How to create a box

From the terminal, invoke the following command for VirtualBox provider:

    packer build -only=virtualbox-iso -var-file=vars-netbsd-5.2.3-amd64.json netbsd-5.2.3-minimal.json

or:

    packer build -only=vmware-iso -var-file=vars-netbsd-5.2.3-amd64.json netbsd-5.2.3-minimal.json

for VMware provider.
You will find a vagrant box file named `NetBSD-5.2.3-amd64-minimal-v3.2.0-virtualbox.box` or
`NetBSD-5.2.3-amd64-minimal-v3.2.0-vmware.box` respectively in the same directory after the command has succeeded.

Then you can add the box named `NetBSD-5.2.3-amd64-minimal-3.2.0` to your box list
by the following command (for example of VirtualBox provider):

    vagrant box add NetBSD-5.2.3-amd64-minimal-v3.2.0-virtualbox.box --name NetBSD-5.2.3-amd64-minimal-v3.2.0-virtualbox

## Default settings

These default settings are done by the file `Vagrantfile.NetBSD` which will be included in the box.
Users can override this setting by users' own `Vagrantfile`s.

### Synced Folder

Due to limitation of Vagrant's support for NetBSD, Synced Folder of this box is disabled by default.

### SSH Shell

Because Bash is not the standard shell for NetBSD, default shell for SSH connection of this box
is set to `/bin/ksh`.

## Building a VM image on ESXi

In order to build a VM image on ESXi, you need to provide the following environment variables:

* `REMOTE_HOST` - ESXi host name or IP address
* `REMOTE_USERNAME` - ESXi login user name
* `REMOTE_PASSWORD` - ESXi login password
* `REMOTE_DATASTORE` - ESXi datastore name where a VM image will be created

You also have to enable SSH and VNC on ESXi host.

The following command will build a VM image on your ESXi:

    packer build -only=esxi-iso -var-file=vars-netbsd-5.2.3-amd64.json netbsd-5.2.3-minimal.json

(Note that created VM will be unregistered from your Inventory.)

## Variants

* `packer build -var-file=vars-netbsd-5.2.3-amd64.json netbsd-5.2.3-minmal.json` - NetBSD 5.2.3 (amd64)
* `packer build -var-file=vars-netbsd-5.2.3-amd64.json netbsd-5.2.3-ansible.json` - NetBSD 5.2.3 + [Ansible] + [Testinfra] (amd64)
* `packer build -var-file=vars-netbsd-5.2.3-i386.json netbsd-5.2.3-minmal.json` - NetBSD 5.2.3 (i386)
* `packer build -var-file=vars-netbsd-5.2.3-i386.json netbsd-5.2.3-ansible.json` - NetBSD 5.2.3 + Ansible + Testinfra (i386)

[Ansible]: https://www.ansible.com/ "Ansible is Simple IT Automation"
[Testinfra]: https://testinfra.readthedocs.io/en/latest/ "Testinfra test your infrastructure &mdash; testinfra 1.1.3.dev24 documentation"

## Build parameters

The following parameters can be set at build time by supplying `-var` or `-var-file` command line options to `packer`:

* `vm_name` - VM name.  This also affects box file name and output directory name.
* `mem_size` - RAM size of the created VM.  Default value is `512` which means 512MB.
* `disk_size` - Disk size of the created VM.  Default value is `40960` which means 40GB.
* `ssh_user` - User name to login via SSH during build time.  Default value is `root`.
* `ssh_password` - SSH password for `ssh_user` during build time.  Default value is `vagrant`.
* `user_name` - User name during run time.  Vagrant box is set for this user.  Default value is `vagrant`.
* `user_password` - Password for `user_name`.  Default value is `vagrant`.
* `headless` - Launch the virtual machine in headless mode if set to `true`.  Default value is `false`.

- - -

Copyright &copy; 2015-2017 Upper Stream Software.

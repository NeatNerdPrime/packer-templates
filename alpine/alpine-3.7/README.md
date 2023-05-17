# Packer templates for Alpine Linux 3.7.0

Templates to create Vagrant boxes for Alpine Linux 3.7.0. (x86_64 and i686)

## Prerequisites

* [Packer][] v0.8.6+
* [Vagrant][] v1.7.2+
* [VirtualBox][]v5.0.32+, which can run Linux 4.9
* [VMware][] Workstation v11.1.0+ / VMware Fusion v8.0+
* [ESXi][] (vSphere Hypervisor) v5.5+

[ESXi]: http://www.vmware.com/products/vsphere-hypervisor
        "Free VMware vSphere Hypervisor, Free Virtualization (ESXi)"
[Packer]: https://www.packer.io/ "Packer by HashiCorp"
[Vagrant]: https://www.vagrantup.com/ "Vagrant"
[VirtualBox]: https://www.virtualbox.org/ "Oracle VM VirtualBox"
[VMware]: http://www.vmware.com/ "VMware Virtualization for Desktop &amp; Server, Application, Public &amp; Hybrid Clouds"

## Provisioned software tools

* sshd
* sudo
* chronyd (NTP daemon)
* rsync
* NFS (installed but not enabled)
* `vagrant` user and its insecure public key

## How to create a box

### VirtualBox

From the terminal, invoke the following command for VirtualBox provider:

    packer build -only=virtualbox-iso -var-file=vars-alpine-standard-3.7-x86_64.json alpine-3.7-minimal.json

You will find a vagrant box file named `Alpine-standard-3.7-x86_64-minimal-v7.0.20171202-virtualbox.box`
in the same directory after the command has succeeded.

Then you can add the box named `Alpine-standard-3.7-x86_64-minimal-v7.0.20171202-virtualbox` to your box list
by the following command:

    vagrant box add Alpine-standard-3.7-x86_64-minimal-v7.0.20171202-virtualbox.box --name Alpine-standard-3.7-x86_64-minimal-v7.0.20171202-virtualbox

### VMware

From the terminal, invoke the following command for VMware provider:

    packer build -only=vmware-iso -var-file=vars-alpine-standard-3.7-x86_64.json alpine-3.7-minimal.json

You will find a vagrant box file named `Alpine-standard-3.7-x86_64-minimal-v7.0.20171202-vmware.box`
in the same directory after the command has succeeded.

Then you can add the box named `Alpine-standard-3.7-x86_64-minimal-v7.0.20171202-vmware` to your box list
by the following command:

    vagrant box add Alpine-standard-3.7-x86_64-minimal-v7.0.20171202-vmware.box --name Alpine-standard-3.7-x86_64-minimal-v7.0.20171202-vmware

In the `output` directory you will also find a VM image that can be directly imported from VMware.

## Default settings

These default settings are done by the file `Vagrantfile.Alpine` which will be included in the box.
Users can override this setting by users' own `Vagrantfile`s.

### Synced Folder

Due to limitation of Vagrant's support for Alpine Linux, Synced Folder of this box is disabled by default.

### SSH Shell

Because Bash is not the standard shell for Alpine Linux, default shell for SSH connection of this box
is set to `/bin/ash`.

## Building a VM image on ESXi

In order to build a VM image on ESXi, you need to provide the following environment variables:

* `REMOTE_HOST` - ESXi host name or IP address
* `REMOTE_USERNAME` - ESXi login user name
* `REMOTE_PASSWORD` - ESXi login password
* `REMOTE_DATASTORE` - ESXi datastore name where a VM image will be created

You also have to enable SSH and VNC on ESXi host.

The following command will build a VM image on your ESXi:

    packer build -only=esxi-iso -var-file=vars-alpine-standard-3.7-x86_64.json alpine-3.7-minimal.json

(Note that created VM will be unregistered from your Inventory.)

## Variants

* `packer build -var-file=vars-alpine-standard-3.7-x86_64.json alpine-3.7-minimal.json` - Alpine Linux 3.7.0 (x86_64)
* `packer build -var-file=vars-alpine-standard-3.7-x86_64.json alpine-3.7-ansible.json` - Alpine Linux 3.7.0 with [Ansible] and [Testinfra] (x86_64)
* `packer build -var-file=vars-alpine-standard-3.7-x86_64.json alpine-3.7-docker.json` - Alpine Linux 3.7.0 with [Docker] + [Docker Compose] (x86_64)
* `packer build -var-file=vars-alpine-standard-3.7-x86_64.json alpine-3.7-dwm.json` - Alpine Linux 3.7.0 with [X.Org], [dwm], [dmenu], [st] and more tools (x86_64)
* `packer build -var-file=vars-alpine-standard-3.7-x86.json alpine-3.7-minimal.json` - Alpine Linux 3.7.0 (x86)
* `packer build -var-file=vars-alpine-standard-3.7-x86.json alpine-3.7-ansible.json` - Alpine Linux 3.7.0 with Ansible and Testinfra (x86)
* `packer build -var-file=vars-alpine-standard-3.7-x86.json alpine-3.7-dwm.json` - Alpine Linux 3.7.0 with X.Org, dwm, dmenu, st and more tools (x86)

[Ansible]: https://www.ansible.com/ "Ansible is Simple IT Automation"
[dmenu]: http://tools.suckless.org/dmenu/ "dmenu | suckless.org tools"
[Docker]: https://www.docker.com/ "Docker - Build, Ship and Run Any App, Anywhere"
[Docker Compose]: https://docs.docker.com/compose/ "Docker Compose - Docker Documentation"
[dwm]: http://dwm.suckless.org/ "suckless.org dwm - dynamic window manager"
[st]: http://st.suckless.org/ "suckless.org st - simple terminal"
[Testinfra]: https://testinfra.readthedocs.io/en/latest/ "Testinfra test your infrastructure &mdash; testinfra 1.9.1 documentation"
[X.Org]: https://www.x.org/wiki/ "X.Org"

## Optimised kernel for virtual machines

Instead of `vars-alpine-standard-3.7-x86*.json` files you can use `vars-alpine-virt-3.7-x86*.json`.
These files instruct to use ISO images with kernels optimised for virtual machines.

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
* `headless` - Launch the virtual machine in headless mode if set to `true`.  Default value is `false`.

- - -

Copyright &copy; 2017 Upper Stream Software.

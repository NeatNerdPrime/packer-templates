# Packer templates for openSUSE Leap 42.3

Templates to create Vagrant boxes for openSUSE Leap 42.3 (amd64).


## Prerequisites

* [Packer][] v0.8.6+
* [Vagrant][] v1.7.3+
* [VirtualBox][] Version 5.0.14+
* [VMware][] Workstation v11.1.0+ / VMware Fusion v8.0+
* [ESXi][] (vSphere Hypervisor) v5.5+

[ESXi]: http://www.vmware.com/products/vsphere-hypervisor
        "Free VMware vSphere Hypervisor, Free Virtualization (ESXi)"
[Packer]: https://www.packer.io/ "Packer by HashiCorp"
[Vagrant]: https://www.vagrantup.com/ "Vagrant"
[VirtualBox]: https://www.virtualbox.org/ "Oracle VM VirtualBox"
[VMware]: http://www.vmware.com/ "VMware Virtualization for Desktop &amp; Server, Application, Public &amp; Hybrid Clouds"


## Provisioned software tools

* VirtualBox Guest Additions or [open-vm-tools][]
* sshd
* sudo
* `vagrant` user and its insecure public key

[open-vm-tools]: https://github.com/vmware/open-vm-tools "Official repository of VMware open-vm-tools project"


## How to create a box

### VirtualBox

From the terminal, invoke the following command for VirtualBox provider:

    packer build -only=virtualbox-iso opensuse-leap-42.3-minimal.json

You will find a vagrant box file named `openSUSE-Leap-amd64-minimal-v42.3.20170730-virtualbox.box`
in the same directory after the command has succeeded.

Then you can add the box named `openSUSE-Leap-amd64-minimal-v42.3.20170730-virtualbox` to your box list
by the following command:

    vagrant box add openSUSE-Leap-amd64-minimal-v42.3.20170730-virtualbox.box --name openSUSE-Leap-amd64-minimal-v42.3.20170730-virtualbox

### VMware

From the terminal, invoke the following command for VMware provider:

    packer build -only=vmware-iso opensuse-leap-42.3-minimal.json

You will find a vagrant box file named `openSUSE-Leap-amd64-minimal-v42.3.20170730-vmware.box`
in the same directory after the command has succeeded.

Then you can add the box named `openSUSE-Leap-amd64-minimal-v42.3.20170730-vmware` to your box list
by the following command:

    vagrant box add openSUSE-Leap-amd64-minimal-v42.3.20170730-vmware.box --name openSUSE-Leap-amd64-minimal-v42.3.20170730-vmware

In the `output` directory you will also find a VM image that can be directly imported from VMware.


## Building a VM image on ESXi

In order to build a VM image on ESXi, you need to provide the following environment variables:

* `REMOTE_HOST` - ESXi host name or IP address
* `REMOTE_USERNAME` - ESXi login user name
* `REMOTE_PASSWORD` - ESXi login password
* `REMOTE_DATASTORE` - ESXi datastore name where a VM image will be created

You also have to enable SSH and VNC on ESXi host.

The following command will build a VM image on your ESXi:

    packer build -only=esxi-iso opensuse-leap-42.3-minimal.json

(Note that created VM will be unregistered from your Inventory.)


## Variants

* `opensuse-leap-42.3-minimal.json` - openSUSE Leap 42.3 minimal installation
* `opensuse-leap-42.3-ansible.json` - openSUSE Leap 42.3 with [Ansible][] and [Testinfra][]
* `opensuse-leap-42.3-docker.json` - openSUSE Leap 42.3 with [Docker][] and [Docker Compose][]
* `opensuse-leap-42.3-dwm.json` - openSUSE Leap 42.3 with [X.org][], [suckless][] tools, [ARandR][], and [xrdp][]
* `opensuse-leap-42.3-kde.json` - openSUSE Leap 42.3 with [KDE][], [ARandR][], and [xrdp][]

[Ansible]: https://www.ansible.com/ "Ansible is Simple IT Automation"
[ARandR]: https://christian.amsuess.com/tools/arandr/ "ARandR: Another XRandR GUI"
[Docker]: https://www.docker.com/ "Docker - Build, Ship, and Run Any App, Anywhere"
[Docker Compose]: https://docs.docker.com/compose/ "Docker Compose"
[KDE]: https://www.kde.org/ "KDE Community Home - KDE.org"
[suckless]: http://suckless.org/ "suckless.org software that sucks less"
[Testinfra]: https://testinfra.readthedocs.io/en/latest/ "Testinfra test your infrastructure &mdash; testinfra 1.6.4 documentation"
[X.org]: https://www.x.org/wiki/ "X.Org"
[xrdp]: http://www.xrdp.org/ "xrdp"


## Build parameters

The following parameters can be set at build time by supplying `-var` or `-var-file` command line options to `packer`:

* `vm_name` - VM name.  This also affects box file name and output directory name.
* `num_cpus` - Number of virtual CPUs.  Default value is 2.
* `mem_size` - RAM size of the created VM.  Default value is `512` which means 512MB.
* `disk_size` - Disk size of the created VM.  Default value is `51200` which means 50GB.
* `vagrant_username` - User name used for run time.  Vagrant box is set for this user.  Default value is `vagrant`.
* `vagrant_group` - Group name that `vagrant_username` belongs to.  Default value is `vagrant`.
* `vagrant_password` - Password for `vagrant_username`.  Default value is `vagrant`.
* `headless` - Launch the virtual machine in headless mode if set to `true`.  Default value is `false`.

- - -

Copyright &copy; 2017 Upper Stream Software.

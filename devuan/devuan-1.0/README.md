# Packer templates for Devuan 1.0.0

Templates to create Vagrant boxes for Devuan 1.0.0 (amd64).


## Prerequisites

* [Packer][] v0.8.6+
* [Vagrant][] v1.7.3+
* [VirtualBox][]
	* Version 4.3.28+ for Windows
	* Version 4.3.28+ for Mac OS X (You may want to stay with 4.3.28 which allows [HAXM] to work in parallel.)
* [VMware][] Workstation v11.1.0+ / VMware Fusion v8.0+
* [ESXi][] (vSphere Hypervisor) v5.5+

[ESXi]: http://www.vmware.com/products/vsphere-hypervisor
        "Free VMware vSphere Hypervisor, Free Virtualization (ESXi)"
[HAXM]: https://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager
        "Intel&reg; Hardware Accelerated Execution Manager"
[Packer]: https://www.packer.io/ "Packer by HashiCorp"
[Vagrant]: https://www.vagrantup.com/ "Vagrant"
[VirtualBox]: https://www.virtualbox.org/ "Oracle VM VirtualBox"
[VMware]: http://www.vmware.com/ "VMware Virtualization for Desktop &amp; Server, Application, Public &amp; Hybrid Clouds"


## Provisioned software tools

* VirtualBox Guest Additions or [open-vm-tools][]
* sshd
* sudo
* rsync
* `vagrant` user and its insecure public key

[open-vm-tools]: https://github.com/vmware/open-vm-tools "Official repository of VMware open-vm-tools project"


## How to create a box

### VirtualBox

From the terminal, invoke the following command for VirtualBox provider:

    packer build -only=virtualbox-iso devuan-1.0-amd64-minimal.json

You will find a vagrant box file named `Devuan-1.0-amd64-minimal-v1.0.20170719-virtualbox.box`
in the same directory after the command has succeeded.

Then you can add the box named `Devuan-1.0-amd64-minimal-v1.0.20170719-virtualbox` to your box list
by the following command:

    vagrant box add Devuan-1.0-amd64-minimal-v1.0.20170719-virtualbox.box --name Devuan-1.0-amd64-minimal-v1.0.20170719-virtualbox

### VMware

From the terminal, invoke the following command for VMware provider:

    packer build -only=vmware-iso devuan-1.0-amd64-minimal.json

You will find a vagrant box file named `Devuan-1.0-amd64-minimal-v1.0.20170719-vmware.box`
in the same directory after the command has succeeded.

Then you can add the box named `Devuan-1.0-amd64-minimal-v1.0.20170719-vmware` to your box list
by the following command:

    vagrant box add Devuan-1.0-amd64-minimal-v1.0.20170719-vmware.box --name Devuan-1.0-amd64-minimal-v1.0.20170719-vmware

In the `output` directory you will also find a VM image that can be directly imported from VMware.


## Building a VM image on ESXi

In order to build a VM image on ESXi, you need to provide the following environment variables:

* `REMOTE_HOST` - ESXi host name or IP address
* `REMOTE_USERNAME` - ESXi login user name
* `REMOTE_PASSWORD` - ESXi login password
* `REMOTE_DATASTORE` - ESXi datastore name where a VM image will be created

You also have to enable SSH and VNC on ESXi host.

The following command will build a VM image on your ESXi:

    packer build -only=esxi-iso devuan-1.0-amd64-minimal.json

(Note that created VM will be unregistered from your Inventory.)


## Variants

* `devuan-1.0-amd64-minimal.json` - Devuan 1.0 minimal installation
* `devuan-1.0-amd64-docker.json` - Devuan 1.0 + [Docker][] + [Docker Compose][]
* `devuan-1.0-amd64-xfce.json` - Devuan 1.0 with [Xfce][] + [xrdp][]
* `devuan-1.0-amd64-xorg.json` - Devuan 1.0 with [X.org][], [suckless][] tools, [ARandR][], and [xrdp][]

[ARandR]: https://christian.amsuess.com/tools/arandr/ "ARandR: Another XRandR GUI"
[Docker]: https://www.docker.com/ "Docker - Build, Ship, and Run Any App, Anywhere"
[Docker Compose]: https://docs.docker.com/compose/ "Docker Compose"
[suckless]: http://suckless.org/ "suckless.org software that sucks less"
[X.org]: https://www.x.org/wiki/ "X.Org"
[Xfce]: http://www.xfce.org/ "Xfce Desktop Environment"
[xrdp]: http://www.xrdp.org/ "xrdp"


## Installer ISO images

Optional var files are provided to instruct to use an alternative installer CD image or DVD image, i.e.,
`vars-devuan-1.0-amd64-CD.json` instructs to use `devuan_jessie_1.0.0_amd64_CD.iso` while
`vars-devuan-1.0-amd64-DVD.json` does `devuan_jessie_1.0.0_amd64_DVD.iso`.
Without using these var files, `devuan-1.0-amd64-*.json` templates use `devuan_jessie_1.0.0_amd64_NETINST.iso`.

Depending on situation you can specify the var file on the command line:

    packer build -var-file=vars-devuan-1.0-amd64-CD.json devuan-1.0-amd64-minimal.json

or

    packer build -var-file=vars-devuan-1.0-amd64-DVD.json devuan-1.0-amd64-minimal.json

It is recommended to use "jigdo" to download large iso image file and put it in `iso` directory.  Templates
instruct `packer` to use the image file rather than downloading an image from a mirror site.


## Build parameters

The following parameters can be set at build time by supplying `-var` or `-var-file` command line options to `packer`:

* `vm_name` - VM name.  This also affects box file name and output directory name.
* `mem_size` - RAM size of the created VM.  Default value is `512` which means 512MB.
* `disk_size` - Disk size of the created VM.  Default value is `51200` which means 50GB.
* `root_password` - Password for `root` user.  Default value is `vagrant`.
* `vagrant_username` - User name used for run time.  Vagrant box is set for this user.  Default value is `vagrant`.
* `vagrant_group` - Group name that `vagrant_username` belongs to.  Default value is `vagrant`.
* `vagrant_password` - Password for `vagrant_username`.  Default value is `vagrant`.
* `headless` - Launch the virtual machine in headless mode if set to `true`.  Default value is `false`.

- - -

Copyright &copy; 2017 Upper Stream Software.

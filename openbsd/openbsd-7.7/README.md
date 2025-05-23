# Packer templates for OpenBSD 7.7

Templates to create Vagrant boxes for OpenBSD 7.7 (amd64, i386, and
arm64).

## Prerequisites

* [Packer][] v1.10+
* [Vagrant][] v2.4+
* [VirtualBox][] v7.0+
* [VMware][] Workstation v17.0+ / VMware Fusion v13.0+
* [ESXi][] (vSphere Hypervisor) v7.0+
* [QEMU][] version 4.2+ / [libvirt][] 6.0+
* [Hyper-V][] on Windows 10
* [Parallels][] Desktop 19+

[ESXi]:
  http://www.vmware.com/products/vsphere-hypervisor
  "Free VMware vSphere Hypervisor, Free Virtualization (ESXi)"
[Hyper-V]:
  https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/about/
  "Introduction to Hyper-V on Windows 10 | Microsoft Docs"
[libvirt]:
  https://libvirt.org/ "libvirt: The virtualization API"
[Packer]:
  https://www.packer.io/ "Packer by HashiCorp"
[Parallels]:
  https://www.parallels.com/products/desktop/ "Run Windows on Mac - Parallels Desktop 19 Virtual Machine for Mac"
[QEMU]:
  https://www.qemu.org/ "QEMU"
[Vagrant]:
  https://www.vagrantup.com/ "Vagrant"
[VirtualBox]:
  https://www.virtualbox.org/ "Oracle VM VirtualBox"
[VMware]:
  http://www.vmware.com/
  "VMware Virtualization for Desktop &amp; Server, Application, Public &amp; Hybrid Clouds"

## Provisioned software tools

* sshd
* rsync
* `vagrant` user and its insecure public key

## How to create a box

### VirtualBox

From the terminal, invoke the following command for VirtualBox provider:

    packer build -only=virtualbox-iso.default openbsd-7.7-minimal.pkr.hcl

You will find a vagrant box file named
`OpenBSD-7.7-minimal-v7.7.20250428-amd64-virtualbox.box` in the same
directory after the command has succeeded.

Then you can add the box named `OpenBSD-7.7-minimal-v7.7.20250428` to
your box list by the following command:

    vagrant box add OpenBSD-7.7-minimal-v7.7.20250428-amd64-virtualbox.box --name OpenBSD-7.7-minimal-v7.7.20250428 --provider virtualbox

VirtualBox build intends to create amd64 box and i386 box on amd64 host.

### VMware

From the terminal, invoke the following command for VMware provider:

    packer build -only=vmware-iso.default openbsd-7.7-minimal.pkr.hcl

You will find a vagrant box file named
`OpenBSD-7.7-minimal-v7.7.20250428-amd64-vmware.box` in the same
directory after the command has succeeded.

Then you can add the box named `OpenBSD-7.7-minimal-v7.7.20250428` to
your box list by the following command:

    vagrant box add OpenBSD-7.7-minimal-v7.7.20250428-amd64-vmware.box --name OpenBSD-7.7-minimal-v7.7.20250428 --provider vmware_desktop

VMware build intends to create amd64 and i386 boxes on amd64 host, and
arm64 box on Apple Silicon Mac host.

### ESXi

In order to build a VM image on ESXi, you need to provide the following
environment variables:

* `ESXI_REMOTE_HOST` - ESXi host name or IP address
* `ESXI_REMOTE_USERNAME` - ESXi login user name
* `ESXI_REMOTE_PASSWORD` - ESXi login password
* `ESXI_REMOTE_DATASTORE` - ESXi datastore name where a VM image will be
  created

You also have to enable SSH on ESXi host.

The following command will build a VM image on your ESXi:

    packer build -only=vmware-iso.esxi openbsd-7.7-minimal.pkr.hcl

(Note that created VM will be unregistered from your Inventory.)

When you create a box on ESXi host version prior to 6.7, you need to
enable VNC on the host and need to disable Packer's VNC over WebSocket
feature by adding `-var esxi_vnc_over_websocket=false` parameter:

    packer build -only=vmware-iso.esxi -var esxi_vnc_over_websocket=false openbsd-7.7-minimal.pkr.hcl

### QEMU/libvirt

From the terminal, invoke the following command for Libvirt provider:

    packer build -only=qemu.default openbsd-7.7-minimal.pkr.hcl

You will find a vagrant box file named
`OpenBSD-7.7-minimal-v7.7.20250428-amd64-libvirt.box` in the same
directory after the command has succeeded.

Then you can add the box named `OpenBSD-7.7-minimal-v7.7.20250428`
to your box list by the following command:

    vagrant box add OpenBSD-7.7-minimal-v7.7.20250428-amd64-libvirt.box --name OpenBSD-7.7-minimal-v7.7.20250428 --provider libvirt

In the `output` directory you will also find a VM image that can be
directly imported to QEMU.

QEMU/libvirt build intends to create amd64 and i386 boxes on amd64
Linux host.

### Hyper-V

From the terminal, invoke the following command for Hyper-V provider:

    packer build -only=hyperv-iso.default openbsd-7.7-minimal.pkr.hcl

You will find a vagrant box file named
`OpenBSD-7.7-minimal-v7.7.20250428-amd64-hyperv.box` in the same
directory after the command has succeeded.

Then you can add the box named `OpenBSD-7.7-minimal-v7.7.20250428` to
your box list by the following command:

    vagrant box add OpenBSD-7.7-minimal-v7.7.20250428-amd64-hyperv.box --name OpenBSD-7.7-minimal-v7.7.20250428 --provider hyperv

Hyper-V build intends to create amd64 and i386 boxes on Windows host.

### Parallels

From the terminal, invoke the following command for Parallels provider:

    packer build -only=parallels-iso.default -var-file vars-openbsd-7.7-arm64.pkrvars.hcl openbsd-7.7-minimal.pkr.hcl

You will find a vagrant box file named
`OpenBSD-7.7-minimal-v7.7.20250428-arm64-parallels.box` in the same
directory after the command has succeeded.

Then you can add the box named `OpenBSD-7.7-minimal-v7.7.20250428` to
your box list by the following command:

    vagrant box add OpenBSD-7.7-minimal-v7.7.20250428-arm64-parallels.box --name OpenBSD-7.7-minimal-v7.7.20250428 --provider parallels

Parallels build intends to create arm64 box on Apple Silicon Mac host.

## Default settings

These default settings below are done by the file `Vagrantfile.OpenBSD-7.5+`
which will be included in the box.  Users can override this setting by
users' own `Vagrantfile`s.

### Synced Folder

Due to Vagrant limitation of OpenBSD support, Synced Folder of this box
is disabled by default.  You can still use other types of synced
folders:

* NFS on non-Windows hosts
* RSync on any hosts.

Because `doas` command is installed in this box instead of `sudo`,
rsync path is set to `doas rsync` for `/vagrant` sync'ed folder by
default.  You still need to add `rsync__rsync_path: "doas rsync"`
option to your sync'ed folder settings when you choose rsync type
sync'ed folder for other locations than `/vagrant`.

### SSH Shell

Because Bash is not the standard shell for OpenBSD, default shell for
non-interactive SSH connection of this box is set to `/bin/sh`.

### Substituting a user during SSH command execution

Because `doas` command is installed in this box instead of `sudo`,
command for SSH command execution in privileged mode is configured to
use `doas`.

## Variants

* `openbsd-7.7-minimal.pkr.hcl` - OpenBSD 7.7
* `openbsd-7.7-x11.pkr.hcl` - OpenBSD 7.7 with [X11][]
* `openbsd-7.7-dwm.pkr.hcl` - OpenBSD 7.7 with X11 + [dwm][] +
  [dmenu][] + [st][] + Xenodm
* `openbsd-7.7-xfce.pkr.hcl` - OpenBSD 7.7 with [Xfce][] + Xenodm

While `openbsd-7.7-*.pkr.hcl` templates generate amd64 boxes by
default, using `vars-openbsd-7.7-arm64.pkrvars.hcl` generates arm64
boxes:

    packer build -var-file=vars-openbsd-7.7-arm64.pkrvars.hcl openbsd-7.7-minimal.pkr.hcl

and using `vars-openbsd-7.7-i386.pkrvars.hcl` generates i386 boxes:

    packer build -var-file=vars-openbsd-7.7-i386.pkrvars.hcl openbsd-7.7-minimal.pkr.hcl

[dmenu]: http://tools.suckless.org/dmenu/ "dmenu | suckless.org tools"
[dwm]: http://dwm.suckless.org/
  "suckless.org dwm - dynamic window manager"
[st]: http://st.suckless.org/ "suckless.org st - simple terminal"
[X11]: https://www.x.org/wiki/ "X.Org"
[Xfce]: http://www.xfce.org/ "Xfce Desktop Environment"

## Build parameters

The following parameters can be set at build time by supplying `-var` or
`-var-file` command line options to `packer`:

* `boot_wait` - Override `boot_wait` default setting, which is `20s`.
* `disk_size` - Disk size of the created VM.  Defaults to `40960`,
  which means 40GB.
* `esxi_hardware_version` - Virtual hardware version of ESXi box.
  Defaults to `19`.
* `esxi_remote_datastore` - ESXi datastore name where a VM image will
  be created.
* `esxi_remote_host` - ESXi host name or IP address.
* `esxi_remote_password` - ESXi login password.
* `esxi_remote_username` - ESXi login user name.
* `esxi_vnc_over_websocket` - Controls whether or not to use VNC over
  WebSocket feature for ESXi.  Defaults to `true`.  Set to `false` if
  your ESXi host version is prior to 6.7 which supports VNC server.
* `headless` - Launch the virtual machine in headless mode if set to
  `true`.  Defaults to `false`.
* `hyperv_switch_name` - Network switch name for Hyper-V provider.
  Defaults to `Default Switch`.
* `mem_size` - RAM size of the created VM.  Defaults to `512`, which
  means 512MB.
* `num_cpus` - Number of virtual CPUs.  Defaults to 2.
* `package_arch` - Architecture name for binary packages.  Defaults
  to `amd64`.
* `package_server` - URL to download packages from.  Defaults to
  `http://cloudflare.cdn.openbsd.org/pub/OpenBSD/`.
* `root_password` - Password for `root_username`.  Defaults to
  `vagrant`.  Set `sensitive` to `true` unless the assigned password
  remains `vagrant`.
* `root_username` - User name used for root account.  Vagrant box is
  set for this user.  Defaults to `vagrant`.
* `vagrant_group` - Group name that `vagrant_username` belongs to.
  Defaults to `vagrant`.
* `vagrant_password` - Password for `vagrant_username`.  Defaults to
  `vagrant`.  Set `sensitive` to `true` unless the assigned password
  remains `vagrant`.
* `vagrant_username` - User name used for runtime.  Vagrant box is set
  for this user.  Defaults to `vagrant`.
* `vm_name` - VM name.  This also affects box file name and output
  directory name.
* `vmware_hardware_version` - Virtual hardware version of VMware box.
  Defaults to `13`.

- - -

Copyright &copy; 2025 Upperstream.

# Packer templates for Devuan 6.1

Templates to create Vagrant boxes for Devuan 6.1 Excalibur (amd64).

## Prerequisites

* [Packer][] v1.8.5+
* [Vagrant][] v2.3.4+
* [VirtualBox][] Version 7.2.6+
* [VMware][] Workstation v17.0+ / VMware Fusion v13.0+
* [ESXi][] (vSphere Hypervisor) v5.5+
* [QEMU][] version 4.2+ / [libvirt][] 6.0+
* [Hyper-V][] on Windows 10
* [Parallels][] Desktop 18+

[ESXi]: http://www.vmware.com/products/vsphere-hypervisor
    "Free VMware vSphere Hypervisor, Free Virtualization (ESXi)"
[Hyper-V]: https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/about/
    "Introduction to Hyper-V on Windows 10 | Microsoft Docs"
[libvirt]: https://libvirt.org/ "libvirt: The virtualization API"
[Packer]: https://www.packer.io/ "Packer by HashiCorp"
[Parallels]: https://www.parallels.com/products/desktop/ "Run Windows on Mac - Parallels Desktop 18 Virtual Machine for Mac"
[QEMU]: https://www.qemu.org/ "QEMU"
[Vagrant]: https://www.vagrantup.com/ "Vagrant"
[VirtualBox]: https://www.virtualbox.org/ "Oracle VM VirtualBox"
[VMware]: http://www.vmware.com/
    "VMware Virtualization for Desktop &amp; Server, Application, Public &amp; Hybrid Clouds"

## Provisioned software tools

* VirtualBox Guest Additions, [open-vm-tools][], or Parallels Tools
* sshd
* sudo
* `vagrant` user and its insecure public key

[open-vm-tools]: https://github.com/vmware/open-vm-tools
    "Official repository of VMware open-vm-tools project"

## How to create a box

### VirtualBox

From the terminal, invoke the following command for VirtualBox provider:

    packer build -only=virtualbox-iso.default devuan-6-minimal.pkr.hcl

You will find a vagrant box file named `Devuan-6-amd64-minimal-v6.1.20260102-virtualbox.box`
in the same directory after the command has succeeded.

Then you can add the box named `Devuan-6-amd64-minimal-v6.1.20260102`
to your box list by the following command:

    vagrant box add Devuan-6-amd64-minimal-v6.1.20260102-virtualbox.box \
      --name Devuan-6-amd64-minimal-v6.1.20260102 --provider virtualbox

### VMware

From the terminal, invoke the following command for VMware provider:

    packer build -only=vmware-iso.default devuan-6-minimal.pkr.hcl

You will find a vagrant box file named `Devuan-6-amd64-minimal-v6.1.20260102-vmware.box`
in the same directory after the command has succeeded.

Then you can add the box named `Devuan-6-amd64-minimal-v6.1.20260102`
to your box list by the following command:

    vagrant box add Devuan-6-amd64-minimal-v6.1.20260102-vmware.box \
      --name Devuan-6-amd64-minimal-v6.1.20260102 --provider vmware_desktop

In the `output` directory you will also find a VM image that can be
directly imported from VMware.

### ESXi

In order to build a VM image on ESXi, you need to provide the following
environment variables:

* `ESXI_REMOTE_HOST` - ESXi host name or IP address
* `ESXI_REMOTE_USERNAME` - ESXi login user name
* `ESXI_REMOTE_PASSWORD` - ESXi login password
* `ESXI_REMOTE_DATASTORE` - ESXi datastore name where a VM image will
  be created

You also have to enable SSH and VNC on ESXi host.

The following command will build a VM image on your ESXi:

    packer build -only=vmware-iso.esxi devuan-6-minimal.pkr.hcl

(Note that created VM will be unregistered from your Inventory.)

### Hyper-V

From the terminal, invoke the following command for Hyper-V provider:

    packer build -only=hyperv-iso.default devuan-6-minimal.pkr.hcl

You will find a vagrant box file named
`Devuan-6-amd64-minimal-v6.1.20260102-hyperv.box` in the same
directory after the command has succeeded.

Then you can add the box named `Devuan-6-amd64-minimal-v6.1.20260102`
to your box list by the following command:

    vagrant box add Devuan-6-amd64-minimal-v6.1.20260102-hyperv.box \
      --name Devuan-6-amd64-minimal-v6.1.20260102 --provider hyperv

### Parallels

From the terminal, invoke the following command for Parallels provider:

    packer build -only=parallels-iso.default devuan-6-minimal.pkr.hcl

You will find a vagrant box file named
`Devuan-6-amd64-minimal-v6.1.20260102-parallels.box` in the same
directory after the command has succeeded.

Then you can add the box named `Devuan-6-amd64-minimal-v6.1.20260102`
to your box list by the following command:

    vagrant box add Devuan-6-amd64-minimal-v6.1.20260102-parallels.box \
      --name Devuan-6-amd64-minimal-v6.1.20260102 --provider parallels

Parallels build intends to create an amd64 VM on Apple Silicon Mac
device.

## Variants

* `devuan-6-minimal.pkr.hcl` - Devuan 6.1 Excalibur minimal
  installation
* `devuan-6-dwm.pkr.hcl` - Devuan 6.1 Excalibur with [X.org][],
  [suckless][] tools, [ARandR][], and [xrdp][]
* `devuan-6-desktop.pkr.hcl` - Devuan 6.1 Excalibur with [xrdp][] +
  various desktop environment such as:
  * `xfce` - [Xfce][] (default)
  * `cinnamon` [Cinnamon][]
  * `kde` - [KDE Plasma][]
  * `lxqt` - [LXQt][]
  * `mate` - [MATE][]

  Adding `-var 'desktop=xfce'` to the command line can specify the
  desktop environment.

[ARandR]: https://christian.amsuess.com/tools/arandr/
    "ARandR: Another XRandR GUI"
[Cinnamon]: https://projects.linuxmint.com/cinnamon/
    "Linux Mint Projects by linuxmint"
[KDE Plasma]: https://kde.org/plasma-desktop/ "KDE Plasma Desktop"
[LXQt]: https://lxqt-project.org/ "LXQt"
[MATE]: https://mate-desktop.org/ "MATE Desktop Environment"
[suckless]: http://suckless.org/ "suckless.org software that sucks less"
[X.org]: https://www.x.org/wiki/ "X.Org"
[Xfce]: http://www.xfce.org/ "Xfce Desktop Environment"
[xrdp]: http://www.xrdp.org/ "xrdp"

## Installer ISO images

Optional var files are provided to instruct to use an alternative
installer CD image or DVD image, i.e., `vars-devuan-6-amd64-CD.pkrvars.hcl`
instructs to use `devuan_excalibur_6.1.0_amd64_netinstall.iso` while
`vars-devuan-6-amd64-DVD.pkrvars.hcl` does `devuan_excalibur_6.1.0_amd64_desktop.iso`.
Without using these var files, `devuan-6-*.pkr.hcl` templates use
`devuan_excalibur_6.1.0_amd64_server.iso`.

Depending on situation you can specify the var file on the command line:

    packer build -var-file=vars-devuan-6-amd64-CD.pkrvars.hcl devuan-6-minimal.pkr.hcl

or

    packer build -var-file=vars-devuan-6-amd64-DVD.pkrvars.hcl devuan-6-minimal.pkr.hcl

## Build parameters

The following parameters can be set at build time by supplying `-var`
or `-var-file` command line options to `packer`:

* `boot_wait` - Override `boot_wait` default setting, which is `10s`.
* `desktop` - Specify the desktop environment to install.  Defaults to
  `xfce`.  (Only valid for `devuan-6-desktop.pkr.hcl` variant)
* `disk_size` - Disk size of the created VM.  Defaults to `51200`,
  which means 50GB.
* `esxi_boot_mode` - Boot mode for ESXi VM, `bios` or `efi`.  Defaults
  to `bios`.
* `esxi_vhv_enabled` - Instruct whether nested virtualisation is
  enabled for ESXi VM.  Defaults to `TRUE`.
* `esxi_vnc_over_websocket` - Controls whether or not to use VNC over
  WebSocket feature for ESXi.  Defaults to `true`.  Set to `false` if
  your ESXi host version is prior to 6.7 which supports VNC server.
* `headless` - Launch the virtual machine in headless mode if set to
  `true`.  Defaults to `false`.
* `hyperv_boot_mode` - Boot mode for Hyper-V VM, `bios` or `efi`.
  Defaults to `bios`.
* `hyperv_switch_name` - Network switch name on Packer Hyper-V builder.
  Defaults to `Default Switch`.
* `mem_size` - RAM size of the created VM.  Defaults to `1024`, `1536`
  for `dwm` variant, and `2048` for `xfce` variant.
* `num_cpus` - The number of CPUs of the VM.  Defaults to `2`.
* `parallels_boot_mode` - Boot mode for Parallels VM, `bios` or `efi`.
  Defaults to `efi`.
* `qemu_accelerator` - QEMU accelerator name for QEMU VM.  Defaults to
  `kvm`.
* `qemu_boot_mode` - Boot mode for QEMU VM, `bios` or `efi`.  Defaults
  to `bios`.
* `qemu_display` - What QEMU `-display` option to use.  Defaults to an
  empty string.
* `qemu_use_default_display` - Determines to pass a `-display` option
  to QEMU or not.  Defaults to `false`.
* `root_password` - Password for `root` user.  Defaults to
  `vagrant`.
* `ssh_name` - User name to connect VM via SSH during VM build.
  Defaults to `vagrant`.
* `ssh_pass` - Password to connect VM via SSH during VM build.  Defaults
  to `vagrant`.
* `ssh_timeout` - Timeout for SSH connection.  Defaults to `60m`.
* `vagrant_group` - Group name that `vagrant_username` belongs to.
  Defaults to `vagrant`.
* `vagrant_username` - User name used for run time.  Vagrant box is set
  for this user.  Defaults to `vagrant`.
* `vagrant_password` - Password for `vagrant_username`.  Default value
  is `vagrant`.
* `virtualbox_boot_mode` - Boot mode for VirtualBox VM, `bios` or
  `efi`.  Defaults to `bios`.
* `virtualbox_version` - VirtualBox Guest Additions version number.
  Defaults to `7.2.6`.
* `vm_name` - Overrides the default VM name.
* `vmware_boot_mode` - Boot mode for VMware VM, `bios` or `efi`.
  Defaults to `bios`.
* `vmware_network` - Network type of VMware VM.  Defaults to `nat`.
* `vmware_vhv_enabled` - Instruct whether nested virtualisation is
  enabled for VMware VM.  Defaults to `FALSE`.

- - -

Copyright &copy; 2026 Upperstream Software.

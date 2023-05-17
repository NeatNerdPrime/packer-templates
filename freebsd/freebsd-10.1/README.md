# Packer templates for FreeBSD 10.1-RELEASE

Version 10.1.3.

Templates to create Vagrant boxes for FreeBSD 10.1-RELEASE (amd64 and i386).

## Prerequisites

* [Packer] v0.8.6+
* [Vagrant] v1.7.2+
* [VirtualBox]
	* Version 4.3.28+ for Windows
	* Version 4.3.28+ for Mac OS X (You may want to stay with 4.3.28 which allows [HAXM] to work in parallel.)

[Packer]: https://www.packer.io/ "Packer by HashiCorp"
[Vagrant]: https://www.vagrantup.com/ "Vagrant"
[VirtualBox]: https://www.virtualbox.org/ "Oracle VM VirtualBox"
[HAXM]: https://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager
        "Intel&reg; Hardware Accelerated Execution Manager"

## Provisioned software tools

* curl
* sshd
* sudo
* rsync
* smbclient
* `vagrant` user and its insecure public key
* NFS client enabled
* ntpd enabled
* ... and their dependencies

VirtualBox Guest Additions package is no longer installed on this box since version 2.
Instead, ntpd is enabled by default.

## How to create a box

From the terminal, invoke the following command:

	packer build freebsd-10.1-release-amd64.json

and you will find a vagrant box file named `FreeBSD-10.1-RELEASE-amd64-v10.1.3.box`
in the same directory after the command has succeeded.

Then you can add the box named `FreeBSD-10.1-RELEASE-amd64-v10.1.3` to your box list
by the following command:

	vagrant box add FreeBSD-10.1-RELEASE-amd64-v10.1.3.box --name FreeBSD-10.1-RELEASE-amd64-v10.1.3

## Default settings

These default settings are done by the file `Vagrantfile.FreeBSD-10` which will be included in the box.
Users can override this setting by users' own `Vagrantfile`s.

### Synced Folder

Due to Vagrant limitation for FreeBSD guest, VirtualBox Synced Folder is disabled by default.
You can still use other types of synced folders:

* NFS on non-Windows hosts
* RSync on any hosts.

SMB synced folder is not supported for FreeBSD guest.

### SSH Shell

Because Bash is not the standard shell for FreeBSD, default shell for SSH connection of this box
is set to `/bin/sh`.

## Variants

* `freebsd-10.1-release-amd64.json` - FreeBSD 10.1-RELEASE (amd64)
* `freebsd-10.1-release-i386.json` - FreeBSD 10.1-RELEASE (i386)

## Build parameters

The following parameters can be set at build time by supplying `-var` or `-var-file` command line options to `packer`:

* `mem_size` - RAM size of the created VM.  Default value is `512` which means 1GB.
* `disk_size` - Disk size of the created VM.  Default value is `40960` which means 50GB.

- - -

Copyright &copy; 2016 Upper Stream Software.

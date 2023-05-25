# Packer templates for FreeBSD 10.3-RELEASE

Templates to create Vagrant boxes for FreeBSD 10.3-RELEASE (amd64 and i386).

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

## How to create a box

From the terminal, invoke the following command:

	packer build freebsd-10.3-release-amd64-minimal.json

and you will find a vagrant box file named `FreeBSD-10.3-RELEASE-amd64-minimal-v10.3.1.box`
in the same directory after the command has succeeded.

Then you can add the box named `FreeBSD-10.3-RELEASE-amd64-minimal-v10.3.1` to your box list
by the following command:

	vagrant box add FreeBSD-10.3-RELEASE-amd64-minimal-v10.3.1.box --name FreeBSD-10.3-RELEASE-amd64-minimal-v10.3.1

## Default settings

These default settings are done by the file `Vagrantfile.FreeBSD-10.3` which will be included in the box.
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

* `packer build -var-file=vars-freebsd-10.3-amd64.json freebsd-10.3-release-minimal.json` - FreeBSD 10.3-RELEASE (amd64)
* `packer build -var-file=vars-freebsd-10.3-amd64.json freebsd-10.3-release-ansible.json` - FreeBSD 10.3-RELEASE + [Ansible] + [Testinfra] (amd64)
* `packer build -var-file=vars-freebsd-10.3-amd64.json freebsd-10.3-release-docker.json` - FreeBSD 10.3-RELEASE + [Docker] + [Docker Compose] (amd64)
* `packer build -var-file=vars-freebsd-10.3-i386.json freebsd-10.3-release-minimal.json` - FreeBSD 10.3-RELEASE (i386)
* `packer build -var-file=vars-freebsd-10.3-i386.json freebsd-10.3-release-ansible.json` - FreeBSD 10.3-RELEASE + Ansible + Testinfra (i386)

[Ansible]: https://www.ansible.com/ "Ansible is Simple IT Automation"
[Docker]: https://www.docker.com/ "Docker - Build, Ship and Run Any App, Anywhere"
[Docker Compose]: https://docs.docker.com/compose/ "Docker Compose - Docker Documentation"
[Testinfra]: https://testinfra.readthedocs.io/en/latest/ "Testinfra test your infrastructure &mdash; testinfra 1.4.1 documentation"

## Build parameters

The following parameters can be set at build time by supplying `-var` or `-var-file` command line options to `packer`:

* `mem_size` - RAM size of the created VM.  Default value is `512` which means 1GB.
* `disk_size` - Disk size of the created VM.  Default value is `40960` which means 50GB.

- - -

Copyright &copy; 2016 Upper Stream Software.

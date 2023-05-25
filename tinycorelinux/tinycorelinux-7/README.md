# Packer templates for Tiny Core Linux v7.2

Templates to create Vagrant box for Tiny Core Linux v7.2. (x86_64 and x86)

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

* sshd
* sudo
* NFS (installed but not enabled)
* `tc` user as a Vagrant user and its insecure public key

## How to create a box

From the terminal, invoke the following command:

	packer build -var-file=vars-corepure64-7.json tc-7-minimal.json

and you will find a vagrant box file named `CorePure64-7-minimal-v7.2.0.box`
in the same directory after the command has succeeded.

Then you can add the box named `CorePure64-7-minimal-v7.2.0` to your box list
by the following command:

	vagrant box add CorePure64-7-minimal-v7.2.0.box --name CorePure64-7-minimal-v7.2.0

## Default settings

These default settings are done by the file `Vagrantfile.tc` which will be included in the box.
Users can override this setting by users' own `Vagrantfile`s.

### Synced Folder

Due to limitation of VirtualBox's support for Tiny Core Linux support, Synced Folder of this box is disabled by default.

### SSH Shell

Because Bash is not the standard shell for Tiny Core Linux, default shell for SSH connection of this box
is set to `/bin/ash`.

### SSH User

Since `tc` is the default user of Tiny Core Linux, this box is configured that `tc` is a Vagrant user by default.

## Variants

* x86_64
    * `packer build -var-file=vars-corepure64-7.json tc-7-minimal.json` - CorePure 64 v7.2 (x86_64)
    * `packer build -var-file=vars-corepure64-7.json tc-7-compiletc.json` - CorePure 64 v7.2 (x86_64) with build tools
    * `packer build -var-file=vars-corepure64-7.json tc-7-ansible.json` - CorePure 64 v7.2 (x86_64) with [Ansible] and [Testinfra]
    * `packer build -var-file=vars-tinycorepure64-7.json tc-7-x11.json` - TinyCorePure 64 v7.2 (x86_64)
    * `packer build -var-file=vars-tinycorepure64-7.json tc-7-compiletc+x11.json` - TinyCorePure 64 v7.2 (x86_64) with build tools
* x64
    * `packer build -var-file=vars-core-7.json tc-7.json-minimal.json` - Core v7.2 (x86)
    * `packer build -var-file=vars-core-7.json tc-7.json-compiletc.json` - Core v7.2 (x86) with build tools
    * `packer build -var-file=vars-core-7.json tc-7.json-ansible.json` - Core v7.2 (x86) with Ansible and Testinfra
    * `packer build -var-file=vars-tinycore-7.json tc-7.json-x11.json` - TinyCore v7.2 (x86)
    * `packer build -var-file=vars-tinycore-7.json tc-7.json-compiletc+x11.json` - TinyCore v7.2 (x86) with build tools

Executing `build_all.sh` (or `build_all.bat`) generates all boxes above.

[Ansible]: https://www.ansible.com/ "Ansible is Simple IT Automation"
[Testinfra]: https://testinfra.readthedocs.io/en/latest/ "Testinfra test your infrastructure &mdash; testinfra 1.4.2 documentation"

## Build parameters

The following parameters can be set at build time by supplying `-var` or `-var-file` command line options to `packer`:

* `vm_name` - VM name.  This also affects box file name and output directory name.
* `mem_size` - RAM size of the created VM.  Default value is `512` which means 512MB.
* `disk_size` - Disk size of the created VM.  Default value is `40960` which means 40GB.

- - -

Copyright &copy; 2016 Upper Stream Software.

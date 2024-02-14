ABI = "FreeBSD:14:aarch64"
arch = "aarch64"
DISTRIBUTIONS = "'base.txz kernel.txz'"
iso_checksum = "file:https://download.freebsd.org/releases/ISO-IMAGES/14.0/CHECKSUM.SHA256-FreeBSD-14.0-RELEASE-arm64-aarch64"
iso_image = "FreeBSD-14.0-RELEASE-arm64-aarch64-disc1.iso"
qemu_accelerator = "hvf"
qemu_binary = "qemu-system-aarch64"
qemu_machine_type = "virt"
virtualbox_guest_os_type = "FreeBSD"
vm_name = "FreeBSD-14.0-RELEASE-aarch64"
#vmware_disk_adapter_type = "nvme"
vmware_disk_adapter_type = "sata"
vmware_guest_os_type = "arm-freebsd14-64"
vmware_hardware_version = "19"
vmware_network_adapter_type = "e1000e"
vmware_partition = "ada0"
xorg_fonts = "xorg-fonts-type1-7.7"
xterm_version = "384"

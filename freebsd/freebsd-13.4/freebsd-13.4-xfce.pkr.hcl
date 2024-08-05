packer {
  required_version = ">= 1.7.0"
  required_plugins {
    hyperv = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/hyperv"
    }
    parallels = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/parallels"
    }
    qemu = {
      version = ">= 1.0.9"
      source  = "github.com/hashicorp/qemu"
    }
    virtualbox = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/virtualbox"
    }
    vmware = {
      version = ">= 1.0.11"
      source  = "github.com/hashicorp/vmware"
    }
  }
}

variable "ABI" {
  type    = string
  default = "FreeBSD:13:amd64"
}

variable "DISTRIBUTIONS" {
  type    = string
  default = "'base.txz kernel.txz lib32.txz'"
}

variable "arandr_version" {
  type        = string
  default     = "0.1.10_4"
  description = "arandr version"
}

variable "arch" {
  type        = string
  default     = "amd64"
  description = "Architecture"
}

variable "boot_wait" {
  type        = string
  default     = "10s"
  description = "Override `boot_wait` default setting (10s)"
}

variable "box_version" {
  type    = string
  default = "1.20240803"
}

variable "ca_root_nss_version" {
  type        = string
  default     = "3.93_2"
  description = "Version of `ca_root_nss` package."
}

variable "disk_size" {
  type        = string
  default     = "51200"
  description = "Disk size of the creating VM."
}

variable "doas_version" {
  type        = string
  default     = "6.3p12"
  description = "Version of `doas` package."
}

variable "esxi_remote_datastore" {
  type    = string
  default = "${env("ESXI_REMOTE_DATASTORE")}"
}

variable "esxi_remote_host" {
  type    = string
  default = "${env("ESXI_REMOTE_HOST")}"
}

variable "esxi_remote_password" {
  type      = string
  default   = "${env("ESXI_REMOTE_PASSWORD")}"
  sensitive = true
}

variable "esxi_remote_username" {
  type    = string
  default = "${env("ESXI_REMOTE_USERNAME")}"
}

variable "esxi_vnc_over_websocket" {
  type        = string
  default     = "true"
  description = "Controls whether or not to use VNC over WebSocket feature for ESXi."
}

variable "headless" {
  type        = string
  default     = "false"
  description = "Launch the virtual machine in headless mode if set to `true`."
}

variable "hyperv_netif" {
  type        = string
  default     = "hn0"
  description = "Network interface for Hyper-V box."
}

variable "hyperv_partition" {
  type        = string
  default     = "da0"
  description = "Disk name for Hyper-V box."
}

variable "hyperv_switch_name" {
  type        = string
  default     = "Default Switch"
  description = "Network switch name on Packer Hyper-V builder."
}

variable "iso_checksum" {
  type    = string
  default = "file:https://download.freebsd.org/releases/ISO-IMAGES/13.4/CHECKSUM.SHA256-FreeBSD-13.4-BETA1-amd64"
}

variable "iso_image" {
  type    = string
  default = "FreeBSD-13.4-BETA1-amd64-disc1.iso"
}

variable "mem_size" {
  type        = string
  default     = "1024"
  description = "RAM size of the creating VM."
}

variable "num_cpus" {
  type        = string
  default     = "2"
  description = "Number of virtual CPUs."
}

variable "parallels_netif" {
  type        = string
  default     = "vtnet0"
  description = "Network interface for Parallels box."
}

variable "parallels_partition" {
  type        = string
  default     = "ada0"
  description = "Disk name for Parallels box."
}

variable "path_to_iso" {
  type    = string
  default = "releases/ISO-IMAGES/13.4"
}

variable "qemu_display" {
  type        = string
  default     = ""
  description = "Value for `-display` option for QEMU."
}

variable "qemu_netif" {
  type        = string
  default     = "vtnet0"
  description = "Network interface for QEMU box."
}

variable "qemu_partition" {
  type        = string
  default     = "vtbd0"
  description = "Disk name for QEMU box."
}

variable "qemu_use_default_display" {
  type        = string
  default     = "true"
  description = "Do not pass `-display` option to QEMU if `true`."
}

variable "root_password" {
  type        = string
  default     = "vagrant"
  sensitive   = false
  description = "Password for `root` user."
}

variable "vagrant_group" {
  type        = string
  default     = "vagrant"
  description = "Group name that `vagrant_username` belongs to."
}

variable "vagrant_password" {
  type        = string
  default     = "vagrant"
  sensitive   = false
  description = "Password for `vagrant_username`.  This is also used for SSH password during build time."
}

variable "vagrant_username" {
  type        = string
  default     = "vagrant"
  description = "User name used for runtime.  This is also used for SSH user name during build time."
}

variable "variant" {
  type    = string
  default = "xfce"
}

variable "virtualbox_guest_os_type" {
  type    = string
  default = "FreeBSD_64"
}

variable "virtualbox_netif" {
  type        = string
  default     = "em0"
  description = "Network interface for VirtualBox box."
}

variable "virtualbox_partition" {
  type        = string
  default     = "ada0"
  description = "Disk name for VirtualBox box."
}

variable "vm_name" {
  type        = string
  default     = "FreeBSD-13.4-BETA-amd64"
  description = "VM name of the creating box."
}

variable "vmware_disk_adapter_type" {
  type        = string
  default     = "scsi"
  description = "Disk adapter type for VMware box."
}

variable "vmware_guest_os_type" {
  type    = string
  default = "freebsd-64"
}

variable "vmware_hardware_version" {
  type        = string
  default     = "9"
  description = "Hardware version for VMware box."
}

variable "vmware_netif" {
  type        = string
  default     = "em0"
  description = "Network interface name for VMware box."
}

variable "vmware_network_adapter_type" {
  type        = string
  default     = "e1000"
  description = "Network adapter type for VMware box."
}

variable "vmware_partition" {
  type    = string
  default = "da0"
}

locals {
  boot_command = [
    "%s",
    "<wait10><wait10><wait10><wait10>",
    "s",
    "<wait5>",
    "dhclient %s<enter><wait5>",
    "fetch -o /tmp/install.sh http://{{ .HTTPIP }}:{{ .HTTPPort }}/install.sh<enter>",
    "<wait>",
    "bsdinstall script /tmp/install.sh<enter>",
    "<wait10><wait10><wait10><wait10><wait10><wait10>"
  ]
  first_boot_command = (var.arch == "aarch64") ? "" : "<enter>"
  iso_urls = [
    "./iso/${var.iso_image}",
    "https://download.freebsd.org/${var.path_to_iso}/${var.iso_image}",
    "http://ftp.jp.freebsd.org/pub/FreeBSD/${var.path_to_iso}/${var.iso_image}",
    "http://ftp6.jp.freebsd.org/pub/FreeBSD/${var.path_to_iso}/${var.iso_image}",
    "http://ftp11.freebsd.org/pub/FreeBSD/${var.path_to_iso}/${var.iso_image}",
    "https://ftp4.tw.freebsd.org/pub/FreeBSD/${var.path_to_iso}/${var.iso_image}"
  ]
}

source "hyperv-iso" "default" {
  boot_command = split("\n", format(join("\n", local.boot_command), local.first_boot_command, var.hyperv_netif))
  boot_wait    = var.boot_wait
  cpus         = var.num_cpus
  disk_size    = var.disk_size
  headless     = var.headless
  http_content = {
    "/install.sh" = templatefile("${path.root}/install.sh.pkrtpl.hcl", {
      "variables" = {
        "PARTITIONS"              = var.hyperv_partition
        "BSDINSTALL_DISTSITE"     = "/usr/freebsd-dist"
        "DISTRIBUTIONS"           = var.DISTRIBUTIONS
        "export nonInteractive"   = "YES"
        "export ABI"              = var.ABI
        "export CA_ROOT_NSS"      = "ca_root_nss-${var.ca_root_nss_version}"
        "export DOAS"             = "doas-${var.doas_version}"
        "export NETIF"            = var.hyperv_netif
        "export ROOT_PASSWORD"    = var.root_password
        "export VAGRANT_USER"     = var.vagrant_username
        "export VAGRANT_PASSWORD" = var.vagrant_password
        "export VAGRANT_GROUP"    = var.vagrant_group
      },
      "make_conf" = {
        "WITHOUT_X11" = ""
      }
    })
  }
  iso_checksum     = var.iso_checksum
  iso_urls         = local.iso_urls
  memory           = var.mem_size
  output_directory = "output/${var.vm_name}-${var.variant}-v${var.box_version}-hyperv"
  shutdown_command = "shutdown -p now"
  ssh_password     = var.root_password
  ssh_username     = "root"
  ssh_wait_timeout = "10000s"
  switch_name      = var.hyperv_switch_name
  vm_name          = "${var.vm_name}-${var.variant}-v${var.box_version}"
}

source "parallels-iso" "default" {
  boot_command  = split("\n", format(join("\n", local.boot_command), local.first_boot_command, var.parallels_netif))
  boot_wait     = var.boot_wait
  cpus          = "${var.num_cpus}"
  disk_size     = "${var.disk_size}"
  disk_type     = "expand"
  guest_os_type = "freebsd"
  http_content = {
    "/install.sh" = templatefile("${path.root}/install.sh.pkrtpl.hcl", {
      "variables" = {
        "PARTITIONS"              = var.parallels_partition
        "BSDINSTALL_DISTSITE"     = "/usr/freebsd-dist"
        "DISTRIBUTIONS"           = var.DISTRIBUTIONS
        "export nonInteractive"   = "YES"
        "export ABI"              = var.ABI
        "export CA_ROOT_NSS"      = "ca_root_nss-${var.ca_root_nss_version}"
        "export DOAS"             = "doas-${var.doas_version}"
        "export NETIF"            = var.parallels_netif
        "export ROOT_PASSWORD"    = var.root_password
        "export VAGRANT_USER"     = var.vagrant_username
        "export VAGRANT_PASSWORD" = var.vagrant_password
        "export VAGRANT_GROUP"    = var.vagrant_group
      },
      "make_conf" = {
        "WITHOUT_X11" = ""
      }
    })
  }
  iso_checksum           = "${var.iso_checksum}"
  iso_urls               = local.iso_urls
  memory                 = "${var.mem_size}"
  output_directory       = "output/${var.vm_name}-${var.variant}-v${var.box_version}-parallels"
  parallels_tools_flavor = "other"
  parallels_tools_mode   = "disable"
  shutdown_command       = "shutdown -p now"
  ssh_password           = "${var.root_password}"
  ssh_username           = "root"
  ssh_wait_timeout       = "10000s"
  vm_name                = "${var.vm_name}-${var.variant}-v${var.box_version}"
}

source "qemu" "default" {
  accelerator      = "kvm"
  boot_command     = split("\n", format(join("\n", local.boot_command), local.first_boot_command, var.qemu_netif))
  boot_wait        = var.boot_wait
  cpus             = var.num_cpus
  disk_compression = true
  disk_interface   = "virtio"
  disk_size        = var.disk_size
  display          = var.qemu_display
  format           = "qcow2"
  headless         = var.headless
  http_content = {
    "/install.sh" = templatefile("${path.root}/install.sh.pkrtpl.hcl", {
      "variables" = {
        "PARTITIONS"              = var.qemu_partition
        "BSDINSTALL_DISTSITE"     = "/usr/freebsd-dist"
        "DISTRIBUTIONS"           = var.DISTRIBUTIONS
        "export nonInteractive"   = "YES"
        "export ABI"              = var.ABI
        "export CA_ROOT_NSS"      = "ca_root_nss-${var.ca_root_nss_version}"
        "export DOAS"             = "doas-${var.doas_version}"
        "export NETIF"            = var.qemu_netif
        "export ROOT_PASSWORD"    = var.root_password
        "export VAGRANT_USER"     = var.vagrant_username
        "export VAGRANT_PASSWORD" = var.vagrant_password
        "export VAGRANT_GROUP"    = var.vagrant_group
      },
      "make_conf" = {
        "WITHOUT_X11" = ""
      }
    })
  }
  iso_checksum        = var.iso_checksum
  iso_urls            = local.iso_urls
  memory              = var.mem_size
  net_device          = "virtio-net"
  output_directory    = "output/${var.vm_name}-${var.variant}-v${var.box_version}-qemu"
  shutdown_command    = "shutdown -p now"
  ssh_password        = var.root_password
  ssh_username        = "root"
  ssh_wait_timeout    = "10000s"
  use_default_display = var.qemu_use_default_display
  vm_name             = "${var.vm_name}-${var.variant}-v${var.box_version}"
}

source "virtualbox-iso" "default" {
  boot_command         = split("\n", format(join("\n", local.boot_command), local.first_boot_command, var.virtualbox_netif))
  boot_wait            = var.boot_wait
  cpus                 = var.num_cpus
  disk_size            = var.disk_size
  guest_additions_mode = "disable"
  guest_os_type        = var.virtualbox_guest_os_type
  headless             = var.headless
  http_content = {
    "/install.sh" = templatefile("${path.root}/install.sh.pkrtpl.hcl", {
      "variables" = {
        "PARTITIONS"              = var.virtualbox_partition
        "BSDINSTALL_DISTSITE"     = "/usr/freebsd-dist"
        "DISTRIBUTIONS"           = var.DISTRIBUTIONS
        "export nonInteractive"   = "YES"
        "export ABI"              = var.ABI
        "export CA_ROOT_NSS"      = "ca_root_nss-${var.ca_root_nss_version}"
        "export DOAS"             = "doas-${var.doas_version}"
        "export NETIF"            = var.virtualbox_netif
        "export ROOT_PASSWORD"    = var.root_password
        "export VAGRANT_USER"     = var.vagrant_username
        "export VAGRANT_PASSWORD" = var.vagrant_password
        "export VAGRANT_GROUP"    = var.vagrant_group
      },
      "make_conf" = {
        "WITHOUT_X11" = ""
      }
    })
  }
  iso_checksum     = var.iso_checksum
  iso_urls         = local.iso_urls
  memory           = var.mem_size
  output_directory = "output/${var.vm_name}-${var.variant}-v${var.box_version}-virtualbox"
  shutdown_command = "shutdown -p now"
  ssh_password     = var.root_password
  ssh_timeout      = "10000s"
  ssh_username     = "root"
  vboxmanage = [
    ["modifyvm", "{{ .Name }}", "--nat-localhostreachable1", "on"],
    ["modifyvm", "{{ .Name }}", "--rtcuseutc", "on"],
    ["modifyvm", "{{ .Name }}", "--vram", "16"]
  ]
  vm_name = "${var.vm_name}-${var.variant}-v${var.box_version}"
}

source "vmware-iso" "default" {
  boot_command      = split("\n", format(join("\n", local.boot_command), local.first_boot_command, var.vmware_netif))
  boot_wait         = var.boot_wait
  cpus              = var.num_cpus
  disk_adapter_type = var.vmware_disk_adapter_type
  disk_size         = var.disk_size
  disk_type_id      = "0"
  guest_os_type     = var.vmware_guest_os_type
  headless          = var.headless
  http_content = {
    "/install.sh" = templatefile("${path.root}/install.sh.pkrtpl.hcl", {
      "variables" = {
        "PARTITIONS"              = var.vmware_partition
        "BSDINSTALL_DISTSITE"     = "/usr/freebsd-dist"
        "DISTRIBUTIONS"           = var.DISTRIBUTIONS
        "export nonInteractive"   = "YES"
        "export ABI"              = var.ABI
        "export CA_ROOT_NSS"      = "ca_root_nss-${var.ca_root_nss_version}"
        "export DOAS"             = "doas-${var.doas_version}"
        "export NETIF"            = var.vmware_netif
        "export ROOT_PASSWORD"    = var.root_password
        "export VAGRANT_USER"     = var.vagrant_username
        "export VAGRANT_PASSWORD" = var.vagrant_password
        "export VAGRANT_GROUP"    = var.vagrant_group
      },
      "make_conf" = {
        "WITHOUT_X11" = ""
      }
    })
  }
  iso_checksum         = var.iso_checksum
  iso_urls             = local.iso_urls
  memory               = var.mem_size
  network              = "nat"
  network_adapter_type = var.vmware_network_adapter_type
  output_directory     = "output/${var.vm_name}-${var.variant}-v${var.box_version}-vmware"
  shutdown_command     = "shutdown -p now"
  ssh_password         = var.root_password
  ssh_timeout          = "10000s"
  ssh_username         = "root"
  usb                  = true
  version              = var.vmware_hardware_version
  vm_name              = "${var.vm_name}-${var.variant}-v${var.box_version}"
  vmx_data = {
    "ethernet0.addressType"   = "generated"
    "ethernet0.present"       = "TRUE"
    "ethernet0.wakeOnPcktRcv" = "FALSE"
    "usb_xhci.present"        = "TRUE"
    "svga.vramSize"           = "16777216"
    "vhv.enable"              = "TRUE"
  }
}

source "vmware-iso" "esxi" {
  boot_command  = split("\n", format(join("\n", local.boot_command), local.first_boot_command, var.vmware_netif))
  boot_wait     = var.boot_wait
  cpus          = var.num_cpus
  disk_size     = var.disk_size
  disk_type_id  = "thin"
  guest_os_type = var.vmware_guest_os_type
  headless      = var.headless
  http_content = {
    "/install.sh" = templatefile("${path.root}/install.sh.pkrtpl.hcl", {
      "variables" = {
        "PARTITIONS"              = var.vmware_partition
        "BSDINSTALL_DISTSITE"     = "/usr/freebsd-dist"
        "DISTRIBUTIONS"           = var.DISTRIBUTIONS
        "export nonInteractive"   = "YES"
        "export ABI"              = var.ABI
        "export CA_ROOT_NSS"      = "ca_root_nss-${var.ca_root_nss_version}"
        "export DOAS"             = "doas-${var.doas_version}"
        "export NETIF"            = var.vmware_netif
        "export ROOT_PASSWORD"    = var.root_password
        "export VAGRANT_USER"     = var.vagrant_username
        "export VAGRANT_PASSWORD" = var.vagrant_password
        "export VAGRANT_GROUP"    = var.vagrant_group
      },
      "make_conf" = {
        "WITHOUT_X11" = ""
      }
    })
  }
  insecure_connection  = true
  iso_checksum         = var.iso_checksum
  iso_urls             = local.iso_urls
  memory               = var.mem_size
  network              = "bridged"
  network_adapter_type = "e1000"
  output_directory     = "${var.vm_name}-${var.variant}-v${var.box_version}"
  remote_datastore     = var.esxi_remote_datastore
  remote_host          = var.esxi_remote_host
  remote_password      = var.esxi_remote_password
  remote_type          = "esx5"
  remote_username      = var.esxi_remote_username
  shutdown_command     = "shutdown -p now"
  skip_export          = true
  ssh_password         = var.root_password
  ssh_timeout          = "10000s"
  ssh_username         = "root"
  version              = var.vmware_hardware_version
  vm_name              = "${var.vm_name}-${var.variant}-v${var.box_version}"
  vmx_data = {
    "ethernet0.addressType"     = "generated"
    "ethernet0.networkName"     = "VM Network"
    "ethernet0.present"         = "TRUE"
    "ethernet0.wakeOnPcktRcv"   = "FALSE"
    "remotedisplay.vnc.enabled" = "TRUE"
    "svga.vramSize"             = "16777216"
    "vhv.enable"                = "TRUE"
  }
  vnc_over_websocket = var.esxi_vnc_over_websocket
}

build {
  sources = [
    "source.hyperv-iso.default",
    "source.parallels-iso.default",
    "source.qemu.default",
    "source.virtualbox-iso.default",
    "source.vmware-iso.default",
    "source.vmware-iso.esxi"
  ]

  provisioner "shell" {
    environment_vars = [
      "ARANDR=arandr-${var.arandr_version}",
      "ROOT_PASSWORD=${var.root_password}",
      "SLIM=slim-1.3.6_25",
      "SLIM_THEMES=slim-themes-1.0.1_2",
      "TWM=twm-1.0.12_1",
      "VAGRANT_GROUP=${var.vagrant_group}",
      "VAGRANT_PASSWORD=${var.vagrant_password}",
      "VAGRANT_USER=${var.vagrant_username}",
      "XCLOCK=xclock-1.0.9_1",
      "XFCE=xfce-4.18_1",
      "XORG_MINIMAL=xorg-minimal-7.5.2_3",
      "XRANDR=xrandr-1.5.2_1",
      "XRDP=xrdp-0.9.26,1",
      "XTERM=xterm-392"
    ]
    execute_command = "chmod +x {{ .Path }}; env {{ .Vars }} {{ .Path }}"
    scripts = [
      "../provisioners/vagrant-11.1+.sh",
      "../provisioners/xorg.sh",
      "../provisioners/xfce.sh",
      "../provisioners/slim.sh",
      "../provisioners/xrdp.sh"
    ]
  }

  provisioner "shell" {
    environment_vars = [
      "PARALLELS_WITH_XORG=yes",
      "XF86_VIDEO_SCFB=xf86-video-scfb-0.0.7_2"
    ]
    execute_command = "chmod +x {{ .Path }}; env {{ .Vars }} {{ .Path }}"
    only = [
      "parallels-iso.default"
    ]
    script = "../provisioners/parallels.sh"
  }

  provisioner "shell" {
    environment_vars = [
      "VIRTUALBOX_OSE_ADDITIONS=virtualbox-ose-additions-6.1.50"
    ]
    execute_command = "chmod +x {{ .Path }}; env {{ .Vars }} {{ .Path }}"
    only = [
      "virtualbox-iso.default"
    ]
    script = "../provisioners/virtualbox_ose_additions-10.4+.sh"
  }

  provisioner "shell" {
    environment_vars = [
      "OPEN_VM_TOOLS=open-vm-tools-12.4.0,2",
      "VMWARE_WITH_XORG=1",
      "XF86_INPUT_VMMOUSE=xf86-input-vmmouse-13.1.0_7",
      "XF86_VIDEO_VMWARE=xf86-video-vmware-13.3.0_8"
    ]
    execute_command = "chmod +x {{ .Path }}; env {{ .Vars }} {{ .Path }}"
    only = [
      "vmware-iso.default",
      "vmware-iso.esxi"
    ]
    script = "../provisioners/vmware-guest.sh"
  }

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; env {{ .Vars }} {{ .Path }}"
    except = [
      "vmware-iso.esxi"
    ]
    script = "../provisioners/disk_cleanup.sh"
  }

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; env {{ .Vars }} {{ .Path }}"
    script          = "../provisioners/cleanup.sh"
  }

  post-processor "vagrant" {
    compression_level = 9
    only = [
      "hyperv-iso.default",
      "parallels-iso.default",
      "virtualbox-iso.default",
      "vmware-iso.default"
    ]
    output               = "./${var.vm_name}-${var.variant}-v${var.box_version}-{{ .Provider }}.box"
    vagrantfile_template = "../vagrantfiles/Vagrantfile.FreeBSD-13.2+"
  }

  post-processor "vagrant" {
    keep_input_artifact = true
    compression_level   = 9
    only = [
      "qemu.default"
    ]
    output               = "./${var.vm_name}-${var.variant}-v${var.box_version}-{{ .Provider }}.box"
    vagrantfile_template = "../vagrantfiles/Vagrantfile.FreeBSD-13.2+"
  }
}

#!/bin/sh -x
# shellcheck disable=SC2006

test -z "$VBOX_VER" && VBOX_VER=`cat /root/.vbox_version`
apt-get -y install "linux-headers-`uname -r`" dkms
vbox_guest_additions_iso=VBoxGuestAdditions_${VBOX_VER:=$(cat /root/.vbox_version)}.iso
wget "http://download.virtualbox.org/virtualbox/$VBOX_VER/$vbox_guest_additions_iso"
mount -t iso9660 "$vbox_guest_additions_iso" /media/cdrom0
/media/cdrom0/VBoxLinuxAdditions.run install --no-setup
rc=$?
umount /media/cdrom0

rm -f "$vbox_guest_additions_iso"
if [ $rc -eq 2 ]; then
	echo "Assume VirtualBox Guest Additions should work after reboot and ignore this error."
	rc=0
fi
exit $rc

#!/bin/sh -ex
pkg_add "${QEMU_GUEST_AGENT:-qemu-guest-agent-10.2.1}"
install -m0644 /usr/pkg/share/examples/rc.d/qemu-guest-agent \
	/etc/rc.d/qemu-guest-agent

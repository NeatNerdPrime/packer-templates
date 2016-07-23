useradd -m vagrant
usermod -p `pwhash vagrant` -G wheel vagrant
mkdir -p /home/vagrant/.ssh
pkg_add wget-1.16.3
wget --no-check-certificate -O - https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub >> /home/vagrant/.ssh/authorized_keys
chown -R vagrant:users /home/vagrant     
chmod -R og-rwx /home/vagrant/.ssh
sed \
  -e '/^#UseDNS /s/^#//' \
  -e '/^UseDNS /s/ yes$/ no/' /etc/ssh/sshd_config > /tmp/sshd_config
mv /tmp/sshd_config /etc/ssh/sshd_config
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' >> /usr/pkg/etc/sudoers.d/vagrant

ftp -o - https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub >> /home/vagrant/.ssh/authorized_keys
UID=`grep '^vagrant' /etc/passwd | sed 's/^[^:]*:[^:]*:\([^:]*\):.*$/\1/'`
GID=`grep '^vagrant' /etc/passwd | sed 's/^[^:]*:[^:]*:[^:]*:\([^:]*\):.*$/\1/'`
chown -R $UID:$GID /home/vagrant/.ssh
echo "permit nopass keepenv vagrant as root" >> /etc/doas.conf
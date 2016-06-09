# set pkg path for users
echo " "
echo " Setting PKG_PATH for users "
echo " "
echo " export PKG_PATH=http://ftp3.usa.openbsd.org/pub/OpenBSD/`uname -r`/packages/`arch -s`/ " >> /root/.profile
echo " export PKG_PATH=http://ftp3.usa.openbsd.org/pub/OpenBSD/`uname -r`/packages/`arch -s`/ ">> /home/vagrant/.profile

# install wget/curl/bash/vim and its dependencies
echo " "
echo " Installing needed packages "
echo " "
export PKG_PATH=http://ftp3.usa.openbsd.org/pub/OpenBSD/`uname -r`/packages/`arch -s`/
pkg_add wget curl bash vim--no_x11 rsync--iconv bzip2 ngrep sudo-1.8.15-gettext pkglocatedb 

# giving root & vagrant bash as shell
echo " "
echo " Giving root/vagrant bash as a shell "
echo " "
usermod -s /usr/local/bin/bash vagrant
usermod -s /usr/local/bin/bash root

# sudo
# Defaults requiretty is not present in the sudoers file
# env_keep I'll leave it as it is since user's path is same or more comprehensive than root's path
echo " "
echo " Setting sudo to work with vagrant "
echo " "
echo "# Uncomment to allow people in group wheel to run all commands without a password" >> /etc/sudoers
echo "%wheel        ALL=(ALL) NOPASSWD: SETENV: ALL" >> /etc/sudoers

# doas
echo " "
echo " Setting up doas to work with vagrant "
echo " "
echo "permit nopass keepenv { ENV PS1 SSH_AUTH_SOCK } :wheel" >> /etc/doas.conf
echo "permit nopass keepenv root as root" >> /etc/doas.conf
chown root:root /etc/doas.conf
chmod 0644 /etc/doas.conf

/etc/rc.d/sendmail stop

# install the ports system for who wants to use it
echo " "
echo " Installing the ports system ! "
echo " "
cd /tmp
wget http://ftp3.usa.openbsd.org/pub/OpenBSD/`uname -r`/ports.tar.gz
wget http://ftp.openbsd.org/pub/OpenBSD/$(uname -r)/SHA256.sig
signify -Cp /etc/signify/openbsd-$(uname -r | cut -c 1,3)-base.pub -x SHA256.sig ports.tar.gz
cd /usr
doas tar xzf /tmp/ports.tar.gz

# Set up ntpd
echo " "
echo " Set ntpd to start automatically "
echo " "
sed 's/^ntpd_flags=$/ntpd_flags="-s"/' /etc/rc.conf > /etc/rc.conf

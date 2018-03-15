# set pkg path for users
#MIRROR="http://ftp3.usa.openbsd.org"
MIRROR="http://ftp.icm.edu.pl"
echo " "
echo " Setting PKG_PATH for users "
echo " "
echo " export PKG_PATH=${MIRROR}/pub/OpenBSD/snapshots/packages/`arch -s`/ " >> /root/.profile
echo " export PKG_PATH=${MIRROR}/pub/OpenBSD/snapshots/packages/`arch -s`/ ">> /home/vagrant/.profile

# needed by /etc/rc.firsttime to exec "syspatch -c"
echo ${MIRROR}/pub/OpenBSD > /etc/installurl

# install wget/curl/bash/vim and its dependencies
echo " "
echo " Installing needed packages "
echo " "
export PKG_PATH=${MIRROR}/pub/OpenBSD/snapshots/packages/`arch -s`/
pkg_add wget curl bash vim--no_x11 rsync--iconv bzip2 ngrep sudo-1.8.21.2-gettext pkglocatedb 

# giving root & vagrant bash as shell
echo " "
echo " Giving root/vagrant bash as a shell "
echo " "
which bash && usermod -s /usr/local/bin/bash vagrant
which bash && usermod -s /usr/local/bin/bash root

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
echo "permit nopass :wheel" >> /etc/doas.conf
echo "permit nopass keepenv root" >> /etc/doas.conf
doas -C /etc/doas.conf
chown root:wheel /etc/doas.conf
chmod 0644 /etc/doas.conf

# Set up ntpd
echo " "
echo " Set ntpd to start automatically "
echo " "
sed 's/^ntpd_flags=$/ntpd_flags="-s"/' /etc/rc.conf > /etc/rc.conf

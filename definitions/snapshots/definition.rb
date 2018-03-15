Veewee::Session.declare({
  :cpu_count => '1', :memory_size=> '256',
  :disk_size => '40960', :disk_format => 'VDI', :hostiocache => 'off',
  :os_type_id => 'OpenBSD_64',
  :iso_file => "openbsd63_64.iso",
  :iso_src => "http://ftp.icm.edu.pl/pub/OpenBSD/snapshots/amd64/install63.iso",
  :iso_sha256 => "51f2f617bd8dfbc8c3f05157da898a55ea059ed66039dd52f909d6bf442f5881",
  :iso_download_timeout => "1000",
  :boot_wait => "50", :boot_cmd_sequence => [
# I - install
   'I<Enter>',
# set the keyboard
   'us<Enter>',
# set the hostname
   'OpenBSD63-x64<Enter>',
# Which nic to config ? [em0]
   '<Enter>',
# do you want dhcp ? [dhcp]
   '<Enter>',
   '<Wait>'*5,
# IPV6 for em0 ? [none]
   'none<Enter>',
# Which other nic do you wish to configure [done]
   'done<Enter>',
# DNS domain name? [my.domain]
   '<Enter>',
# Pw for root account
   'vagrant<Enter>',
   '<Wait>',
   'vagrant<Enter>',
# Start sshd by default ? [yes]
   'yes<Enter>',
# Do you expect to run the X Window System ? [yes]
   'no<Enter>',
# Setup a user ?
   'vagrant<Enter>',
# Full username
   'vagrant<Enter>',
# Pw for this user
   'vagrant<Enter>',
   '<Wait>',
   'vagrant<Enter>',
# Allow root ssh login? (yes, no, prohibit-password)
   'yes<Enter>',
# What timezone are you in ?
   'GB<Enter>',
# Available disks [sd0]
   '<Enter>',
# Use (W)whole disk or (E)edit MBR ? [whole]
   'W<Enter>',
# Use (A)auto layout ... ? [a]
   'A<Enter>',
   '<Wait>'*15,
# location of the sets [cd]
   'cd0<Enter>',
# Pathname to sets ? [snapshots/amd64]
   '<Enter>',
# Remove games and X
   '-* bsd* base* comp* man*<Enter>',
   '<Wait>',
# Done installing ?
   'done<Enter>',
# CD does not contain SHA256.sig. Continue without verification?
   'yes<Enter>',
   '<Wait>'*15,
# Done installing ?
   'done<Enter>',
# Time appears wrong. Set to ...? [yes]
   'yes<Enter><Wait>',
# wait for relinking
   '<Wait>'*25,
   'reboot<Enter>',
   '<Wait>'*6
  ],
  :kickstart_port => "7122", :kickstart_timeout => "10000", :kickstart_file => "",
  :ssh_login_timeout => "10000", :ssh_user => "root", :ssh_password => "vagrant", :ssh_key => "",
  :ssh_host_port => "7222", :ssh_guest_port => "22",
  :sudo_cmd => "sh '%f'",
  :shutdown_cmd => "/sbin/halt -p",
  :postinstall_files => [
    "base.sh",
    "vagrant.sh",
    "ruby.sh",
    "puppet.sh",
    "ansible.sh",
    "chef.sh"
  ],
  :postinstall_timeout => "10000"
})

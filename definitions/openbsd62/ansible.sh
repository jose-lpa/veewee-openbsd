# Install Ansible
. /root/.profile
pkg_add -I py-pip
[[ -r /usr/local/bin/pip2.7 ]] && ln -sf /usr/local/bin/pip2.7 /usr/local/bin/pip
pip install ansible

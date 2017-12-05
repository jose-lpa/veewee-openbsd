# Install Ansible
pkg_add py-pip
[[ -r /usr/local/bin/pip2.7 ]] && ln -sf /usr/local/bin/pip2.7 /usr/local/bin/pip
pip install ansible
`which ansible` || exit 1

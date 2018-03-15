# Install Chef
touch /etc/profile
gem install chef --no-ri --no-rdoc
for i in /usr/local/bin/*[0-9][0-9]; do j=`echo $i | sed 's/[0-9][0-9]$//'`; test -L $j || ln -s $i $j;done

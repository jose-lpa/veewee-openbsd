. /root/.profile
pkg_add ruby-2.3.0

ln -sf /usr/local/bin/ruby23 /usr/local/bin/ruby
ln -sf /usr/local/bin/erb23 /usr/local/bin/erb
ln -sf /usr/local/bin/irb23 /usr/local/bin/irb
ln -sf /usr/local/bin/rdoc23 /usr/local/bin/rdoc
ln -sf /usr/local/bin/ri23 /usr/local/bin/ri
ln -sf /usr/local/bin/rake23 /usr/local/bin/rake
ln -sf /usr/local/bin/gem23 /usr/local/bin/gem

gem update --no-document --system
gem install --no-document rails

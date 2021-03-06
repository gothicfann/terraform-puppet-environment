#!/bin/bash

sleep 20
cd /tmp/
yum install wget -y
wget -O - 'https://downloads.puppetlabs.com/puppet-gpg-signing-key.pub' | gpg --import
wget -qO- '${pe-master_latest}' | tar xvz
echo '${pe_conf}' > pe.conf
(cd puppet-enterprise-* && ./puppet-enterprise-installer -c /tmp/pe.conf -q && /usr/local/bin/puppet agent -t)
rm -rf puppet-enterprise-* pe.conf
exit 0

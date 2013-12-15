# /etc/puppet/manifests/site.pp
# This is the first manifest that the master will parse

# This is the special case for our puppet master node
node 'sura-puppet.sura-puppet.b3.internal.cloudapp.net' {
  file { '/tmp/hello':
    content => "Hello, I am puppet master ${::fqdn}\n",
  }
}

# This is the default case for our puppet agent nodes
node default {
  file { '/tmp/hello':
    content => "Hello, I am puppet agent ${::fqdn}\n",
  }
}

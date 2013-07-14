# == Class: motd::params
#
# This class handles the configuration for the motd Puppet module.
#

class motd::params {

  case $::operatingsystem {
    default: { fail("Unsupported OS: ${::operatingsystem}") }

    /(Redhat|CentOS)/: {
       $motdgroup = "root"
    }

    /(Debian|Ubuntu)/: {
       $motdgroup = "root"
    }

    'Solaris': {
       $motdgroup = "sys"
    }
  }
}


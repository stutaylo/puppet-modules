# == Class: cores::params
#
# This class handles the configuration for the cores Puppet module.
#

class cores::params {

  case $::operatingsystem {
    default: { fail("Unsupported OS: ${::operatingsystem}") }

    /(Redhat|CentOS)/: {
      $corefile = "core.%e-%p-%u"
    }

    /(Debian|Ubuntu)/: {
      $corefile = "core.%e-%p-%u"
    }

    'Solaris': {
      $corefile = "core.%f-%p-%u"
    }
  }
}


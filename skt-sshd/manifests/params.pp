# == Class: sshd::params
#
# This class handles the configuration for the sshd Puppet module.
#

class sshd::params {

  case $::operatingsystem {
    default: { fail("Unsupported OS: ${::operatingsystem}") }

    /(Redhat|CentOS)/: {
       $sshdservice = "sshd"
       $sshdpackage = "openssh-server"
    }

    /(Debian|Ubuntu)/: {
       $sshdservice = "ssh"
       $sshdpackage = "openssh-server"
    }

    'Solaris': {
       $sshdservice = "network/ssh"
       $sshdpackage = "network/ssh"
    }
  }
}


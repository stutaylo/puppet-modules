# == Class: sshd::install
#
# This class handles the installation of sshd.
#

class sshd::install {

  package { "$sshd::params::sshdpackage":
    ensure => present,
  }

}

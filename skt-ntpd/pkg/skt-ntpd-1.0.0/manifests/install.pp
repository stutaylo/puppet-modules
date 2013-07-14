# == Class: ntpd::install
#
# This class handles the installation of ntpd.
#

class ntpd::install {

  package { "$ntpd::params::ntpdpackage":
    ensure => present,
  }

}

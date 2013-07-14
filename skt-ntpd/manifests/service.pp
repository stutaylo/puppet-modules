# == Class: ntpd::service
#
# This class handles the ntpd service.
#


class ntpd::service {
  service { $ntpd::params::ntpdservice: 
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Class["ntpd::config"],
  }
}

# == Class: sshd::service
#
# This class handles the sshd service.
#


class sshd::service {
  service { $sshd::params::sshdservice: 
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Class["sshd::config"],
  }
}

# == Class: ntpd::params
#
# This class handles the configuration for the ntpd Puppet module.
#

class ntpd::params {

  case $::operatingsystem {
    default: { fail("Unsupported OS: ${::operatingsystem}") }

    /(Redhat|CentOS)/: {
       $ntpdservice = "ntpd"
       $ntpdpackage = "ntpd"
       $ntpdconfig  = "/etc/ntp.conf"
       $ntpdgroup   = "root"
       $ntpdmode    = 0644
    }

    /(Debian|Ubuntu)/: {
       $ntpdservice = "ntp"
       $ntpdpackage = "ntp"
       $ntpdconfig  = "/etc/ntp.conf"
       $ntpdgroup   = "root"
       $ntpdmode    = 0644
    }

    'Solaris': {
       $ntpdservice = "network/ntp"
       $ntpdpackage = "network/ntp"
       $ntpdconfig  = "/etc/inet/ntp.client"
       $ntpdgroup   = "sys"
       $ntpdmode    = 0444
    }
  }
}


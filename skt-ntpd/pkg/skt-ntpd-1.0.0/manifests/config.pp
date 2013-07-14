# == Class: ntpd::config
#
# This class handles the configuration of the ntpd daemon.
#

class ntpd::config($ntpservers) { 

  file {"$ntpd::params::ntpdconfig":
    content => template("ntpd/ntpd.erb"),
    owner   => "root",
    group   => "$ntpd::params::ntpdgroup",
    mode    => "$ntpd::params::ntpdmode",  
    require => Class["ntpd::install"],
    notify  => Class["ntpd::service"],
  }
}

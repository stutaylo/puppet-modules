# == Class: motd::install
#
# This class handles the installation of motd.
#

class motd::install {

  file { "/etc/motd":
    ensure  => present,
    owner   => "root",
    group   => "$motd::params::motdgroup",
    mode    => 0644,
    content => template("motd/motd.erb"),
  }

}

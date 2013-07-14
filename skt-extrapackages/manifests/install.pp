# == Class: extrapackages::install
#
# This class handles the installation of extrapackages.
#

class extrapackages::install {

  package { "$extrapackages::params::packages":
    ensure => present,
  }

}

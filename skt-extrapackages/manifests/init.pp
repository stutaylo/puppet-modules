# == Class: extrapackages
#
# This class manages extrapackages.
#

class extrapackages {

      include extrapackages::params, extrapackages::install, extrapackages::config, extrapackages::service

}

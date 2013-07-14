# == Class: sshd
#
# This class manages sshd.
#

class sshd {

      include sshd::params, sshd::install, sshd::config, sshd::service

}

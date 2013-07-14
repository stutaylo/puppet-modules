# == Class: sshd::config
#
# This class handles the configuration of the sshd daemon.
#

class sshd::config { 

  augeas { "sshd_config":
      context => "/files/etc/ssh/sshd_config",
      changes => [
        "set PermitRootLogin no",
        "set StrictModes yes",
        "set IgnoreRhosts yes",
        "set RhostsRSAAuthentication no",
        "set HostbasedAuthentication no",
        "set PermitEmptyPasswords no",
        "set PrintMotd yes",
      ],
      require => Class["sshd::install"],
      notify  => Class["sshd::service"],
    }

}

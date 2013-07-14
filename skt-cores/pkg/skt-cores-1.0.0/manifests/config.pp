# == Class: cores::config
#
# This class handles the configuration of the cores daemon.
#

class cores::config { 

  case $::operatingsystem {
    default: { fail("Unsupported OS: ${::operatingsystem}") }

    /(Redhat|CentOS|Debian|Ubuntu)/: {

      file { "/var/cores/":
        ensure => "directory",
        owner  => "root",
        group  => "root",
        mode   => 0777,
      }

      exec { "sysctl-p":
        refreshonly => true,
        command     => "/sbin/sysctl -p",
      }

      augeas { "sysctl":
        context => "/files/etc/sysctl.conf",
        changes => [
          "set kernel.core_pattern /var/cores/$cores::params::corefile",
          "set fs.suid_dumpable 2",
          "set kernel.core_uses_pid 0",
        ],
        notify => Exec["sysctl-p"],
      }

      $path_list  = "domain[.=\"*\"][./type=\"soft\" and ./item=\"core\"]"
      $path_exact = "domain[.=\"*\"][./type=\"soft\" and ./item=\"core\" and ./value=\"unlimited\"]"
 
      augeas { "limits":
        context => "/files/etc/security/limits.conf",
        onlyif  => "match $path_exact != 1",
        changes => [
          "rm $path_list",
          "set domain[last()+1] *",
          "set domain[last()]/type soft",
          "set domain[last()]/item core",
          "set domain[last()]/value unlimited",
        ],
      }
    }

    'Solaris': {

      exec { "coreadm":
        command => "/usr/bin/coreadm -i /var/core/$cores::params::corefile",
        notify => Service["coreadm"],
      }

      service { "coreadm":
        ensure => running,
        hasstatus => true,
        hasrestart => true,
        enable => true,
      }
    }
  }
}

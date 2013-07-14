# == Class: ntpd
#
# This class manages ntpd.
#

class ntpd($ntpservers) {

      include ntpd::params, ntpd::install, ntpd::service
   
      class { 'ntpd::config': 
        ntpservers => $ntpservers 
      }

}

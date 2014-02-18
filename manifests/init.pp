# == Class: openstack_repos
#
# Full description of class openstack_repos here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { openstack_repos:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Steve Huff <steve_huff@harvard.edu>
#
# === Copyright
#
# Copyright 2014 President and Fellows of Harvard College
#
class openstack_repos (
  $role,
  $local_mirrors = $openstack_repos::params::local_mirrors,
) inherits openstack_repos::params {

  case $::osfamily {
    'RedHat': {}
    default: {
      fail("'openstack_repos' only runs on RedHat systems, not '${::osfamily}'.")
    }
  }

  validate_re($openstack_repos::role,
              '^(compute|storage|foreman)$',
              "'${openstack_repos::role}' is not a valid OpenStack role."
  )
  validate_bool($openstack_repos::local_mirrors)

  class { 'openstack_repos::common':
    before        => Class['openstack_repos'],
    local_mirrors => $openstack_repos::local_mirrors,
  }

  class { "openstack_repos::${openstack_repos::role}":
    require       => Class['openstack_repos::common'],
    before        => Class['openstack_repos'],
    local_mirrors => $openstack_repos::local_mirrors,
  }
}

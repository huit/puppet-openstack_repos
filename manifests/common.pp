# Class:: openstack_repos::common
#
#
class openstack_repos::common (
  $local_mirrors,
) {

  # disable rc-extras
  yumrepo { 'rc-extras':
    enabled => 0,
  }

  if $openstack_repos::common::local_mirrors {
    Yumrepo <<| name == 'rdo-havana' |>>

    Package['rdo-release-havana'] ~> Yumrepo['rdo-havana']
  }
  else {
    package { 'rdo-release-havana':
      ensure   => $openstack_repos::common::local_mirrors ? {
        true    => 'absent',
        default => 'present',
      },
      provider => 'yum',
      source   => 'http://repos.fedorapeople.org/repos/openstack/openstack-havana/rdo-release-havana-7.noarch.rpm',
    }
  }

} # Class:: openstack_repos::common

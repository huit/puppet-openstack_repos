# Class:: openstack_repos::foreman
#
#
class openstack_repos::foreman (
  $local_mirrors,
) {

  if $openstack_repos::foreman::local_mirrors {
    realize(Yumrepo['foreman'])
  }

  package { 'foreman-release':
    ensure   => $openstack_repos::foreman::local_mirrors ? {
      true    => 'absent',
      default => 'present',
    },
    provider => 'rpm',
    source   => 'http://yum.theforeman.org/releases/1.3/el6/x86_64/foreman-release.rpm',
  }

} # Class:: openstack_repos::foreman

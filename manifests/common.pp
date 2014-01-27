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
    realize(Yumrepo['rdo-havana'])
  }
  else {
    yumrepo { 'rdo-havana':
      descr               => 'RDO Havana',
      baseurl             => 'http://repos.fedorapeople.org/repos/openstack/openstack-havana/epel-$releasever/',
      enabled             => 1,
      gpgcheck            => 0,
    }
  }

} # Class:: openstack_repos::common

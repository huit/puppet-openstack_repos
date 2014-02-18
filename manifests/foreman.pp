# Class:: openstack_repos::foreman
#
#
class openstack_repos::foreman (
  $local_mirrors,
) {

  # foreman is provided by RDO
  #
  # if $openstack_repos::foreman::local_mirrors {
  #   Yumrepo <<| name == 'foreman' |>>
  #   Yumrepo <<| name == 'foreman-plugins' |>>

  #   Package['foreman-release'] ~> Yumrepo['foreman'] ~> Yumrepo['foreman-plugins']
  # }

  # package { 'foreman-release':
  #   ensure   => $openstack_repos::foreman::local_mirrors ? {
  #     true    => 'absent',
  #     default => 'present',
  #   },
  #   provider => 'rpm',
  #   source   => 'http://yum.theforeman.org/releases/1.4/el6/x86_64/foreman-release.rpm',
  # }

} # Class:: openstack_repos::foreman

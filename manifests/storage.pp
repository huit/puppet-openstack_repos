# Class:: openstack_repos::storage
#
#
class openstack_repos::storage (
  $local_mirrors,
) {

  if $openstack_repos::storage::local_mirrors {
    realize(Yumrepo['glusterfs-epel','glusterfs-noarch-epel'])
  }
  else {
    Yumrepo {
      enabled             => 1,
      gpgcheck            => 0,
    }

    yumrepo { 'glusterfs-epel':
      descr               => 'GlusterFS is a clustered file-system capable of scaling to several petabytes.',
      baseurl             => 'http://download.gluster.org/pub/gluster/glusterfs/3.4/3.4.2/EPEL.repo/epel-$releasever/$basearch/',
    }

    yumrepo { 'glusterfs-epel-noarch':
      descr               => 'GlusterFS is a clustered file-system capable of scaling to several petabytes.',
      baseurl             => 'http://download.gluster.org/pub/gluster/glusterfs/3.4/3.4.2/EPEL.repo/epel-$releasever/noarch/',
    }
  }

} # Class:: openstack_repos::storage

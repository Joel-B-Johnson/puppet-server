# /etc/puppetlabs/code/environments/production/modules/profile/manifests/maintenance/scripts.pp
class profile::maintenance::scripts (
  Boolean             $ssl,
  Boolean             $backups_enabled,
  Optional[String[1]] $site_alias = undef,
) {
  file { '/tmp/scripts.txt':
    ensure  => file,
    content => @("END"),
               Data from profile::maintenance::scripts
               -----
               profile::maintenance::scripts::ssl: ${ssl}
               profile::maintenance::scripts::backups_enabled: ${backups_enabled}
               profile::maintenance::scripts::site_alias: ${site_alias}
               |END
    owner   => root,
    mode    => '0644',
  }
  file { '/home/joel/ipsetup.sh':
    ensure  =>  file,
    content =>  epp('profile/ipsetup.sh.epp'),
    owner   =>  root,
    mode    =>  '0755',
  }
}

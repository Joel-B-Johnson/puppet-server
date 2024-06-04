# /etc/puppetlabs/code/environments/production/modules/profile/manifests/joelwebapp/webapp.pp
class profile::joelwebapp::webapp (
  Boolean $not_sql = true,
  Boolean $not_react = true,
) {
  if $not_sql {
    package { 'mysql-server':
      ensure  => installed,
    }
  }

  if $not_react {
    package { 'npm':
      ensure  => installed,
    }
    package { 'nodejs':
      ensure  => installed,
    }
  }
  notify { 'hello':
    message => 'Hello Joel, this was written from puppet agent!',
  }
}

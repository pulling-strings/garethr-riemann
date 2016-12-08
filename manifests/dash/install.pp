# Install dash
class riemann::dash::install {
  include gcc

  ensure_resource('package', $riemann::params::libxml_package, {'ensure' => 'present' })
  ensure_resource('package', $riemann::params::libxslt_package, {'ensure' => 'present' })

  user { 'riemann-dash':
    ensure => present,
  }

  package { 'riemann-dash':
    ensure   => installed,
    require  => Class['gcc'],
    provider => gem,
  }

  file{'/var/lib/riemann-dash':
    ensure => directory,
    owner  => $riemann::dash::user
  }
}

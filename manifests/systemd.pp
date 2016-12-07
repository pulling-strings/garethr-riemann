# basic system setup
define riemann::systemd {
  file { "/etc/systemd/system/${name}.service":
    ensure  => present,
    content => template("riemann/etc/init/${name}.systemd.erb")
    } ->

  exec{"reload ${name} service":
    command => "systemctl enable ${name}",
    user    => 'root',
    path    => ['/usr/bin','/bin',]
  } -> Service[$name]

}

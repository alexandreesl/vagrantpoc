class { 'apt':
	always_apt_update => true,
	}

Class['apt'] -> Package <| |>

Exec {
  path => '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin',
}

package { ["tomcat7"]:
	ensure => installed,
}

service { "tomcat7":
	ensure => running,
	enable => true,
	hasstatus => true,
	hasrestart => true,
	require => Package["tomcat7"],
}

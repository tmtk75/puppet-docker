class docker::centos::install {
  exec { epel:
    command => "rpm -Uvh http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm",
    creates => "/etc/yum.repos.d/epel.repo",
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
  }

  package { 'docker-io':
    ensure => present,
    require => Exec[epel],
  }
}

class docker::centos::config {
  file { '/etc/sysconfig/docker':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    =>  0644,
    content => 'other_args="-H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock"'
  }
}

class docker::centos::service {
  service { docker:
    ensure => running,
    subscribe => Class[docker::centos::config]
  }
}

class docker::centos {
  include install
  include config
  include service
  Class[install] -> Class[config] ->Class[service]
}


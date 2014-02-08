class docker::darwin::install {
}

class docker::darwin::service {
  service { docker:
    ensure => running,
  }
}

class docker::darwin {
  include install
  include service
  Class[install] -> Class[service]
}

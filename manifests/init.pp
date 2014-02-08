class docker {
  case $operatingsystem {
    'Darwin' : { include docker::darwin }
    'CentOS' : { include docker::centos }
  }
}

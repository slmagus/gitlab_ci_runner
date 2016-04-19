# == Class: cirunner::service
#
class cirunner::service {

  service { 'gitlab-runner':
    ensure => running,
    enable => true,
  }
}

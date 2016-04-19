# == Class: gitlab_ci_runner::service
#
class gitlab_ci_runner::service {

  service { 'gitlab-runner':
    ensure => running,
    enable => true,
  }
}

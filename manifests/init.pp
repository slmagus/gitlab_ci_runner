# == Class: cirunner
#
class cirunner (
  $manage_repo = true,
  $install_package = true,
  ){

    class { '::cirunner::install': } ->
    class { '::cirunner::config': } ~>
    class { '::cirunner::service': } ->
    Class['::cirunner']
}

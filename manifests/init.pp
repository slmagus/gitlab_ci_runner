class cirunner (
  Boolean $manage_repo = true,
  Boolean $install_package = true,
  ){

    class { '::cirunner::install': } ->
    class { '::cirunner::config': } ~>
    class { '::cirunner::service': } ->
    Class['::cirunner']
}

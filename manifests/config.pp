# == Class: cirunner::config
#
class gitlab_ci_runner::config(
  String $url          = undef,
  String $token        = undef,
  String $executor     = shell,
  [Optional]String $docker_image = undef,
  Array  $tags         = undef
){

    runner { 'testrunner':
      ensure       => present,
      url          => 'http://gitlab.nextworking.nl/ci',
      token        => 'iHbAMyeS1AVsDWvbMH4M',
      executor     => 'docker',
      docker_image => 'centos',
      tags         => 'dockerrunner',
    }

}

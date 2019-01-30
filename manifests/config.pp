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
      url          => 'https://gitlab.com',
      token        => 'asdf',
      executor     => 'docker',
      docker_image => 'docker:lastest',
      tags         => 'dockerrunner',
    }

}

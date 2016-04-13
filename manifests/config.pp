# == Class: cirunner::config
#
class cirunner::config {

  runner { 'testrunner':
    ensure       => present,
    url          => 'http://gitlab.nextworking.nl/ci',
    token        => 'iHbAMyeS1AVsDWvbMH4M',
    executor     => 'docker',
    docker_image => 'centos',
    tags         => 'dockerrunner',
  }

  runner { 'myrunner':
    ensure   => present,
    url      => 'http://gitlab.nextworking.nl/ci',
    token    => 'iHbAMyeS1AVsDWvbMH4M',
    executor => 'shell',
    tags     => 'shellrunner',
  }


}

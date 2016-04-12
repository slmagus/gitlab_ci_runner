# == Class: cirunner::install
#
class cirunner::install {

  if $::cirunner::manage_repo == true {
    yumrepo { 'runner_gitlab-ci-multi-runner':
      baseurl   => "https://packages.gitlab.com/runner/gitlab-ci-multi-runner/el/${::os['release']['major']}/${::os['architecture']}",
      descr     => 'Gitlab CI Multirunner repo',
      enabled   => '1',
      gpgcheck  => '0',
      gpgkey    => 'https://packages.gitlab.com/runner/gitlab-ci-multi-runner/gpgkey',
      sslverify => 1,
      sslcacert => '/etc/pki/tls/certs/ca-bundle.crt',
    }
  }

  if $::cirunner::install_package == true {
    package { 'gitlab-ci-multi-runner':
      ensure  => '1.1.2-1',
      require => Yumrepo['runner_gitlab-ci-multi-runner'],
    }
  }

}

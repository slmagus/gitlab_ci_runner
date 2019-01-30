# == Class: gitlab_ci_runner::install::linux
#
class gitlab_ci_runner::install::linux (
  $baseurl = "https://packages.gitlab.com/runner/gitlab-ci-multi-runner/el/${::os['release']['major']}/${::os['architecture']}",
  $gpgkey = 'https://packages.gitlab.com/runner/gitlab-ci-multi-runner/gpgkey',
  $sslcacert = '/etc/pki/tls/certs/ca-bundle.crt',
  $version = '1.1.2-1',
){

if $manage_repo {
    $repo_base_url = 'https://packages.gitlab.com'

    case $::osfamily {
      'Debian': {

        apt::source { 'apt_gitlabci':
          comment  => 'GitlabCI Runner Repo',
          location => "${repo_base_url}/runner/${package_name}/${::lsbdistid.downcase}/",
          repos    => 'main',
          key      => {
            'id'     => '1A4C919DB987D435939638B914219A96E15E78F4',
            'server' => 'keys.gnupg.net',
          },
          include  => {
            'src' => false,
            'deb' => true,
          },
        }
        Apt::Source['apt_gitlabci'] -> Package[$package_name]
        Exec['apt_update'] -> Package[$package_name]
      }
      'RedHat': {
        yumrepo { "runner_${package_name}":
          ensure        => 'present',
          baseurl       => "${repo_base_url}/runner/${package_name}/el/\$releasever/\$basearch",
          descr         => "runner_${package_name}",
          enabled       => '1',
          gpgcheck      => '0',
          gpgkey        => "${repo_base_url}/gpg.key",
          repo_gpgcheck => '1',
          sslcacert     => '/etc/pki/tls/certs/ca-bundle.crt',
          sslverify     => '1',
        }

        yumrepo { "runner_${package_name}-source":
          ensure        => 'present',
          baseurl       => "${repo_base_url}/runner/${package_name}/el/\$releasever/SRPMS",
          descr         => "runner_${package_name}-source",
          enabled       => '1',
          gpgcheck      => '0',
          gpgkey        => "${repo_base_url}/gpg.key",
          repo_gpgcheck => '1',
          sslcacert     => '/etc/pki/tls/certs/ca-bundle.crt',
          sslverify     => '1',
        }
      }
      default: {
        fail ("gitlab_ci_runner::manage_repo parameter for ${::osfamily} is not supported.")
      }
    }
  }

  package { $package_name:
    ensure => $package_ensure,

  }
}

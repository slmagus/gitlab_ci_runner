# == Class: cirunner::install::windows
#
class gitlab_ci_runner::install::windows (
  $url = 'https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-windows-amd64.exe',
  $install_folder = 'C:\GitlabRunner'
){

  dsc_file {'install_folder':
    dsc_ensure          => present,
    dsc_type            => 'Directory',
    dsc_destinationpath => $install_dir,
  } ->

  dsc_xremotefile {'gitlab_runner' :
    dsc_destinationpath => $install_dir,
    dsc_uri             => $url,
  }
}

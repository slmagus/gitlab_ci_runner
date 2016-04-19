[![Build Status](https://travis-ci.org/bazzie/gitlab_ci_runner.svg?branch=master)](https://travis-ci.org/bazzie/gitlab_ci_runner)
[![Puppet Forge](https://img.shields.io/puppetforge/e/bazzie/gitlab_ci_runner.svg)](https://forge.puppetlabs.com/bazzie/gitlab_ci_runner)
[![Puppet Forge](https://img.shields.io/puppetforge/v/bazzie/gitlab_ci_runner.svg)](https://forge.puppetlabs.com/bazzie/gitlab_ci_runner)
[![Puppet Forge](https://img.shields.io/puppetforge/f/bazzie/gitlab_ci_runner.svg)](https://forge.puppetlabs.com/bazzie/gitlab_ci_runner)

# gitlab_ci_runner

Manage config and installation of Gitlab CI runner

This module may be used with a simple `include ::gitlab_ci_cirunner`

===

### Table of Contents
1. [Compatibility](#compatibility)
1. [Parameters](#parameters)
1. [Examples](#sample-usage)

===

# Compatibility

This module has been tested to work on the following systems with Puppet
versions 4.x with Ruby versions 1.9.3, 2.0.0 and 2.1.0.

Operating systems:
* EL 7
* Microsoft Windows 2012(R2)

===

# Dependencies

* pupeptlabs/stdlib
* puppetlabs/dsc

# Limitations

The Linux cirunner type is limited to the following executors:
* shell
* docker

# Parameters

manage_repo
-----------
Manages the Gitlab CI runner YUM repository

- *Default*: true

install_package
-----------
Manages the Gitlab CI package installation

- *Default*: true

# Parameters for cirunner type

url
-----------
The Gitlab CI url

- *Default*: undef

token
-----------
The Gitlab CI registration token

- *Default*: undef

executor
-----------
The CI runner executor (shell (windows/linux), docker(linux only))

- *Default*: 'shell'

docker_image
-----------
The docker image used by the docker executor (Linux only)

- *Default*: undef

tags
-----------
The runner tags (Used to choose witch runner to use at build time)

- *Default*: undef


## Sample usage:

``` Puppet
runner { 'testrunner':
  ensure       => present,
  url          => 'http://<gitlab.url>/ci',
  token        => '<TOKEN>',
  executor     => 'docker',
  docker_image => 'centos/latest',
  tags         => 'dockerrunner',
}
```

## Disclaimer

This module is far from complete and under heavy development.
Feel free to comment or contribute!

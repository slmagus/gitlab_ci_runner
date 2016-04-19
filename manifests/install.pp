# == Class: cirunner::install
#
class cirunner::install::linux {

  case $::kernel {
    'Linux':  { include ::cirunner::install::linux }
    'windows': { include ::cirunner::install::windows }
    default: { error("Operatingsystem $::{'operatingsystem'} is not supported.") }
  }

}

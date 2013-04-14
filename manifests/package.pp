# Class: nodejs::package
#
# This module manages nodejs and npm package installation
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
class nodejs::package {
  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin'
  }

  package { 'software-properties-common':
    ensure => latest,
  }

  exec { 'add-nodejs-repo':
    command => 'add-apt-repository -y ppa:chris-lea/node.js && apt-get update',
    unless  => 'apt-cache policy | grep chris-lea/node.js',
    require => Package['software-properties-common']
  }

  package { 'nodejs':
    ensure  => latest,
    require => Exec['add-nodejs-repo']
  }
}
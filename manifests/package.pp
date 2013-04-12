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
  package { 'nodejs':
    ensure => latest,
  }
  package { 'npm':
    ensure => latest,
  }
}
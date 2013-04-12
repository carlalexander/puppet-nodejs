# Class: nodejs
#
# This module manages nodejs.
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
# The module works with sensible defaults:
#
# node default {
#   include nodejs
# }
class nodejs {
  class { 'nodejs::package': }
}
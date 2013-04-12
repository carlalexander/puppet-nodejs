# Define: nodejs::resource::module
#
# This definition manages npm modules.
#
# Parameters:
#   [*module*]     - Module name. Default [$name]
#   [*autoupdate*] - Autoupdate flag. Default: true
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#   nodejs::resource::module { 'test': }
define nodejs::resource::module (
  $module     = $name,
  $autoupdate = true
) {
  Exec {
    path    => '/bin:/sbin:/usr/bin:/usr/sbin',
    require => Package['npm']
  }

  exec { "nodejs-install-${module}-module":
    command => "npm install ${module}",
    unless  => "npm list | grep ${module}"
  }

  if ($autoupdate) {
    exec { "nodejs-update-${module}-module":
      command => "npm update ${module}",
      require => Exec["nodejs-install-${module}-module"]
    }
  }
}
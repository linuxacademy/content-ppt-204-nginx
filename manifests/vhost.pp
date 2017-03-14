define nginx::vhost(
  Integer $port                        = 80,
  String $priority                     = '50',
  String $server_aliases               = '',
  Boolean $enable                      = true,
  String $owner                        = $::nginx::config_owner,
  String $group                        = $::nginx::config_group,
  String $mode                         = $::nginx::config_mode,
  Optional[String] $config_vdir_enable = $::nginx::config_vdir_enable,
  String $log_dir                      = $::nginx::config_log_dir,
  String $vhost_dir                    = $::nginx::vhost_dir,
) {
  $vhost_docroot = "$::nginx::docroot/$name"
  
  file { "${vhost_dir}/${priority}-${name}.conf":
    content => template("${module_name}/vhost/vhost.conf.erb"),
    mode    => $mode,
    owner   => $owner,
    group   => $group,
    notify  => Service['nginx_service'],
  }

  file { "$vhost_docroot": 
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => '0775',
  }
}

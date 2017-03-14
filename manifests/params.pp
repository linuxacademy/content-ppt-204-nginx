class nginx::params {
  $ensure        = 'present'
  $package_name  = 'nginx'
  $config_dir    = '/etc/nginx'
  $config_ensure = 'file'
  $config_mode   = '0664'
  $config_owner  = 'root'
  $config_group  = 'root'
  $config_confd  = "${config_dir}/conf.d"
  $config_log_dir = '/var/log/nginx'
  $config_pid_file = '/run/nginx.pid'

  $config_vdir_enable = $facts['os']['family'] ? {
    'Debian' => "${config_dir}",
    default  => undef,
  }

  $config_process_user = $facts['os']['family'] ? {
    'Debian' => 'www-data',
    default  => 'nginx',
  }
  
  $vhost_dir = $facts['os']['family'] ? {
    'Debian' => "${config_dir}/sites-avaliable",
    default  => "${config_confd}"
  }
  
  $service_name = 'nginx'
  $service_ensure = 'running'
  $service_pattern = 'nginx'
  $service_enable = true
  $service_hasstatus = true
  $service_hasrestart = true
  
  $docroot = '/usr/share/nginx'
}

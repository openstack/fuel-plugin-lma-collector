define heka::output::elasticsearch (
  $ensure = present,
  $config_dir,
  $server = undef,
  $port = undef,
  $encoder = $title,
  $message_matcher = 'FALSE',
  $flush_interval = 5,
  $flush_count = 10,
) {

  include heka::params

  file { "${config_dir}/output-${title}.toml":
    ensure  => $ensure,
    content => template('heka/output/elasticsearch.toml.erb'),
    mode    => '0600',
    owner   => $heka::params::user,
    group   => $heka::params::user,
    require => File[$config_dir],
 }
}


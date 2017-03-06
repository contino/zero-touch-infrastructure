# == Class compliance
#
class compliance (
  $compliance_text = $::compliance::params::compliance_text,
) inherits compliance::params {

  file { '/tmp/compliance':
    ensure  => file,
    mode    => '0644',
    content => template('compliance/compliance.erb')
  }

}

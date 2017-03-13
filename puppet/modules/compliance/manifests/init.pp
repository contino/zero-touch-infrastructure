# == Class compliance
#
class compliance (
  $insec_compliance_text  = $::compliance::params::insec_compliance_text,
  $finsec_compliance_text = $::compliance::params::finsec_compliance_text,
  $pubsec_compliance_text = $::compliance::params::pubsec_compliance_text,
) inherits compliance::params {

  file { '/tmp/insec-compliance':
    ensure  => file,
    mode    => '0644',
    content => template('compliance/insec_compliance.erb')
  }

  file { '/tmp/finsec-compliance':
    ensure  => file,
    mode    => '0644',
    content => template('compliance/finsec_compliance.erb')
  }

  file { '/tmp/pubsec-compliance':
    ensure  => file,
    mode    => '0644',
    content => template('compliance/pubsec_compliance.erb')
  }

}

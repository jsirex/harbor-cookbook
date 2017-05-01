# frozen_string_literal: true

# Docker image
default['harbor']['registry']['image'] = 'vmware/registry'
default['harbor']['registry']['tag'] = 'photon-2.6.0'

default['harbor']['registry']['etc_dir'] = '/etc/harbor/registry'
default['harbor']['registry']['storage_dir'] = '/opt/harbor/registry'

# Standard registry config from https://docs.docker.com/registry/configuration/#list-of-configuration-options
default['harbor']['registry']['config']['version'] = '0.1'

default['harbor']['registry']['config']['log']['level'] = 'debug'
default['harbor']['registry']['config']['log']['fields']['service'] = 'registry'
default['harbor']['registry']['config']['log']['fields']['environment'] = node.chef_environment

default['harbor']['registry']['config']['storage']['cache']['layerinfo'] = 'inmemory'
default['harbor']['registry']['config']['storage']['filesystem']['rootdirectory'] = '/storage'
default['harbor']['registry']['config']['storage']['maintenance']['uploadpurging']['enabled'] = false
default['harbor']['registry']['config']['storage']['delete']['enabled'] = true

# Bind registry to port 5000
default['harbor']['registry']['config']['http']['addr'] = ':5000'
default['harbor']['registry']['config']['http']['debug']['addr'] = 'localhost:5001'
default['harbor']['registry']['config']['http']['secret'] = 'placeholder uniq secret for registry but same for the cluster???'

default['harbor']['registry']['config']['auth']['token']['realm'] = 'http://ui/service/token'
default['harbor']['registry']['config']['auth']['token']['service'] = 'harbor-registry'
default['harbor']['registry']['config']['auth']['token']['issuer'] = 'harbor-token-issuer'
default['harbor']['registry']['config']['auth']['token']['rootcertbundle'] = '/etc/registry/root.crt'

# Arrays are bad. It is hard to manage or override inner value :(
default['harbor']['registry']['config']['notifications']['endpoints'] = [
  {
    'name' => 'harbor',
    'disabled' => false,
    'url' => 'http://ui/service/notifications',
    'timeout' => '3000ms',
    'threshold' => 5,
    'backoff' => '1s'
  }
]

default['harbor']['registry']['env']['GODEBUG'] = 'netdns=cgo'

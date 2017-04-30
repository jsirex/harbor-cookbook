# frozen_string_literal: true

default['harbor']['registry']['etc_dir'] = '/etc/registry'
default['harbor']['registry']['storage_dir'] = '/opt/registry'

default['harbor']['registry']['config']['version'] = '0.1'

default['harbor']['registry']['config']['log']['level'] = 'debug'
default['harbor']['registry']['config']['log']['fields']['service'] = 'registry'

default['harbor']['registry']['config']['storage']['cache']['layerinfo'] = 'inmemory'
default['harbor']['registry']['config']['storage']['filesystem']['rootdirectory'] = '/storage'
default['harbor']['registry']['config']['storage']['maintenance']['uploadpurging']['enabled'] = false
default['harbor']['registry']['config']['storage']['delete']['enabled'] = true

default['harbor']['registry']['config']['http']['addr'] = ':5000'
default['harbor']['registry']['config']['http']['secret'] = 'placeholder'
default['harbor']['registry']['config']['http']['debug']['addr'] = 'localhost:5001'

default['harbor']['registry']['config']['auth']['token']['issuer'] = 'harbor-token-issuer'
default['harbor']['registry']['config']['auth']['token']['realm'] = 'http://ui/service/token'
default['harbor']['registry']['config']['auth']['token']['rootcertbundle'] = '/etc/registry/root.crt'
default['harbor']['registry']['config']['auth']['token']['service'] = 'harbor-registry'

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

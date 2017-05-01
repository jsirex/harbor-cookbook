# frozen_string_literal: true

docker_image 'vmware/notary-photon' do
  tag 'server-0.5.0'
  action :pull
end

docker_container 'harbor-notary-server' do
  repo 'vmware/notary-photon'
  tag 'server-0.5.0'
  restart_policy 'always'

  volumes [
    './common/config/notary:/config'
  ]

  entrypoint '/usr/bin/env sh'
  command '-c /migrations/migrate.sh && notary-server -config=/config/server-config.json -logf=logfmt'

  network_mode 'harbor'
  network_aliases ['notary-server']

  log_driver 'syslog'
  log_opts 'syslog-address' => 'tcp://127.0.0.1:1514', 'tag' => 'notary-server'
end

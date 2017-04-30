# frozen_string_literal: true

docker_image 'vmware/notary-photon' do
  tag 'signer-0.5.0'
  action :pull
end

docker_container 'notary-signer' do
  repo 'vmware/notary-photon'
  tag 'signer-0.5.0'
  restart_policy 'always'
  restart_maximum_retry_count 5

  volumes [
    './common/config/notary:/config'
  ]

  env ['TODO=from env ./common/config/notary/signer_env']

  entrypoint '/usr/bin/env sh'
  command '-c /migrations/migrate.sh && notary-signer -config=/config/signer-config.json -logf=logfmt'

  network_mode 'harbor'

  log_driver 'syslog'
  log_opts 'syslog-address' => 'tcp://127.0.0.1:1514', 'tag' => 'notary-signer'
end

# frozen_string_literal: true

docker_image 'vmware/nginx' do
  tag '1.11.5-patched'
  action :pull
end

docker_container 'nginx' do
  repo 'vmware/nginx'
  tag '1.11.5-patched'

  restart_policy 'always'
  restart_maximum_retry_count 5

  port ['80:80', '443:443', '4443:4443']

  volumes [
    './common/config/nginx:/etc/nginx:z'
  ]

  network_mode 'harbor'

  log_driver 'syslog'
  log_opts 'syslog-address' => 'tcp://127.0.0.1:1514', 'tag' => 'proxy'
end

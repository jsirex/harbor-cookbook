# frozen_string_literal: true

docker_image 'vmware/harbor-jobservice' do
  tag 'v1.1.0'
  action :pull
end

docker_container 'harbor-jobservice' do
  repo 'vmware/harbor-jobservice'
  tag 'v1.1.0'
  restart_policy 'always'
  restart_maximum_retry_count 5

  env ['TODO=from file ./common/config/jobservice/env']

  volumes [
    '/data/job_logs:/var/log/jobs:z',
    './common/config/jobservice/app.conf:/etc/jobservice/app.conf:z',
    '/data/secretkey:/etc/jobservice/key:z'
  ]

  network_mode 'harbor'

  log_driver 'syslog'
  log_opts 'syslog-address' => 'tcp://127.0.0.1:1514', 'tag' => 'jobservice'
end

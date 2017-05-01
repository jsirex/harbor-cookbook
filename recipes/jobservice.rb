# frozen_string_literal: true

jobservice = node['harbor']['jobservice']
env_array = jobservice['env'].collect { |x, y| "#{x}=#{y}" }

directory jobservice['etc_dir'] do
  recursive true
end

template jobservice['env']['CONFIG_PATH'] do
  source 'jobservice/app.conf.erb'
  variables jobservice['config']

  notifies :restart, 'docker_container[harbor-jobservice]', :delayed
end

docker_image 'vmware/harbor-jobservice' do
  tag 'v1.1.0'
  action :pull
end

docker_container 'harbor-jobservice' do
  repo 'vmware/harbor-jobservice'
  tag 'v1.1.0'

  restart_policy 'always'

  env env_array

  volumes [
    '/var/log/job_logs:/var/log/jobs:z',
    '/etc/jobservice/app.conf:/etc/jobservice/app.conf:z',
    '/opt/harbor/adminserver/secretkey:/etc/jobservice/key:z'
  ]

  network_mode 'harbor'
  network_aliases ['jobservice']

  log_driver 'syslog'
  log_opts 'syslog-address' => 'tcp://127.0.0.1:1514', 'tag' => 'jobservice'
end

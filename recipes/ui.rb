# frozen_string_literal: true

ui = node['harbor']['ui']
env_array = ui['env'].collect { |x, y| "#{x}=#{y}" }

directory ui['etc_dir']

template ui['env']['CONFIG_PATH'] do
  source 'ui/app.conf.erb'
  variables ui['config']

  notifies :restart, 'docker_container[harbor-ui]', :delayed
end

docker_image 'vmware/harbor-ui' do
  tag 'v1.1.0'
  action :pull
end

docker_container 'harbor-ui' do
  repo 'vmware/harbor-ui'
  tag 'v1.1.0'

  restart_policy 'always'

  env env_array

  volumes [
    '/etc/ui/app.conf:/etc/ui/app.conf:z',
    '/etc/ui/private_key.pem:/etc/ui/private_key.pem:z',
    '/opt/harbor/adminserver/secretkey:/etc/ui/key:z'
    # '/data/ca_download/:/etc/ui/ca/:z'
  ]

  network_mode 'harbor'
  network_aliases ['ui']

  log_driver 'syslog'
  log_opts 'syslog-address' => 'tcp://127.0.0.1:1514', 'tag' => 'ui'
end

# frozen_string_literal: true

adminserver = node['harbor']['adminserver']
env_array = adminserver['env'].collect { |x, y| "#{x}=#{y}" }

directory adminserver['config_dir'] do
  recursive true
end

directory adminserver['data_dir'] do
  recursive true
end

file adminserver['secretkey'] do
  content '1234567890123456'
end

docker_image 'vmware/harbor-adminserver' do
  tag 'v1.1.0'
  action :pull
end

docker_container 'harbor-adminserver' do
  repo 'vmware/harbor-adminserver'
  tag 'v1.1.0'
  restart_policy 'always'

  env env_array

  volumes [
    "#{adminserver['config_dir']}:/etc/adminserver/config:z",
    "#{adminserver['data_dir']}:/data:z",
    "#{adminserver['secretkey']}:/etc/adminserver/key:z"
  ]

  network_mode 'harbor'

  log_driver 'syslog'
  log_opts 'syslog-address' => 'tcp://127.0.0.1:1514', 'tag' => 'adminserver'
end

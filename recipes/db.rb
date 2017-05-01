# frozen_string_literal: true

mysql = node['harbor']['mysql']
env_array = mysql['env'].collect { |x, y| "#{x}=#{y}" }

directory mysql['db_path']

docker_image 'vmware/harbor-db' do
  tag 'v1.1.0'
  action :pull
end

docker_container 'harbor-db' do
  repo 'vmware/harbor-db'
  tag 'v1.1.0'
  restart_policy 'always'

  env env_array

  volumes [
    "#{mysql['db_path']}:/var/lib/mysql:z"
  ]

  network_mode 'harbor'
  network_aliases ['mysql']

  log_driver 'syslog'
  log_opts 'syslog-address' => 'tcp://127.0.0.1:1514', 'tag' => 'mysql'
end

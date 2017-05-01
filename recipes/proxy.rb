# frozen_string_literal: true

proxy = node['harbor']['proxy']

directory proxy['etc_dir'] do
  recursive true
end

template '/etc/nginx/nginx.conf' do
  source 'proxy/nginx.http.conf'

  notifies :restart, 'docker_container[harbor-proxy]'
end

docker_image 'vmware/nginx' do
  tag '1.11.5-patched'
  action :pull
end

docker_container 'harbor-proxy' do
  repo 'vmware/nginx'
  tag '1.11.5-patched'
  host_name 'nginx'
  restart_policy 'always'

  port ['80:80', '443:443', '4443:4443']

  volumes [
    '/etc/nginx:/etc/nginx:z'
  ]

  network_mode 'harbor'
  network_aliases ['nginx']

  log_driver 'syslog'
  log_opts 'syslog-address' => 'tcp://127.0.0.1:1514', 'tag' => 'proxy'
end

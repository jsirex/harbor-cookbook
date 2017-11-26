# frozen_string_literal: true

log = node['harbor']['log']

directory log['log_dir'] do
  recursive true
end

docker_image log['image'] do
  tag log['tag']
  action :pull
end

docker_container 'harbor-log' do
  repo log['image']
  tag log['tag']
  restart_policy 'always'

  volumes ["#{log['log_dir']}:/var/log/docker/:z"]

  port ['127.0.0.1:1514:514']

  network_mode 'harbor'

  # BUG: why do I need this alias?
  network_aliases ['log']
end

# frozen_string_literal: true

directory '/var/log/harbor'

docker_image 'vmware/harbor-log' do
  tag 'v1.1.0'
  action :pull
end

docker_container 'harbor-log' do
  repo 'vmware/harbor-log'
  tag 'v1.1.0'
  restart_policy 'always'

  volumes ['/var/log/harbor/:/var/log/docker/:z']
  port ['127.0.0.1:1514:514']
  network_mode 'harbor'
end

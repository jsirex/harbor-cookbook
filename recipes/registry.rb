# frozen_string_literal: true

registry = node['harbor']['registry']

directory registry['etc_dir']
directory registry['storage_dir']

file ::File.join(registry['etc_dir'], 'config.yml') do
  content registry['config'].to_hash.to_yaml

  notifies :restart, 'docker_container[registry]', :delayed
end

# search ssl cert by harbor-registry
# if found
#   file
# else
#   cookbook_file 'root.crt'
cookbook_file ::File.join(registry['etc_dir'], 'root.crt') do
  source 'registry/root.crt'
  owner 'root'
  group 'root'
  mode '0440'

  action :create
end

docker_image 'vmware/registry' do
  tag 'photon-2.6.0'
  action :pull
end

docker_container 'registry' do
  repo 'vmware/registry'
  tag 'photon-2.6.0'
  restart_policy 'always'
  volumes [
    "#{registry['etc_dir']}:#{registry['etc_dir']}:z",
    "#{registry['storage_dir']}:#{registry['storage_dir']}:z"
  ]

  network_mode 'harbor'
  command "serve #{registry['etc_dir']}/config.yml"

  log_driver 'syslog'
  log_opts 'syslog-address' => 'tcp://127.0.0.1:1514', 'tag' => 'registry'
end

# frozen_string_literal: true

registry = node['harbor']['registry']
env_array = registry['env'].collect { |x, y| "#{x}=#{y}" }

directory registry['etc_dir'] do
  recursive true
end

directory registry['storage_dir'] do
  recursive true
end

file ::File.join(registry['etc_dir'], 'config.yml') do
  content registry['config'].to_hash.to_yaml

  notifies :restart, 'docker_container[harbor-registry]', :delayed
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

docker_image registry['image'] do
  tag registry['tag']
  action :pull
end

# BUG: in compose container name is registry
docker_container 'harbor-registry' do
  repo registry['image']
  tag registry['tag']

  restart_policy 'always'

  env env_array

  volumes [
    "#{registry['etc_dir']}:/etc/registry:z",
    "#{registry['storage_dir']}:/storage:z"
  ]

  network_mode 'harbor'

  # BUG: why do I need this alias?
  network_aliases ['registry']

  command 'serve /etc/registry/config.yml'

  log_driver 'syslog'
  # BUG: rename registry -> harbor-registry?
  log_opts 'syslog-address' => 'tcp://127.0.0.1:1514', 'tag' => 'registry'
end

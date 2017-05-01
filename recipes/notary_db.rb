# frozen_string_literal: true

docker_image 'vmware/harbor-notary-db' do
  tag 'mariadb-10.1.10'
  action :pull
end

docker_container 'harbor-notary-db' do
  repo 'vmware/harbor-notary-db'
  tag 'mariadb-10.1.10'
  restart_policy 'always'

  volumes [
    './common/config/notary/mysql-initdb.d:/docker/entrypoint-initdb.d',
    '/data/notary-db:/var/lib/mysql'
  ]

  env ['TERM=dumb', 'MYSQL_ALLOW_EMPTY_PASSWORD="true"']

  command 'mysqld --innodb_file_per_table'

  network_mode 'harbor'
  network_aliases ['notary-db']

  log_driver 'syslog'
  log_opts 'syslog-address' => 'tcp://127.0.0.1:1514', 'tag' => 'notary-db'
end

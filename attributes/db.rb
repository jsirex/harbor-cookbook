# frozen_string_literal: true

default['harbor']['db']['db_path'] = '/var/lib/mysql'

default['harbor']['db']['env']['MYSQL_ROOT_PASSWORD'] = 'mysql_password'

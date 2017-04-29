# frozen_string_literal: true

default['harbor']['mysql']['db_path'] = '/var/lib/mysql'

default['harbor']['mysql']['env']['MYSQL_ROOT_PASSWORD'] = 'mysql_password'

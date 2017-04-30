# frozen_string_literal: true

default['harbor']['log']['log_dir'] = '/var/log/harbor'
default['harbor']['log']['image'] = 'vmware/harbor-log'
default['harbor']['log']['tag'] = 'v1.1.0'

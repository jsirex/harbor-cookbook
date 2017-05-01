# frozen_string_literal: true

default['harbor']['jobservice']['etc_dir'] = '/etc/jobservice'

default['harbor']['jobservice']['env']['LOG_LEVEL'] = 'debug'
default['harbor']['jobservice']['env']['CONFIG_PATH'] = '/etc/jobservice/app.conf'
default['harbor']['jobservice']['env']['UI_SECRET'] = 'ui_secret_token'
default['harbor']['jobservice']['env']['JOBSERVICE_SECRET'] = 'jobservice_secret_token'
default['harbor']['jobservice']['env']['GODEBUG'] = 'netdns=cgo'

# Configuration
default['harbor']['jobservice']['config']['appname'] = 'jobservice'
default['harbor']['jobservice']['config']['runmode'] = 'prod' # was dev, changed
default['harbor']['jobservice']['config']['port'] = 80

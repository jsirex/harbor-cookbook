# frozen_string_literal: true

default['harbor']['ui']['etc_dir'] = '/etc/ui'

default['harbor']['ui']['env']['LOG_LEVEL'] = 'debug'
default['harbor']['ui']['env']['CONFIG_PATH'] = '/etc/ui/app.conf'
default['harbor']['ui']['env']['UI_SECRET'] = 'ui_secret_token'
default['harbor']['ui']['env']['JOBSERVICE_SECRET'] = 'jobservice_secret_token'
default['harbor']['ui']['env']['GODEBUG'] = 'netdns=cgo'

# Configuration
default['harbor']['ui']['config']['appname'] = 'Harbor'
default['harbor']['ui']['config']['runmode'] = 'prod' # was dev, changed
default['harbor']['ui']['config']['enablegzip'] = true
default['harbor']['ui']['config']['port'] = 80

# frozen_string_literal: true

## Configuration file of Harbor

# The IP address or hostname to access admin UI and registry service.
# DO NOT use localhost or 127.0.0.1, because Harbor needs to be accessed by external clients.
default['harbor']['config']['hostname'] = node['fqdn']

# The protocol for accessing the UI and token/notification service, by default it is http.
# It can be set to https if ssl is enabled on nginx.
default['harbor']['config']['ui_url_protocol'] = 'http'

# Email account settings for sending out password resetting emails.

# Email server uses the given username and password to authenticate on TLS connections to host and act as identity.
# Identity left blank to act as username.
default['harbor']['config']['email_identity'] = ''
default['harbor']['config']['email_server'] = 'smtp.mydomain.com'
default['harbor']['config']['email_server_port'] = 25
default['harbor']['config']['email_username'] = 'sample_admin@mydomain.com'
default['harbor']['config']['email_password'] = 'abc'
default['harbor']['config']['email_from'] = 'admin <sample_admin@mydomain.com>'
default['harbor']['config']['email_ssl'] = false

# #The initial password of Harbor admin, only works for the first time when Harbor starts.
# It has no effect after the first launch of Harbor.
# Change the admin password from UI after launching Harbor.
default['harbor']['config']['harbor_admin_password'] = 'Harbor12345'

# By default the auth mode is db_auth, i.e. the credentials are stored in a local database.
# Set it to ldap_auth if you want to verify a user's credentials against an LDAP server.
default['harbor']['config']['auth_mode'] = 'db_auth'

# The password for the root user of mysql db, change this before any production use.
default['harbor']['config']['db_password'] = 'root123'

# Turn on or off the self-registration feature
default['harbor']['config']['self_registration'] = 'off'

# Determine whether the UI should use compressed js files.
# For production, set it to on. For development, set it to off.
default['harbor']['config']['use_compressed_js'] = 'on'

# The expiration time (in minute) of token created by token service, default is 30 minutes
default['harbor']['config']['token_expiration'] = 30

# Determine whether the job service should verify the ssl cert when it connects to a remote registry.
# Set this flag to off when the remote registry uses a self-signed or untrusted certificate.
default['harbor']['config']['verify_remote_cert'] = 'on'

# Determine whether or not to generate certificate for the registry's token.
# If the value is on, the prepare script creates new root cert and private key
# for generating token to access the registry. If the value is off, a key/certificate must
# be supplied for token generation.
default['harbor']['config']['customize_crt'] = 'on'

# Information of your organization for certificate
default['harbor']['config']['crt_country'] = 'CN'
default['harbor']['config']['crt_state'] = 'State'
default['harbor']['config']['crt_location'] = 'CN'
default['harbor']['config']['crt_organization'] = 'organization'
default['harbor']['config']['crt_organizationalunit'] = 'organizational unit'
default['harbor']['config']['crt_commonname'] = 'example.com'
default['harbor']['config']['crt_email'] = 'example@example.com'

# The flag to control what users have permission to create projects
# Be default everyone can create a project, set to "adminonly" such that only admin can create project.
default['harbor']['config']['project_creation_restriction'] = 'everyone'

# The path of cert and key files for nginx, they are applied only the protocol is set to https
default['harbor']['config']['ssl_cert'] = '/data/cert/server.crt'
default['harbor']['config']['ssl_cert_key'] = '/data/cert/server.key'

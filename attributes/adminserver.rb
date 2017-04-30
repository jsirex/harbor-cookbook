# frozen_string_literal: true

# unknown folders and files
default['harbor']['adminserver']['config_dir'] = '/opt/harbor/adminserver/config'
default['harbor']['adminserver']['data_dir'] = '/opt/harbor/adminserver/data'
default['harbor']['adminserver']['secretkey'] = '/opt/harbor/adminserver/secretkey'

default['harbor']['adminserver']['env']['LOG_LEVEL'] = 'debug'
default['harbor']['adminserver']['env']['EXT_ENDPOINT'] = 'http://ui/'

# By default the auth mode is db_auth, i.e. the credentials are stored in a local database.
# Set it to ldap_auth if you want to verify a user's credentials against an LDAP server.
default['harbor']['adminserver']['env']['AUTH_MODE'] = 'db_auth'
default['harbor']['adminserver']['env']['SELF_REGISTRATION'] = 'off'

# The url for an ldap endpoint.
default['harbor']['adminserver']['env']['LDAP_URL'] = 'ldaps://ldap.mydomain.com'

# A user's DN who has the permission to search the LDAP/AD server.
# If your LDAP/AD server does not support anonymous search, you should configure this DN and ldap_search_pwd.
default['harbor']['adminserver']['env']['LDAP_SEARCH_DN'] = 'uid=searchuser,ou=people,dc=mydomain,dc=com'

# the password of the ldap_searchdn
default['harbor']['adminserver']['env']['LDAP_SEARCH_PWD'] = 'ldap_password'

# The base DN from which to look up a user in LDAP/AD
default['harbor']['adminserver']['env']['LDAP_BASE_DN'] = 'ou=people,dc=mydomain,dc=com'

# Search filter for LDAP/AD, make sure the syntax of the filter is correct.
default['harbor']['adminserver']['env']['LDAP_FILTER'] = '(objectClass=person)'

# The attribute used in a search to match a user, it could be uid, cn, email, sAMAccountName or other attributes depending on your LDAP/AD
default['harbor']['adminserver']['env']['LDAP_UID'] = 'uid'
# the scope to search for users, 1-LDAP_SCOPE_BASE, 2-LDAP_SCOPE_ONELEVEL, 3-LDAP_SCOPE_SUBTREE
default['harbor']['adminserver']['env']['LDAP_SCOPE'] = '3'

default['harbor']['adminserver']['env']['LDAP_TIMEOUT'] = '5'

default['harbor']['adminserver']['env']['DATABASE_TYPE'] = 'mysql'
default['harbor']['adminserver']['env']['MYSQL_HOST'] = 'mysql'
default['harbor']['adminserver']['env']['MYSQL_PORT'] = '3306'
default['harbor']['adminserver']['env']['MYSQL_USR'] = 'root'
default['harbor']['adminserver']['env']['MYSQL_PWD'] = 'mysql_password'
default['harbor']['adminserver']['env']['MYSQL_DATABASE'] = 'registry'

default['harbor']['adminserver']['env']['REGISTRY_URL'] = 'http://registry:5000'
default['harbor']['adminserver']['env']['TOKEN_SERVICE_URL'] = 'http://ui/service/token'

default['harbor']['adminserver']['env']['EMAIL_HOST'] = 'smtp.mydomain.com'
default['harbor']['adminserver']['env']['EMAIL_PORT'] = '25'
default['harbor']['adminserver']['env']['EMAIL_USR'] = 'sample_admin@mydomain.com'
default['harbor']['adminserver']['env']['EMAIL_PWD'] = 'abc'
default['harbor']['adminserver']['env']['EMAIL_SSL'] = 'false'
default['harbor']['adminserver']['env']['EMAIL_FROM'] = 'admin <sample_admin@mydomain.com>'
default['harbor']['adminserver']['env']['EMAIL_IDENTITY'] = ''

default['harbor']['adminserver']['env']['HARBOR_ADMIN_PASSWORD'] = 'Harbor12345'

# The flag to control what users have permission to create projects
# Be default everyone can create a project, set to "adminonly" such that only admin can create project.
default['harbor']['adminserver']['env']['PROJECT_CREATION_RESTRICTION'] = 'adminonly'

default['harbor']['adminserver']['env']['VERIFY_REMOTE_CERT'] = 'on'

# Maximum number of job workers in job service
default['harbor']['adminserver']['env']['MAX_JOB_WORKERS'] = '3'
default['harbor']['adminserver']['env']['UI_SECRET'] = 'ui_secret_token'
default['harbor']['adminserver']['env']['JOBSERVICE_SECRET'] = 'jobservice_secret_token'

# The expiration time (in minute) of token created by token service, default is 30 minutes
default['harbor']['adminserver']['env']['TOKEN_EXPIRATION'] = '30'
default['harbor']['adminserver']['env']['CFG_EXPIRATION'] = '5'
default['harbor']['adminserver']['env']['GODEBUG'] = 'netdns=cgo'
default['harbor']['adminserver']['env']['ADMIRAL_URL'] = nil
default['harbor']['adminserver']['env']['WITH_NOTARY'] = 'true'
default['harbor']['adminserver']['env']['RESET'] = 'false'

# frozen_string_literal: true

include_recipe 'harbor::network'
include_recipe 'harbor::log'
# include_recipe 'harbor::registry'
# include_recipe 'harbor::db'
# include_recipe 'harbor::adminserver'
# include_recipe 'harbor::ui'
# include_recipe 'harbor::jobservice'
# include_recipe 'harbor::proxy'

# if node['harbor']['notary']['enabled']
#   include_recipe 'harbor::notary_db'
#   include_recipe 'harbor::notary_signer'
#   include_recipe 'harbor::notary_server'
# end

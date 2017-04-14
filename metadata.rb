# frozen_string_literal: true

name             'harbor'
maintainer       'Yauhen Artsiukhou'
maintainer_email 'jsirex@gmail.com'
license          'MIT'
description      'Installs and configures VMWare Harbor'
long_description 'Installs and configures VMWare Harbor'
issues_url       'https://github.com/jsirex/harbor-cookbook/issues'
source_url       'https://github.com/jsirex/harbor-cookbook'
version          '0.1.0'

depends 'docker'

supports 'debian'
supports 'ubuntu'

chef_version '>= 12.12'

recipe 'harbor::default', 'Installs and configures VMWare Harbor'

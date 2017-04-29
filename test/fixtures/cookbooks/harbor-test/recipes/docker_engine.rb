# frozen_string_literal: true

docker_installation_package 'default' do
  version '17.04.0'
  action :create
end

docker_service_manager 'default' do
  action :start
end

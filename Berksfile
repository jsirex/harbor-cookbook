# frozen_string_literal: true

source 'https://supermarket.chef.io'

metadata

group :integration do
  cookbook 'apt'
  cookbook 'yum'
  cookbook 'chef-apt-docker'
  cookbook 'chef-yum-docker'
  cookbook 'docker', github: 'jsirex/docker-cookbook'
  cookbook 'harbor-test', path: 'test/fixtures/cookbooks/harbor-test'
  cookbook 'harbor-spec', path: 'test/fixtures/cookbooks/harbor-spec'
end

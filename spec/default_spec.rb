# frozen_string_literal: true

require 'spec_helper'

describe 'harbor::default' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'debian', version: '8.7').converge(described_recipe)
  end

  it 'runs' do
    expect(chef_run)
  end
end

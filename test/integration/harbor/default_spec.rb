# frozen_string_literal: true

describe command('/bin/true') do
  its(:exit_status) { should eq 0 }
end

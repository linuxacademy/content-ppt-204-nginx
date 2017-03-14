require 'spec_helper'
describe 'nginx' do
  context 'with default values for all parameters' do
    it { should contain_class('nginx') }
  end
end

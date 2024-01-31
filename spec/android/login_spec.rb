require_relative '../base/login'
describe 'Login - Android' do
  include Test::Unit::Assertions
  login_with_valid_credentials
end

require 'test_helper'

class AuthTest < ActionDispatch::IntegrationTest
  test 'should authenticate with correct data' do
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('test', 'test')
    get '/api/test1'
    assert_equal 200, status
  end
end

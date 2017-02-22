require 'test_helper'

class AuthTest < ActionDispatch::IntegrationTest
  test 'should authenticate with correct data' do
    get '/api/test', params: {}, headers: { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('test', 'test') }
    assert_equal 200, status
  end

  test 'should not authenticate with incorrect data' do
    get '/api/test', params: {}, headers: { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('vasya', 'pupkin') }
    assert_equal 401, status
  end

  test 'should not authenticate without any data' do
    get '/api/test'
    assert_equal 401, status
  end
end

require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    auth_header = { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('test', 'test') }
    get '/api/v1/cards', params: {}, headers: auth_header
  end

  test 'index action should return correct status on index request' do
    assert_response :success
  end

  test 'index action should return an array' do
    assert_instance_of( Array, JSON.parse(response.body) )
  end

  test 'index action should return array of 3 elements' do
    assert_equal 3, JSON.parse(response.body).length
  end
end
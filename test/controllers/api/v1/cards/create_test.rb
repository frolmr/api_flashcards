require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_header = { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('test', 'test') }
  end

  test 'create action should return success response and message with correct data' do
    post '/api/v1/cards', params: { card: { original_text: 'test5', translated_text: 'тест5' } }, headers: @auth_header
    assert_response :success, message = 'new card saved'
  end

  test 'create action should return error response and message with incorrect data' do
    post '/api/v1/cards', params: { card: { original_text: 'test5' } }, headers: @auth_header
    assert_response :error, message = 'failed'
  end
end
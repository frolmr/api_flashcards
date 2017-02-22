require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = Card.first
    @auth_header = { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('test', 'test') }
  end

  test 'review card with correct translation should respond success' do
    post '/api/v1/review', params: { card_id: @card.id, translation: @card.translated_text }, headers: @auth_header
    assert_response :success, message = 'correct'
  end

  test 'review card with incorrect translation should respond error' do
    post '/api/v1/review', params: { card_id: @card.id, translation: 'Shit' }, headers: @auth_header
    assert_response :error, message = 'incorrect'
  end
end
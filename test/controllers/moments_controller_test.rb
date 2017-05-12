require 'test_helper'

class MomentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moment = moments(:one)
  end

  test "should get index" do
    get moments_url, as: :json
    assert_response :success
  end

  test "should create moment" do
    assert_difference('Moment.count') do
      post moments_url, params: { moment: { body: @moment.body, phone: @moment.phone, twilio_id: @moment.twilio_id, user_id: @moment.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show moment" do
    get moment_url(@moment), as: :json
    assert_response :success
  end

  test "should update moment" do
    patch moment_url(@moment), params: { moment: { body: @moment.body, phone: @moment.phone, twilio_id: @moment.twilio_id, user_id: @moment.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy moment" do
    assert_difference('Moment.count', -1) do
      delete moment_url(@moment), as: :json
    end

    assert_response 204
  end
end

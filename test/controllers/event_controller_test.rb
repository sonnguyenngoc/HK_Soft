require 'test_helper'

class EventControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get event_listing" do
    get :event_listing
    assert_response :success
  end

  test "should get event_detail" do
    get :event_detail
    assert_response :success
  end

end

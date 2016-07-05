require 'test_helper'

class TravelNewsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get travel_news_detail" do
    get :travel_news_detail
    assert_response :success
  end

end

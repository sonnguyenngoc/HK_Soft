require 'test_helper'

class TourHandbookControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get tour_handbook_sub_1" do
    get :tour_handbook_sub_1
    assert_response :success
  end

  test "should get tour_handbook_sub_2" do
    get :tour_handbook_sub_2
    assert_response :success
  end

  test "should get tour_handbook_detail" do
    get :tour_handbook_detail
    assert_response :success
  end

end

require 'test_helper'

class CarHireControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get car_list_view" do
    get :car_list_view
    assert_response :success
  end

  test "should get car_grid_view" do
    get :car_grid_view
    assert_response :success
  end

  test "should get car_detail" do
    get :car_detail
    assert_response :success
  end

end

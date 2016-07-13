require 'test_helper'

class TourControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get domestic_tour" do
    get :domestic_tour
    assert_response :success
  end

  test "should get foreign_tour" do
    get :foreign_tour
    assert_response :success
  end

  test "should get tour_packages" do
    get :tour_packages
    assert_response :success
  end

  test "should get tour_detail" do
    get :tour_detail
    assert_response :success
  end

  test "should get tour_booking" do
    get :tour_booking
    assert_response :success
  end

end

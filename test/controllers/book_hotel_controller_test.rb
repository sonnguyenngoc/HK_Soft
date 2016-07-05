require 'test_helper'

class BookHotelControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get book_hotel_detail" do
    get :book_hotel_detail
    assert_response :success
  end

  test "should get hotel_booking" do
    get :hotel_booking
    assert_response :success
  end

  test "should get slideshow_popup" do
    get :slideshow_popup
    assert_response :success
  end

end

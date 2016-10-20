require 'test_helper'

class QuickBookingHotelsControllerTest < ActionController::TestCase
  setup do
    @quick_booking_hotel = quick_booking_hotels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quick_booking_hotels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quick_booking_hotel" do
    assert_difference('QuickBookingHotel.count') do
      post :create, quick_booking_hotel: { adult: @quick_booking_hotel.adult, child: @quick_booking_hotel.child, date_from: @quick_booking_hotel.date_from, date_to: @quick_booking_hotel.date_to, email: @quick_booking_hotel.email, hotel_name: @quick_booking_hotel.hotel_name, location: @quick_booking_hotel.location, message: @quick_booking_hotel.message, name: @quick_booking_hotel.name, number: @quick_booking_hotel.number, passport: @quick_booking_hotel.passport, phone: @quick_booking_hotel.phone }
    end

    assert_redirected_to quick_booking_hotel_path(assigns(:quick_booking_hotel))
  end

  test "should show quick_booking_hotel" do
    get :show, id: @quick_booking_hotel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quick_booking_hotel
    assert_response :success
  end

  test "should update quick_booking_hotel" do
    patch :update, id: @quick_booking_hotel, quick_booking_hotel: { adult: @quick_booking_hotel.adult, child: @quick_booking_hotel.child, date_from: @quick_booking_hotel.date_from, date_to: @quick_booking_hotel.date_to, email: @quick_booking_hotel.email, hotel_name: @quick_booking_hotel.hotel_name, location: @quick_booking_hotel.location, message: @quick_booking_hotel.message, name: @quick_booking_hotel.name, number: @quick_booking_hotel.number, passport: @quick_booking_hotel.passport, phone: @quick_booking_hotel.phone }
    assert_redirected_to quick_booking_hotel_path(assigns(:quick_booking_hotel))
  end

  test "should destroy quick_booking_hotel" do
    assert_difference('QuickBookingHotel.count', -1) do
      delete :destroy, id: @quick_booking_hotel
    end

    assert_redirected_to quick_booking_hotels_path
  end
end

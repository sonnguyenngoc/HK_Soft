require 'test_helper'

class BookingHotelsControllerTest < ActionController::TestCase
  setup do
    @booking_hotel = booking_hotels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:booking_hotels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking_hotel" do
    assert_difference('BookingHotel.count') do
      post :create, booking_hotel: { adult: @booking_hotel.adult, child: @booking_hotel.child, date_from: @booking_hotel.date_from, date_to: @booking_hotel.date_to, email: @booking_hotel.email, full_name: @booking_hotel.full_name, hotel_room_id: @booking_hotel.hotel_room_id, hotel_room_name: @booking_hotel.hotel_room_name, phone: @booking_hotel.phone, price: @booking_hotel.price, room_number: @booking_hotel.room_number }
    end

    assert_redirected_to booking_hotel_path(assigns(:booking_hotel))
  end

  test "should show booking_hotel" do
    get :show, id: @booking_hotel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking_hotel
    assert_response :success
  end

  test "should update booking_hotel" do
    patch :update, id: @booking_hotel, booking_hotel: { adult: @booking_hotel.adult, child: @booking_hotel.child, date_from: @booking_hotel.date_from, date_to: @booking_hotel.date_to, email: @booking_hotel.email, full_name: @booking_hotel.full_name, hotel_room_id: @booking_hotel.hotel_room_id, hotel_room_name: @booking_hotel.hotel_room_name, phone: @booking_hotel.phone, price: @booking_hotel.price, room_number: @booking_hotel.room_number }
    assert_redirected_to booking_hotel_path(assigns(:booking_hotel))
  end

  test "should destroy booking_hotel" do
    assert_difference('BookingHotel.count', -1) do
      delete :destroy, id: @booking_hotel
    end

    assert_redirected_to booking_hotels_path
  end
end

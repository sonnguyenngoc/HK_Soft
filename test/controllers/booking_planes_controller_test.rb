require 'test_helper'

class BookingPlanesControllerTest < ActionController::TestCase
  setup do
    @booking_plane = booking_planes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:booking_planes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking_plane" do
    assert_difference('BookingPlane.count') do
      post :create, booking_plane: { address: @booking_plane.address, address_from: @booking_plane.address_from, address_to: @booking_plane.address_to, adult: @booking_plane.adult, child: @booking_plane.child, date_from: @booking_plane.date_from, date_to: @booking_plane.date_to, email: @booking_plane.email, full_name: @booking_plane.full_name, message: @booking_plane.message, phone: @booking_plane.phone, seat_number: @booking_plane.seat_number, ticket_type: @booking_plane.ticket_type }
    end

    assert_redirected_to booking_plane_path(assigns(:booking_plane))
  end

  test "should show booking_plane" do
    get :show, id: @booking_plane
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking_plane
    assert_response :success
  end

  test "should update booking_plane" do
    patch :update, id: @booking_plane, booking_plane: { address: @booking_plane.address, address_from: @booking_plane.address_from, address_to: @booking_plane.address_to, adult: @booking_plane.adult, child: @booking_plane.child, date_from: @booking_plane.date_from, date_to: @booking_plane.date_to, email: @booking_plane.email, full_name: @booking_plane.full_name, message: @booking_plane.message, phone: @booking_plane.phone, seat_number: @booking_plane.seat_number, ticket_type: @booking_plane.ticket_type }
    assert_redirected_to booking_plane_path(assigns(:booking_plane))
  end

  test "should destroy booking_plane" do
    assert_difference('BookingPlane.count', -1) do
      delete :destroy, id: @booking_plane
    end

    assert_redirected_to booking_planes_path
  end
end

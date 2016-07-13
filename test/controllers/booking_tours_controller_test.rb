require 'test_helper'

class BookingToursControllerTest < ActionController::TestCase
  setup do
    @booking_tour = booking_tours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:booking_tours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking_tour" do
    assert_difference('BookingTour.count') do
      post :create, booking_tour: { address: @booking_tour.address, adult: @booking_tour.adult, child: @booking_tour.child, email: @booking_tour.email, full_name: @booking_tour.full_name, message: @booking_tour.message, passport: @booking_tour.passport, phone: @booking_tour.phone, price: @booking_tour.price, tour_id: @booking_tour.tour_id, tour_name: @booking_tour.tour_name, tour_schedule_id: @booking_tour.tour_schedule_id }
    end

    assert_redirected_to booking_tour_path(assigns(:booking_tour))
  end

  test "should show booking_tour" do
    get :show, id: @booking_tour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking_tour
    assert_response :success
  end

  test "should update booking_tour" do
    patch :update, id: @booking_tour, booking_tour: { address: @booking_tour.address, adult: @booking_tour.adult, child: @booking_tour.child, email: @booking_tour.email, full_name: @booking_tour.full_name, message: @booking_tour.message, passport: @booking_tour.passport, phone: @booking_tour.phone, price: @booking_tour.price, tour_id: @booking_tour.tour_id, tour_name: @booking_tour.tour_name, tour_schedule_id: @booking_tour.tour_schedule_id }
    assert_redirected_to booking_tour_path(assigns(:booking_tour))
  end

  test "should destroy booking_tour" do
    assert_difference('BookingTour.count', -1) do
      delete :destroy, id: @booking_tour
    end

    assert_redirected_to booking_tours_path
  end
end

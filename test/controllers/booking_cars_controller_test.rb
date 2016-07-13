require 'test_helper'

class BookingCarsControllerTest < ActionController::TestCase
  setup do
    @booking_car = booking_cars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:booking_cars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking_car" do
    assert_difference('BookingCar.count') do
      post :create, booking_car: { address: @booking_car.address, address_from: @booking_car.address_from, address_to: @booking_car.address_to, date_from: @booking_car.date_from, date_to: @booking_car.date_to, email: @booking_car.email, full_name: @booking_car.full_name, phone: @booking_car.phone }
    end

    assert_redirected_to booking_car_path(assigns(:booking_car))
  end

  test "should show booking_car" do
    get :show, id: @booking_car
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking_car
    assert_response :success
  end

  test "should update booking_car" do
    patch :update, id: @booking_car, booking_car: { address: @booking_car.address, address_from: @booking_car.address_from, address_to: @booking_car.address_to, date_from: @booking_car.date_from, date_to: @booking_car.date_to, email: @booking_car.email, full_name: @booking_car.full_name, phone: @booking_car.phone }
    assert_redirected_to booking_car_path(assigns(:booking_car))
  end

  test "should destroy booking_car" do
    assert_difference('BookingCar.count', -1) do
      delete :destroy, id: @booking_car
    end

    assert_redirected_to booking_cars_path
  end
end

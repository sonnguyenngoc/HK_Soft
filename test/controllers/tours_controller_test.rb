require 'test_helper'

class ToursControllerTest < ActionController::TestCase
  setup do
    @tour = tours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tour" do
    assert_difference('Tour.count') do
      post :create, tour: { discount_percent: @tour.discount_percent, duration: @tour.duration, hotel: @tour.hotel, is_sale: @tour.is_sale, name: @tour.name, new_price: @tour.new_price, old_price: @tour.old_price, position: @tour.position, services: @tour.services, transportation: @tour.transportation, type: @tour.type }
    end

    assert_redirected_to tour_path(assigns(:tour))
  end

  test "should show tour" do
    get :show, id: @tour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tour
    assert_response :success
  end

  test "should update tour" do
    patch :update, id: @tour, tour: { discount_percent: @tour.discount_percent, duration: @tour.duration, hotel: @tour.hotel, is_sale: @tour.is_sale, name: @tour.name, new_price: @tour.new_price, old_price: @tour.old_price, position: @tour.position, services: @tour.services, transportation: @tour.transportation, type: @tour.type }
    assert_redirected_to tour_path(assigns(:tour))
  end

  test "should destroy tour" do
    assert_difference('Tour.count', -1) do
      delete :destroy, id: @tour
    end

    assert_redirected_to tours_path
  end
end

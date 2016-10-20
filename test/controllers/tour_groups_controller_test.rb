require 'test_helper'

class TourGroupsControllerTest < ActionController::TestCase
  setup do
    @tour_group = tour_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tour_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tour_group" do
    assert_difference('TourGroup.count') do
      post :create, tour_group: { address_from: @tour_group.address_from, date_from: @tour_group.date_from, date_to: @tour_group.date_to, message: @tour_group.message, number: @tour_group.number, price: @tour_group.price, tour_name: @tour_group.tour_name }
    end

    assert_redirected_to tour_group_path(assigns(:tour_group))
  end

  test "should show tour_group" do
    get :show, id: @tour_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tour_group
    assert_response :success
  end

  test "should update tour_group" do
    patch :update, id: @tour_group, tour_group: { address_from: @tour_group.address_from, date_from: @tour_group.date_from, date_to: @tour_group.date_to, message: @tour_group.message, number: @tour_group.number, price: @tour_group.price, tour_name: @tour_group.tour_name }
    assert_redirected_to tour_group_path(assigns(:tour_group))
  end

  test "should destroy tour_group" do
    assert_difference('TourGroup.count', -1) do
      delete :destroy, id: @tour_group
    end

    assert_redirected_to tour_groups_path
  end
end

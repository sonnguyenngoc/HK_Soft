require 'test_helper'

class HotelAreasControllerTest < ActionController::TestCase
  setup do
    @hotel_area = hotel_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotel_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotel_area" do
    assert_difference('HotelArea.count') do
      post :create, hotel_area: { name: @hotel_area.name }
    end

    assert_redirected_to hotel_area_path(assigns(:hotel_area))
  end

  test "should show hotel_area" do
    get :show, id: @hotel_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotel_area
    assert_response :success
  end

  test "should update hotel_area" do
    patch :update, id: @hotel_area, hotel_area: { name: @hotel_area.name }
    assert_redirected_to hotel_area_path(assigns(:hotel_area))
  end

  test "should destroy hotel_area" do
    assert_difference('HotelArea.count', -1) do
      delete :destroy, id: @hotel_area
    end

    assert_redirected_to hotel_areas_path
  end
end

require 'test_helper'

class BookingVisasControllerTest < ActionController::TestCase
  setup do
    @booking_visa = booking_visas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:booking_visas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking_visa" do
    assert_difference('BookingVisa.count') do
      post :create, booking_visa: { address: @booking_visa.address, cmnd_number: @booking_visa.cmnd_number, country_to: @booking_visa.country_to, date_of_issue: @booking_visa.date_of_issue, email: @booking_visa.email, full_name: @booking_visa.full_name, passport: @booking_visa.passport, phone: @booking_visa.phone, place_of_issue: @booking_visa.place_of_issue, visa_type: @booking_visa.visa_type }
    end

    assert_redirected_to booking_visa_path(assigns(:booking_visa))
  end

  test "should show booking_visa" do
    get :show, id: @booking_visa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking_visa
    assert_response :success
  end

  test "should update booking_visa" do
    patch :update, id: @booking_visa, booking_visa: { address: @booking_visa.address, cmnd_number: @booking_visa.cmnd_number, country_to: @booking_visa.country_to, date_of_issue: @booking_visa.date_of_issue, email: @booking_visa.email, full_name: @booking_visa.full_name, passport: @booking_visa.passport, phone: @booking_visa.phone, place_of_issue: @booking_visa.place_of_issue, visa_type: @booking_visa.visa_type }
    assert_redirected_to booking_visa_path(assigns(:booking_visa))
  end

  test "should destroy booking_visa" do
    assert_difference('BookingVisa.count', -1) do
      delete :destroy, id: @booking_visa
    end

    assert_redirected_to booking_visas_path
  end
end

require 'test_helper'

class TourEventsControllerTest < ActionController::TestCase
  setup do
    @tour_event = tour_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tour_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tour_event" do
    assert_difference('TourEvent.count') do
      post :create, tour_event: { description: @tour_event.description, title: @tour_event.title }
    end

    assert_redirected_to tour_event_path(assigns(:tour_event))
  end

  test "should show tour_event" do
    get :show, id: @tour_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tour_event
    assert_response :success
  end

  test "should update tour_event" do
    patch :update, id: @tour_event, tour_event: { description: @tour_event.description, title: @tour_event.title }
    assert_redirected_to tour_event_path(assigns(:tour_event))
  end

  test "should destroy tour_event" do
    assert_difference('TourEvent.count', -1) do
      delete :destroy, id: @tour_event
    end

    assert_redirected_to tour_events_path
  end
end
